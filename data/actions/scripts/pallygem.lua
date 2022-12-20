function onUse(cid, item, fromPosition, itemEx, toPosition)
local Life = 500
local mana = 500

if isPaladin(cid) then
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 500)
doCreatureAddHealth(cid,500)
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 500)
doCreatureAddMana(cid,500)
doSendAnimatedText(getThingPos(cid), "+500/500 HP/MP ", 210)
doSendMagicEffect(getCreaturePosition(cid), 29)
doRemoveItem(item.uid, 1)
else
doPlayerSendTextMessage(cid, 27, "Somente paladins podem usar este item.")
end
return true
end