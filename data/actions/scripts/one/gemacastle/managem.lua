function onUse(cid, item, fromPosition, itemEx, toPosition)
        if not isInArray({1, 2, 5, 6}, getPlayerVocation(cid)) then
                doPlayerSendTextMessage(cid,19,"Descupe, apenas druids e sorcerers podem usar essa gema!")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end

        if getCreatureMaxMana(cid) > 1807735400 then
                doPlayerSendCancel(cid, "Desculpe, você já atingiu o máximo de pontos de mana.")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end

        setCreatureMaxMana(cid, getCreatureMaxMana(cid) + 6000)
        doSendAnimatedText(getCreaturePosition(cid), "+6k MP!", TEXTCOLOR_BLUE)
        doPlayerSendTextMessage(cid,19,"Foi adicionado +6k MP em seu personagem permanentemente!")
        doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
        doRemoveItem(item.uid, 1)
        return true
end