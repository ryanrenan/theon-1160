function onUse(cid, item, fromPosition, itemEx, toPosition)
local mana = 2000

if isDruid(cid) or isSocerer(cid) then
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + mana)
doCreatureAddMana(cid,mana)
doSendMagicEffect(getCreaturePosition(cid), 29)
doRemoveItem(item.uid, 1)
doCreatureSay(cid, "+ 2000 MP", TALKTYPE_BLUE_1)
else
doPlayerSendTextMessage(cid, 27, "Apenas Mages podem usar este item.")
end
return true
end 