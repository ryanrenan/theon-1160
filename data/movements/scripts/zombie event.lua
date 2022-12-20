local config = {
	playerCount = 2001, -- Global storage for counting the players in the event
	maxPlayers = 30, -- Max players who can participate
}
	
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if getGlobalStorageValue(config.playerCount) < config.maxPlayers then
		setGlobalStorageValue(config.playerCount, getGlobalStorageValue(config.playerCount)+1)
		if getGlobalStorageValue(config.playerCount) == config.maxPlayers then
			doBroadcastMessage("O evento 'Zumbi' foi lotado! E começerá em alguns instantes.", MESSAGE_STATUS_CONSOLE_BLUE)
		else	
			doBroadcastMessage("O jogador (" .. getPlayerName(cid) .. ") entrou no evento 'Zumbi'! Atualmente " .. getGlobalStorageValue(config.playerCount) .. " jogadores entraram!", MESSAGE_STATUS_CONSOLE_BLUE)
                        doBroadcastMessage("Restando "..config.maxPlayers - getGlobalStorageValue(config.playerCount).." jogadores para entrar!", MESSAGE_STATUS_CONSOLE_BLUE)
		end	
	else
                addEvent(tpBack, 1000, cid, fromposition)
		doPlayerSendCancel(cid, "")
                doBroadcastMessage("[EVENTO ZUMBI MENSAGEM] está cheio. Já existe " .. config.maxPlayers .. " jogadores participando.", MESSAGE_STATUS_CONSOLE_ORANGE)
		return false
	end
        print(getStorage(config.playerCount) .. " Players in the zombie event.")
	return true
end

function tpBack(cid, fromPosition)
	doTeleportThing(cid, fromPosition, true)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
end