function onUse(cid, item, fromPosition, itemEx, toPosition)
local position = {x=1282, y=1042, z=7} -- lugar

if getPlayerStorageValue(cid, 8749) == 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ja completou está quest!")
		else
		if getPlayerLevel(cid) >= 120 then
                        doTeleportThing(cid, position)
		else
		if getPlayerLevel(cid) <= 119 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Somento jogadores acima do level 120 podem entrar.")
		end
		end
end
	return TRUE
end