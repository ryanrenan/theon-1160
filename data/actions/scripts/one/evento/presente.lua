local default = 2160 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,2002,1)
	local tanto = math.random(1000, 2000)
        doAddContainerItem(bp, 2160, tanto)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
	    doPlayerSendTextMessage(cid, 19, "Ganhou dinheirinho nooooooooooooob.")
        else
            doPlayerSendTextMessage(cid, 19, "Ganhou dinheirinho nooooooooooooob.")
        end
    return TRUE
end