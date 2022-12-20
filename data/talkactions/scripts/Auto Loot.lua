function setPlayerTableStorage(cid, storage, tab)
	local tabstr = "&"
	for i,x in pairs(tab) do
		tabstr = tabstr .. i .. "," .. x .. ";"
	end
	setPlayerStorageValue(cid, storage, tabstr:sub(1, #tabstr-1))
end

function getContainerItemsInfo(containerUid)
    local table = {}
    if containerUid and containerUid > 0 then
        local a = 0 
        for i = 0, getContainerSize(containerUid) do
            local item = getContainerItem(containerUid,i)
            a = a + 1
            table[a] = {uid = item.uid, itemid = item.itemid, quant = item.type}
        end
        return table
    end
    return false
end

function getPlayerTableStorage(cid, storage)
	local tabstr = getPlayerStorageValue(cid, storage)
	local tab = {}
	if type(tabstr) ~= "string" then
		return {}
	end
	if tabstr:sub(1,1) ~= "&" then
		return {}
	end
	local tabstr = tabstr:sub(2, #tabstr)
	local a = string.explode(tabstr, ";")
	for i,x in pairs(a) do
		local b = string.explode(x, ",")
		tab[tonumber(b[1]) or b[1]] = tonumber(b[2]) or b[2]
	end
	return tab
end

function countTable(t)
	local i = 0
	if type(t) == 'table' then
		for _, value in pairs(t) do
			i = i + 1
		end
	end
	return i
end


local function getPlayerStorageZero(cid, storage) -- By Killua
    local sto = tonumber(getPlayerStorageValue(cid, storage))
    return sto and sto > 0 and sto or 0
end


function ExistItemByName(name) -- by vodka
	if name == nil or name == "" then return false end
	local items = io.open("data/items/items.xml", "r"):read("*all")
	local get = items:match('name="' .. name ..'"')
	if get == nil or get == "" then
		return false
	end
	return true
end

local function getPlayerList(cid)
	local tab = {}
	for i = 1, 4 do
		local storageValue = getPlayerStorageValue(cid, 04420011 + (i * 10))
		if storageValue ~= -1 then
			table.insert(tab, storageValue)
		end
	end
	return #tab > 0 and tab or false
end

local function addToList(cid, name)
	local itemId = getItemIdByName(name)
	local playerList = getPlayerList(cid)
	if playerList and isInArray(playerList, itemid) then
		return false
	end
	for i = 1, 4 do
		local number = 04420011 + (i * 10)
		if getPlayerStorageValue(cid, number) == -1 then
			return doPlayerSetStorageValue(cid, number, itemId)
		end
	end
end

local function removeFromList(cid, name)
	local itemId = getItemIdByName(name)
	for i = 1, 4 do
		local number = 04420011 + (i * 10)
		if getPlayerStorageValue(cid, number) == itemId then
			return doPlayerSetStorageValue(cid, number, itemId)
		end
	end
	return false
end

function onSay(cid, words, param)
	if param == "" then
		local hasVip = math.floor((getPlayerStorageValue(cid,13540) - os.time())/(3600*24)) >= 0
		local autoLootSlots = {}
		for i = 1, 10 do
			autoLootSlots[i] = true
			if not hasVip and i > 5 then
				autoLootSlots[i] = false
			end
		end
		local fi = getPlayerStorageValue(cid, 04420021) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420021)) or ""
		local se = not hasVip and "N�o dispon�vel para free account" or getPlayerStorageValue(cid, 04420031) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420031)) or ""
		local th = not hasVip and "N�o dispon�vel para free account" or getPlayerStorageValue(cid, 04420041) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420041)) or ""
		local fo = not hasVip and "N�o dispon�vel para free account" or getPlayerStorageValue(cid, 04420051) ~= -1 and getItemNameById(getPlayerStorageValue(cid, 04420051)) or ""
		local stt = getPlayerStorageValue(cid, 04421011) == 1 and "sim" or "n�o"
		local str = getPlayerStorageValue(cid, 04421001) == 1 and "sim" or "n�o"
		doPlayerPopupFYI(cid, "{Auto-Loot} ---Menu Auto Loot\n ----------------\n{Auto-Loot} \n---Coletar dinheiro: "..stt..". Para ligar/desligar: !autoloot gold \n{Auto-Loot} ---Coletar itens �nicos: "..str..". Para ligar/desligar: !autoloot power\n{Auto-Loot} --Configura��o dos slots:\n{Auto-Loot} ---Slot 1: "..fi.."\n{Auto-Loot} ---Slot 2: "..se.."\n{Auto-Loot} ---Slot 3: "..th.."\n{Auto-Loot} ---Slot 4: "..fo.."\n{Auto-Loot} ---Para adicionar um novo item aos slots: !autoloot add, <nome do item>\n{Auto-Loot} ---Para retirar um item dos slots: !autoloot remove, <nome do item>\n{Auto-Loot} ---Para limpar todos os slots utilize: !autoloot clear\n{Auto-Loot} ---Para informa��es de quanto voc� j� fez utilizando a coleta de dinheiro, use: !autoloot goldinfo\n\nSe seu autoloot bugar use !autoloot desbug\n\n{Auto-Loot} ----------------")
		return true
	end
	
	local t = string.explode(param, ",")
	
	if t[1] == "power" then
		local check = getPlayerStorageValue(cid, 04421001) == -1 and "ligou" or "desligou"
		doPlayerSetStorageValue(cid, 04421001, getPlayerStorageValue(cid, 04421001) == -1 and 1 or -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� "..check.." o auto loot.")
	elseif t[1] == "gold" then
		local check = getPlayerStorageValue(cid, 04421011) == -1 and "ligou" or "desligou"
		doPlayerSetStorageValue(cid, 04421011, getPlayerStorageValue(cid, 04421011) == -1 and 1 or -1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� "..check.." a coleta de dinheiro.")
		doPlayerSetStorageValue(cid, 04421021, 0)
	elseif t[1] == "goldinfo" then
		local str = getPlayerStorageValue(cid, 04421011) == -1 and "O sistema de coleta de dinheiro est� desligado" or "O sistema j� coletou "..getPlayerStorageZero(cid, 04421021).." gold coins"
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, str)
	elseif t[1] == "add" then
		if ExistItemByName(t[2]) then
			local item = getItemIdByName(t[2])
			if isInArray({2160, 2148, 2152}, item) then
				return doPlayerSendCancel(cid, "Voc� n�o pode adicionar moedas no autoloot. Para coletar dinheiro use !autoloot gold")
			end
			if hasVip then
				if getPlayerStorageValue(cid, 04420011) < 3 then
					if addToList(cid, t[2]) then
						doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) + 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." adicionado � sua lista do auto loot! Para ver sua lista diga !autoloot list")
					else
						doPlayerSendCancel(cid, t[2].." j� est� em sua lista!")
					end
				else
					doPlayerSendCancel(cid, "Sua lista j� tem 4 itens! Voc� deve remover algum antes de adicionar outro.")
				end
			else
				if getPlayerStorageValue(cid, 04420011) == -1 then
					if addToList(cid, t[2]) then
						doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) + 1)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." adicionado � sua lista do auto loot! Para ver sua lista diga !autoloot")
					else
						doPlayerSendCancel(cid, t[2].." j� est� em sua lista!")
					end
				else
					doPlayerSendCancel(cid, "Voc� j� tem um item adicionado no auto loot! Para adicionar outro, voc� deve remover o item atual.")
				end
			end
		else
			doPlayerSendCancel(cid, "Este item n�o existe!")
		end
	elseif t[1] == "remove" then
		if ExistItemByName(t[2]) then
			if removeFromList(cid, t[2]) then
				doPlayerSetStorageValue(cid, 04420011, getPlayerStorageValue(cid, 04420011) - 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, t[2].." removido da sua lista do auto loot!")
			else
				doPlayerSendCancel(cid, "Este item n�o est� na sua lista!")
			end
		else
			doPlayerSendCancel(cid, "Este item n�o existe!")
		end
	elseif t[1] == "clear" then
		if getPlayerStorageValue(cid, 04420011) > -1 then
			for i = 1, 10 do
				doPlayerSetStorageValue(cid, 04420001 + (i * 10), -1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Lista limpa!")
		else
			doPlayerSendCancel(cid, "Sua lista ja esta limpa!")
		end
	elseif t[1] == "desbug" or t[1] == "desbugar" then
		for i = 1, 10 do
				doPlayerSetStorageValue(cid, 04420001 + (i * 10), -1)
			end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Desbugado!")
	elseif t[1] == "list" then
		local fi = getPlayerStorageValue(cid, 04420021) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420021)).."\n" or ""
		local se = getPlayerStorageValue(cid, 04420031) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420031)).."\n" or ""
		local th = getPlayerStorageValue(cid, 04420041) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420041)).."\n" or ""
		local fo = getPlayerStorageValue(cid, 04420051) ~= -1 and ""..getItemNameById(getPlayerStorageValue(cid, 04420051)).."\n" or ""
		doPlayerPopupFYI(cid, "O sistema auto loot est� coletando:\n "..fi..""..se..""..th..""..fo)
	end
	return true
end