items = { 
[0] = {id = 2160, count = 2, chance = 5},
} 
function onUse(cid, item, fromPos, itemEx, toPos)
if(getPlayerMoney(cid) < 2000) then
doPlayerSendCancel(cid,"")
doPlayerSendTextMessage(cid,19,"Você precisa de (2000 gold coins = 2k= 20 platinum coins) para apostar nessa máquina.")
return true
end
	for i = 0, #items do 
		if (items[i].chance == math.random(1, 10)) then 
			doPlayerAddItem(cid, 2160, 2) 
                        doPlayerRemoveMoney(cid, 2000)
			if i == 0 then
				doBroadcastMessage('CASSINO MENSAGEM: O jogador (' .. getCreatureName(cid) .. ') apostou na primeira máquina e ganhou 2 Crystal Coins.', MESSAGE_STATUS_CONSOLE_BLUE)
                        doSendAnimatedText(toPos,'Ganhou!', TEXTCOLOR_BLUE)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
			end
			doPlayerRemoveMoney(cid, 2000) 
else
        doSendAnimatedText(toPos,'Perdeu!', TEXTCOLOR_RED)
        doSendMagicEffect(getPlayerPosition(cid), 2)
	doPlayerRemoveMoney(cid, 2000)
end
end
end