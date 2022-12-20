local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 5)
                     doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, 0)
                     doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, 0)
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
	end

           local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Porfavor escolha uma roupa."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, digite 'account' para gerenciar sua conta e, se você quiser começar de novo em seguida, digite 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Olá, digite 'account' para criar uma conta ou 'recover' para recuperar uma conta.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end


     registerCreatureEvent(cid, "kill")
     registerCreatureEvent(cid, "AntiMc")
     registerCreatureEvent(cid, "142")
     registerCreatureEvent(cid, "Playeradvance")
     registerCreatureEvent(cid, "onPrepareDeath")
     registerCreatureEvent(cid, "PlayerLogout")
     registerCreatureEvent(cid, "onPrepareDeath")
     registerCreatureEvent(cid, "deathBroadcast")
     registerCreatureEvent(cid, "zombieevent")
     registerCreatureEvent(cid, "fullmh")
     registerCreatureEvent(cid, "CheckStorage")
     registerCreatureEvent(cid, "fraglook")
     registerCreatureEvent(cid, "DeathBroadcast")
     registerCreatureEvent(cid, "tp")
     registerCreatureEvent(cid, "ProtectLevel")
     registerCreatureEvent(cid, "PartyAttack")
     registerCreatureEvent(cid, "WeaponPar")
     registerCreatureEvent(cid, "autoloot")
     registerCreatureEvent(cid, "Auto Loot")
     registerCreatureEvent(cid, "ExpHit")

	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	registerCreatureEvent(cid, "ReportBug")
	return true
end
