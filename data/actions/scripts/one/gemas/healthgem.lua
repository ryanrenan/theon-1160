function onUse(cid, item, fromPosition, itemEx, toPosition)
        if not isInArray({4, 8}, getPlayerVocation(cid)) then
                doPlayerSendTextMessage(cid,19,"Descupe, apenas knights podem usar essa gema!")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end

        if getCreatureMaxHealth(cid) > 1807735400 then
                doPlayerSendCancel(cid, "Desculpe, voc� j� atingiu o m�ximo de pontos de health.")
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                return true
        end

        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 100)
        doSendAnimatedText(getCreaturePosition(cid), "+100 HP!", TEXTCOLOR_RED)
        doPlayerSendTextMessage(cid,19,"Foi adicionado +100 HP em seu personagem permanentemente!")
        doSendMagicEffect(getCreaturePosition(cid), math.random(12,12))
        doRemoveItem(item.uid, 1)
        return true
end