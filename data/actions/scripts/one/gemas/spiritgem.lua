function onUse(cid, item, fromPosition, itemEx, toPosition)
if not isInArray({3, 7}, getPlayerVocation(cid)) then
doPlayerSendTextMessage(cid,19,"Descupe, apenas paladins podem usar essa gema!")
doSendMagicEffect(fromPosition, CONST_ME_POFF)
return true
end
if getCreatureMaxMana(cid) > 1807735400 then
doPlayerSendCancel(cid, "Desculpe, você já atingiu o máximo de pontos de mana.")
doSendMagicEffect(fromPosition, CONST_ME_POFF)
return true
end
setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 50)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 50)
doPlayerSendTextMessage(cid,19,"Foi adicionado +50 de HP e +50 de MP em seu personagem permanentemente!")
doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
doSendAnimatedText(getCreaturePosition(cid), "+50HP/MP", TEXTCOLOR_YELLOW)
doRemoveItem(item.uid, 1)
return true
end