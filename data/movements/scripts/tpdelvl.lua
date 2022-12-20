local posi = {x=1099, y=1135, z=7} -- Posicao pra onde vai o player
local volta = {x=1095, y=1061, z=8} -- Posicao pra onde o player vai se teleportado caso nao tenha lvl ou seja maior

function onStepIn(cid, item, position, lastPosition, fromPosition)

         if getPlayerLevel(cid) < 141 then

            doTeleportThing(cid, posi)
            doPlayerSendTextMessage(cid, 19, "Você entrou na zona 120~140.")

            doSendMagicEffect(getThingPos(cid), 10)

         else

             doPlayerSendTextMessage(cid, 19, "Apenas níveis 120~140 podem acessar essa área.")

             doTeleportThing(cid, volta)
             doSendMagicEffect(getThingPos(cid), 10)

         end

end