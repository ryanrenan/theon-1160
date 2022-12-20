function onUse(cid, item, fromPosition, itemEx, toPosition)
local mana = 2000

if isDruid(cid) or isSorcerer(cid) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + mana)
doCreatureAddMana(cid,mana)
doSendMagicEffect(getCreaturePosition(cid), 29)
doRemoveItem(item.uid, 1)
doSendAnimatedText(getThingPos(cid), "+2000 MP", 5)
else
doPlayerSendTextMessage(cid, 27, "Somente mages podem usar este item.")
end
return true
end 