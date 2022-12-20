-- [( Script created by Doidin for XTibia.com )] --

local exp = 1500000 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui.

function onUse(cid, item, fromPosition, itemEx, toPosition)
if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doPlayerAddExp(cid, exp)
            doPlayerSendTextMessage(cid,20,"Você recebeu " .. exp .. " pontos de experiência.")
            doSendAnimatedText(getPlayerPosition(cid), "SCROLL !", TEXTCOLOR_YELLOW)
            doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end