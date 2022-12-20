function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 6000 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Demon Armor.")
doPlayerAddItem(cid,2494,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6001 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Magic Sword")
doPlayerAddItem(cid,2400,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6002 then
queststatus = getPlayerStorageValue(cid, 6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Stonecutter's Axe .")
doPlayerAddItem(cid,2431,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6003 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu o Presente.")
doPlayerAddItem(cid,2160,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")

end
else
return 0
end

return 1
end