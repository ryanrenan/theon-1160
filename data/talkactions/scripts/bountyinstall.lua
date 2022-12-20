function onSay(cid, words, param)
	local func = db.query or db.executeQuery
	if not func then
		doPlayerSendTextMessage(cid, 27, 'Omega Bounty Hunter System installation failed.')
	elseif func("ALTER TABLE `players` ADD `bounty` INT(15) NOT NULL DEFAULT 0") then
		doPlayerSendTextMessage(cid, 27, 'Omega Bounty Hunter System installation sucessful!.')
	else
		doPlayerSendTextMessage(cid, 27, 'Omega Bounty Hunter System installation failed.')
	end
	return true
end