function onLogin(cid)

	if getPlayerLevel(cid) < 120 then
	doPlayerAddExperience(cid, (getExperienceForLevel(120) - getPlayerExperience(cid)))
end
return TRUE
end