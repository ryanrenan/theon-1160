function onUse(cid, item, fromPosition, itemEx, toPosition)
 
if isKnight(cid) then
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 1000)
doCreatureAddHealth(cid,1000)
doSendAnimatedText(getThingPos(cid), "+1000 HP", 180)
doSendMagicEffect(getCreaturePosition(cid), 29)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, 27, "Somente knights podem usar este item.")
end
return true
end