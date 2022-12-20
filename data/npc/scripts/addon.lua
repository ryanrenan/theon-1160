local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)		    npcHandler:onCreatureAppear(cid)		    end
function onCreatureDisappear(cid)	    npcHandler:onCreatureDisappear(cid)		    end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()					    npcHandler:onThink()					    end

npcHandler:setMessage(MESSAGE_GREET, "Oi |PLAYERNAME|. Gostaria de comprar addons? Diga {roupas} para saber quais addons comprar. Diga {ajuda} para saber como comprar o addon desejado.")

function playerBuyAddonNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('Oi! Vendo roupas elegantes venha comprar aqui!') -- msg que vai sair do npc
end
if rand == 2 then
selfSay ('Só entendo português, diga oi.')
end
if rand == 3 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


if (parameters.confirm ~= true) and (parameters.decline ~= true) then
if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == false) then
npcHandler:say('Você não é premium!', cid)
npcHandler:resetNpc()
return true
end
if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
npcHandler:say('Você tem essa roupa, escolha outra!', cid)
npcHandler:resetNpc()
return true
end
local itemsTable = parameters.items
local items_list = ''
if table.maxn(itemsTable) > 0 then
for i = 1, table.maxn(itemsTable) do
local item = itemsTable[i]
items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
if i ~= table.maxn(itemsTable) then
items_list = items_list .. ', '
end
end
end
local text = ''
if (parameters.cost > 0) and table.maxn(parameters.items) then
text = items_list .. ' and ' .. parameters.cost .. ' gp'
elseif (parameters.cost > 0) then
text = parameters.cost .. ' gp'
elseif table.maxn(parameters.items) then
text = items_list
end
npcHandler:say('Você quer trocar ' .. text .. ' pelo ' .. keywords[1] .. '?', cid)
return true
elseif (parameters.confirm == true) then
local addonNode = node:getParent()
local addoninfo = addonNode:getParameters()
local items_number = 0
if table.maxn(addoninfo.items) > 0 then
for i = 1, table.maxn(addoninfo.items) do
local item = addoninfo.items[i]
if (getPlayerItemCount(cid,item[1]) >= item[2]) then
items_number = items_number + 1
end
end
end
if(getPlayerMoney(cid) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
doPlayerRemoveMoney(cid, addoninfo.cost)
if table.maxn(addoninfo.items) > 0 then
for i = 1, table.maxn(addoninfo.items) do
local item = addoninfo.items[i]
doPlayerRemoveItem(cid,item[1],item[2])
end
end
doPlayerAddOutfit(cid, addoninfo.outfit_male, addoninfo.addon)
doPlayerAddOutfit(cid, addoninfo.outfit_female, addoninfo.addon)
setPlayerStorageValue(cid,addoninfo.storageID,1)
npcHandler:say('obrigado, use a nova roupa.', cid)
else
npcHandler:say('Você não tem chave de addons.', cid)
end
npcHandler:resetNpc()
return true
elseif (parameters.decline == true) then
npcHandler:say('Você não gostou dessa roupa? escolha outra.', cid)
npcHandler:resetNpc()
return true
end
return false
end

local noNode = KeywordNode:new({'nao'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'sim'}, playerBuyAddonNPC, {confirm = true})

-- morador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon morador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10001})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon moradora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 10001})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon morador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10002})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon moradora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 10002})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- explorador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon explorador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10003})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon exploradora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 10003})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon explorador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10004})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon exploradora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 10004})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- cavaleiro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon cavaleiro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10005})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon cavaleira'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 10005})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon cavaleiro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10006})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon cavaleira'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 10006})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mago (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon mago'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10007}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon maga'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 10007}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 
local outfit_node = keywordHandler:addKeyword({'segundo addon mago'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10008}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon maga'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 10008}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode) 


-- invocador (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon invocador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10009}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon invocadora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 10009}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)  
local outfit_node = keywordHandler:addKeyword({'segundo addon invocador'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10010}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon invocadora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 10010}) 
outfit_node:addChildKeywordNode(yesNode) 
outfit_node:addChildKeywordNode(noNode)  


-- barbaro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon barbaro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon barbara'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 10011})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon barbaro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon barbara'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 10012})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- druid (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 10013})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 10014})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- nobre (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon nobre'}, playerBuyAddonNPC, {premium = true, cost = 0, items = {{2090,1}}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 10015})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon nobre'}, playerBuyAddonNPC, {premium = true, cost = 0, items = {{2090,2}}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 10016})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- oriental (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 10017})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 10018})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- guerreiro (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon guerreiro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon guerreira'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 10019})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon guerreiro'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon guerreira'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 10020})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- bruxo (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon bruxo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon bruxa'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 10021})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon bruxo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon bruxa'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 10022})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- assassino (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon assassino'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon assassina'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 10023})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon assassino'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon assassina'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 10024})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mendigo (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon mendigo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon mendiga'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 10025})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon mendigo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon mendiga'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 10026})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- pirata (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon pirata'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 10027})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon pirata'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 10028})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- page (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon page'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 10029})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon page'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 10030})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- nordico (done)
local outfit_node = keywordHandler:addKeyword({'primeiro addon nordico'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon nordica'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 10031})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon nordico'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon nordica'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 10032})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- bozo (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon bozo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon boza'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 10033})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon bozo'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon boza'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 10034})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- infernal (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon infernal'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 288, outfit_male = 289, addon = 1, storageID = 10035})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon infernal'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 288, outfit_male = 289, addon = 2, storageID = 10036})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- defensor (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon defensor'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'primeiro addon defensora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 10037})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon defensor'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon defensora'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 10038})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- morte (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon morte'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 136, outfit_male = 278, addon = 1, storageID = 10039})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon morte'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 136, outfit_male = 278, addon = 2, storageID = 10040})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- yalahar (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon yalahar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 324, outfit_male = 325, addon = 1, storageID = 10041})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon yalahar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 324, outfit_male = 325, addon = 2, storageID = 10042})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

-- mestre (done)(custom)
local outfit_node = keywordHandler:addKeyword({'primeiro addon mestre'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,1}}, outfit_female = 336, outfit_male = 335, addon = 1, storageID = 10043})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'segundo addon mestre'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2090,2}}, outfit_female = 336, outfit_male = 335, addon = 2, storageID = 10044})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)

keywordHandler:addKeyword({'roupas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Eu posso te oferecer o \'primeiro\' e \'segundo\'addons das seguintes roupas: Morador(a), Explorador(a), Mago(a), Cavaleiro(a), Nobre, Invocador(a), Guerreiro(a), Barbaro(a), Druida, Bruxo(a), Oriental, Pirata, Assassino(a), Mendigo(a), Page, Nordico(a), Defensor(a), Bozo(a), Morte, Infernal, Yalahar e Mestre.'})
keywordHandler:addKeyword({'ajuda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = false, text = 'Basta dizer \'primeiro addon explorador\' ou  \'segundo addon explorador\'. No lugar de \'explorador\' coloque o nome da roupa que deseja. Assumindo que tenha todos os itens requeridos, diga \'sim\' para completar sua troca!'})

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:addModule(FocusModule:new())