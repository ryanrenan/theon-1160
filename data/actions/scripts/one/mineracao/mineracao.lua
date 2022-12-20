-- Script feito por Zaruss

function onUse(cid, item, fromposition, itemEx, toposition)
item1 = 8298 -- id do item que vai vim muito facil
item2 = 8299 -- id do item que vai vim facil
item3 = 8301 -- id do item que vai vim medio
item4 = 8302 -- id do item que vai vim dificil
item5 = 8303 -- id do item que vai vim super dificil
item6 = 9971 -- id do item que vai vim quase impossivel
tanto = math.random(3)
ingot = math.random(2)
porcentagem = 0 -- nao sei
puff = 350 -- e akilo ali que e a chance de nao vim nada deixei nenhuma e so altera pra um valor maior
pick = math.random(1, 100) -- nao sei
rand = math.random(1, puff)

if getPlayerLevel(cid) <= 119 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem nível 120+ para ter acesso a mineração!")
return true
end

if(itemEx.itemid >= 1353 and itemEx.itemid <= 1354 or itemEx.itemid == 1355) then
if getPlayerLevel(cid) >= 120 then
if getPlayerStorageValue(cid,8749) == 1 then
	if pick >= porcentagem then
	if rand >= 30 and rand <= 100 then
		doSendAnimatedText(toposition,'SUCESSO!',139)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. tanto .. " pedra(s) de refinamento nível 1")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item1,tanto)
	elseif rand >= 101 and rand <= 150 then
		doSendAnimatedText(toposition,'SUCESSO!', TEXTCOLOR_GREY)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. tanto .. " pedra(s) de refinamento nível 2")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item2,tanto)
	elseif rand >= 151 and rand <= 175 then
		doSendAnimatedText(toposition,'SUCESSO!',210)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. tanto .. " pedra(s) de refinamento nível 3")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item3,tanto)
	elseif rand >= 176 and rand <= 186 then
		doSendAnimatedText(toposition,'SUCESSO!',64)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. tanto .. " pedra(s) de refinamento nível 4")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item4,tanto)
	elseif rand >= 187 and rand <= 195 then
		doSendAnimatedText(toposition,'SUCESSO!', TEXTCOLOR_PURPLE)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. tanto .. " pedra(s) de refinamento nível 5")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item5,tanto)
	elseif rand >= 196 and rand <= 197 then
		doSendAnimatedText(toposition,'Ouro!', 208)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você adquiriu " .. ingot .. " gold ingot(s)")
                doSendMagicEffect(toposition,12)
		doPlayerAddItem(cid,item6,ingot)
else
		doSendAnimatedText(toposition,'FALHOU!', TEXTCOLOR_RED)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua mineração falhou. Tente novamente ")
                doSendMagicEffect(toposition,2)
	end
	end
end
end
end
return true
end
