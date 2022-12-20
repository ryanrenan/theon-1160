items = { 
[0] = {id = 2160, count = 200, chance = 1,0},
} 
function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 50000) then
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Você precisa de (50000 gold coins = 50k= 5 crystal coins) para apostar nessa máquina.")
return true
end
	for i = 0, #items do 
		if (items[i].chance == math.random(1, 40)) then 
			doPlayerAddItem(cid, 2160, 200) 
                        doPlayerRemoveMoney(cid, 50000)
			if i == 0 then
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') apostou na quarta máquina e ganhou 200 Crystal Coins.', MESSAGE_STATUS_CONSOLE_BLUE)
                        doSendAnimatedText(toPos,'Ganhou!', TEXTCOLOR_BLUE)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
			end
			doPlayerRemoveMoney(cid, 50000) 
else
        doSendAnimatedText(toPos,'Perdeu!', TEXTCOLOR_RED)
        doSendMagicEffect(getPlayerPosition(cid), 2)
	doPlayerRemoveMoney(cid, 50000)
end
end
end