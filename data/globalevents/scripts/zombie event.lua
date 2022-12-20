local config = {
	playerCount = 2001, -- Global storage for counting the players left/entered in the event
	zombieCount = 2002, -- Global storage for counting the zombies in the event
	teleportActionId = 2000, -- Action id of the teleport needed for the movement script
	teleportPosition = {x = 1143, y = 1054, z = 7, stackpos = 1}, -- Where the teleport will be created
	teleportToPosition = {x = 1152, y = 1028, z = 7}, -- Where the teleport will take you
	teleportId = 1387, -- Id of the teleport
	timeToStartEvent = 1, -- Minutes, after these minutes the teleport will be removed and the event will be declared started
	timeBetweenSpawns = 5, -- Seconds between each spawn of zombie
	zombieName = "Event zombie", -- Name of the zombie that should be summoned
	playersNeededToStartEvent = 5, -- Players needed before the zombies can spawn.
        walls = {x = 1189, y = 1044, z = 7,  stackpos = 1},
	
	-- Should be the same as in the creaturescript!
	-- The zombies will spawn randomly inside this area
	fromPosition = {x = 1136, y = 1022, z = 7}, -- top left cornor of the playground
	toPosition = {x = 1163, y = 1040, z = 7}, -- bottom right cornor of the playground
	}

function onThink()
	local tp = doCreateTeleport(config.teleportId, config.teleportToPosition, config.teleportPosition)
	doItemSetAttribute(tp, "aid", config.teleportActionId)
	doBroadcastMessage("EVENTO ZUMBI MENSAGEM: O evento 'Zumbi' começará em 2 minutos. O portal será fechado quando o evento começar.", MESSAGE_STATUS_CONSOLE_BLUE)
        doRemoveItem(getThingFromPos(config.walls).uid, 1)
	setGlobalStorageValue(config.playerCount, 0)
	setGlobalStorageValue(config.zombieCount, 0)
	addEvent(startEvent, config.timeToStartEvent * 1000 * 60)
	print(getGlobalStorageValue(2001))
end

function startEvent()
	local get = getThingfromPos(config.teleportPosition)
	if get.itemid == config.teleportId then
		doRemoveItem(get.uid, 1)
                doCreateItem(9486, 1, config.walls)
	end
	
	local fromp, top = config.fromPosition, config.toPosition

	if getGlobalStorageValue(config.playerCount) >= config.playersNeededToStartEvent then
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
		doBroadcastMessage("EVENTO ZUMBI MENSAGEM: Boa sorte no evento 'Zumbi' jogadores! O portal foi fechado! E o primeiro zumbi aparecerá em 5 segundos.", MESSAGE_STATUS_CONSOLE_BLUE)
                doCreateItem(9486, 1, config.walls)
		
		for x = fromp.x, top.x do
			for y = fromp.y, top.y do
				for z = fromp.z, top.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then
						doBroadcastMessage(getPlayers.uid, "EVENTO ZUMBI MENSAGEM: O primeiro zumbie vai aparecer em " .. config.timeBetweenSpawns .. " segundos. Boa sorte!", MESSAGE_STATUS_CONSOLE_BLUE)
					end
				end
			end
		end
	else
		doBroadcastMessage("EVENTO ZUMBI MENSAGEM: O evento 'Zumbi' não pode ser iniciado pelo pequeno número de jogadores participando. No mínimo " .. config.playersNeededToStartEvent .. " jogadores é necessário!", MESSAGE_STATUS_CONSOLE_BLUE)
                doCreateItem(9486, 1, config.walls)
		for x = fromp.x, top.x do
			for y = fromp.y, top.y do
				for z = fromp.z, top.z do
					areapos = {x = x, y = y, z = z, stackpos = 253}
					getPlayers = getThingfromPos(areapos)
					if isPlayer(getPlayers.uid) then
						doTeleportThing(getPlayers.uid, getTownTemplePosition(getPlayerTown(getPlayers.uid)), false)
						doSendMagicEffect(getPlayerPosition(getPlayers.uid), CONST_ME_TELEPORT)
					end
				end
			end
		end
	end
end

function spawnZombie()
	if getGlobalStorageValue(config.playerCount) >= 2 then
		pos = {x = math.random(config.fromPosition.x, config.toPosition.x), y = math.random(config.fromPosition.y, config.toPosition.y), z = math.random(config.fromPosition.z, config.toPosition.z)}
		doSummonCreature(config.zombieName, pos)
		doSendMagicEffect(pos, CONST_ME_MORTAREA)
		setGlobalStorageValue(config.zombieCount, getGlobalStorageValue(config.zombieCount)+1)
		doBroadcastMessage("EVENTO ZUMBI MENSAGEM: Um novo zumbi apareceu! Agora temos: " .. getGlobalStorageValue(config.zombieCount) .. " zumbis no evento!", MESSAGE_STATUS_CONSOLE_BLUE)
		addEvent(spawnZombie, config.timeBetweenSpawns * 1000)
	end
end