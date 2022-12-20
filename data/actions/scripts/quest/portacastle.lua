function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=1008, y=1278, z=8} -- lugar

if getPlayerStorageValue(cid, 8749) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Clike no Báu")
		else
		if getPlayerLevel(cid) >= 120 then
                        doTeleportThing(cid, position)
		else
		if getPlayerLevel(cid) <= 120 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Clike no Báu")
		end
		end
end
	return TRUE
end