items = { 
[0] = {id = 2160, count = 60, chance = 1,6},
} 
function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 20000) then
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Você precisa de (20000 gold coins = 20k= 2 crystal coins) para apostar nessa máquina.")
return true
end
	for i = 0, #items do 
		if (items[i].chance == math.random(1, 40)) then 
			doPlayerAddItem(cid, 2160, 60) 
                        doPlayerRemoveMoney(cid, 20000)
			if i == 0 then
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') apostou na terceira máquina e ganhou 60 Crystal Coins.', MESSAGE_STATUS_CONSOLE_BLUE)
                        doSendAnimatedText(toPos,'Ganhou!', TEXTCOLOR_BLUE)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
			end
			doPlayerRemoveMoney(cid, 20000) 
else
        doSendAnimatedText(toPos,'Perdeu!', TEXTCOLOR_RED)
        doSendMagicEffect(getPlayerPosition(cid), 2)
	doPlayerRemoveMoney(cid, 20000)
end
end
end