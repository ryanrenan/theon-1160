function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=1088, y=1124, z=7} -- lugar

if getPlayerStorageValue(cid, 8749) == 1 then
			doPlayerSendTextMessage(cid, 19, "Você já completou a quest da fishing rod e picareta.")
		else
if getPlayerLevel(cid) <= 119 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Apenas níveis 120+ podem acessar a quest da fishing rod e picareta.")
return true
end
                        doTeleportThing(cid, position)
			doPlayerSendTextMessage(cid, 19, "Boa sorte você acabou de entra na quest da fishing rod e picareta.")
		end
	return TRUE
end