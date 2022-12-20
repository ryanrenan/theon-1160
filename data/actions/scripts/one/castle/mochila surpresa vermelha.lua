local default = 2160, 2159 -- Quanto de experience o player irá ganhar?!
local exhaust = 0 -- Tempo para o player poder usar o item novamente! (tempo em segundos)
local storage = 9811 -- Não mexa aqui caso nao saiba ou seja iniciante.

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local bp = doPlayerAddItem(cid,2000,1)
	local fire = math.random(10, 50)
        local ice = math.random(10, 50)
        local terra = math.random(10, 50)
        local energy = math.random(10, 50)
        local holy = math.random(5, 45)
        local eventcoin = math.random(4, 15)
        doAddContainerItem(bp, 6542, fire)
        doAddContainerItem(bp, 6543, ice)
        doAddContainerItem(bp, 6544, terra)
        doAddContainerItem(bp, 6545, energy)
        doAddContainerItem(bp, 6541, holy)
        doAddContainerItem(bp, 2159, eventcoin)
            if (getPlayerStorageValue(cid, storage) <= os.time()) then
            doRemoveItem(cid, item.uid, 1)
            setPlayerStorageValue(cid, storage, os.time()+exhaust)
	    doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") abriu uma mochila surpresa vermelha e ganhou " .. holy .. " holy pets, " .. fire .. " fire pets, " .. ice .. " ice pets, " .. terra .. " terra pets, " .. energy .. " energy pets e " .. eventcoin .. " event coins.", 19)
        else
            doPlayerSendCancel(cid, "Desculpe, você só pode usar novamente este item depois de "..exhaust.." segundos.")
        end
    return TRUE
end