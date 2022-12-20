function onUse(cid, item)

if (isPremium(cid)) then

if (getPlayerVocation(cid) >= 5 and getPlayerVocation(cid) <=8) then

doPlayerSendTextMessage(cid,25,"Voce ja foi promovido!")

else

doRemoveItem(item.uid, 1) -- remove o promotion scroll

doPlayerSendTextMessage(cid,25,"Voce foi promovido com sucesso!")

doPlayerSetVocation(cid, getPlayerVocation(cid)+4)

end

end

end