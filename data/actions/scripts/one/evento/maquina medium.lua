items = { 
[0] = {id = 2160, count = 10, chance = 2,5},
} 
function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 5000) then
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Você precisa de (5000 gold coins = 5k= 50 platinum coins) para apostar nessa máquina.")
return true
end
	for i = 0, #items do 
		if (items[i].chance == math.random(1, 20)) then 
			doPlayerAddItem(cid, 2160, 10) 
                        doPlayerRemoveMoney(cid, 5000)
			if i == 0 then
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') apostou na segunda máquina e ganhou 10 Crystal Coins.', MESSAGE_STATUS_CONSOLE_BLUE)
                        doSendAnimatedText(toPos,'Ganhou!', TEXTCOLOR_BLUE)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
			end
			doPlayerRemoveMoney(cid, 5000) 
else
        doSendAnimatedText(toPos,'Perdeu!', TEXTCOLOR_RED)
        doSendMagicEffect(getPlayerPosition(cid), 2)
	doPlayerRemoveMoney(cid, 5000)
end
end
end