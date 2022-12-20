local rooms = {
	[1000] = {
		from = {x = 1081, y = 1081, z = 9},
		to = {x = 1081, y = 1083, z = 9},
		inside = {x = 1082, y = 1084, z = 9}
	}
}

--[[
	Para configurar novas salas, siga o modelo abaixo:
	
	local rooms = {
		[1000] = {
			from = {x = 1082, y = 1081, z = 9},
			to = {x = 1082, y = 1083, z = 9},
			inside = {x = 1082, y = 1084, z = 9}
		}, -- N�o esque�a de separar cada um com uma v�rgula
		[ACTION ID] = 10473 {
			from = {x = 1083, y = 1081, z = 9}, -- Coordenada do canto superior esquerdo da sala
			to = {x = 1083, y = 1083, z = 9}, -- Coordenada do canto inferior direito da sala
			inside = {x = 1082, y = 1084, z = 9} -- Coordenada para onde o jogador ser� teleportado
		}
	}
	
]]--
	

function onUse(cid, item, fromPosition, item2, toPosition)
	if rooms[item2.actionid] then
		if #getSpectatorsFromArea(rooms[item2.actionid].from, rooms[item2.actionid].to) == 1 then
			doTeleportThing(cid, rooms[item2.actionid].inside)
		else
			doPlayerSendCancel(cid, "H� algu�m dentro da sala")
		end
	else
		doPlayerSendCancel(cid, "Voc� n�o deve usar este item aqui")
	end
	return true
end