local pos = {x = 1095, y = 1062, z = 7}
local minutos = 2

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    setPlayerStorageValue(cid, 29102, 1)
    addEvent(function()
        if getPlayerStorageValue(cid, 29102) == 1 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você falhou na anihilation.")
            doTeleportThing(cid, pos)
            setPlayerStorageValue(cid, 29102, 0)
        end
    end, minutos*60*1000)
    return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    doPlayerSetStorageValue(cid, 29102, 0)
    return true
end