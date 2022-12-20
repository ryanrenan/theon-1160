-- Script feito por Zaruss

function onUse(cid, item, fromposition, itemEx, toposition)
item1 = 8298 -- id do item que vai vim muito facil
item2 = 8299 -- id do item que vai vim facil
item3 = 8301 -- id do item que vai vim medio
item4 = 8302 -- id do item que vai vim dificil
item5 = 8303 -- id do item que vai vim super dificil
item6 = 9971 -- id do item que vai vim quase impossivel
tanto = math.random(1, 3)
porcentagem = 0 -- nao sei
puff = 302 -- e akilo ali que e a chance de nao vim nada deixei nenhuma e so altera pra um valor maior
pick = math.random(1, 100) -- nao sei
rand = math.random(1, puff)

if getPlayerLevel(cid) <= 124 then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa de level 125 ou maior para minerar!")
return true
end

if(itemEx.itemid >= 1353 and itemEx.itemid <= 1354 or itemEx.itemid == 1355) then
if getPlayerLevel(cid) >= 125 then
if getPlayerStorageValue(cid,8749) == 1 then
	if pick >= porcentagem then
	if rand >= 1 and rand <= 200 then
		doSendAnimatedText(toposition,'MINERANDO',18)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item1,tanto)
	elseif rand >= 201 and rand <= 289 then
		doSendAnimatedText(toposition,'MINERANDO',129)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item2,tanto)
	elseif rand >= 290 and rand <= 295 then
		doSendAnimatedText(toposition,'MINERANDO',210)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item3,tanto)
	elseif rand >= 296 and rand <= 298 then
		doSendAnimatedText(toposition,'MINERANDO',5)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item4,tanto)
	elseif rand >= 299 and rand <= 301 then
		doSendAnimatedText(toposition,'MINERANDO',152)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item5,tanto)
	elseif rand == 302 then
		doSendAnimatedText(toposition,'MINERANDO',205)
		doSendMagicEffect(toposition,3)
		doPlayerAddItem(cid,item6,tanto)
else
		doSendAnimatedText(toposition,'Tuff',120)
		doSendMagicEffect(toposition,2)
	end
	end
end
end
end
return true
end
