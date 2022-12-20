function onLogin(cid)
local rebalanceStor = getPlayerStorageValue(cid, 37454)

	if rebalanceStor == -1 and getPlayerLevel(cid) >= 500 then
        doPlayerAddExperience(cid, (getExperienceForLevel(500) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)

	elseif rebalanceStor == -1 and getPlayerLevel(cid) > 500 and getPlayerLevel(cid) < 500 then
	doPlayerAddExperience(cid, (getExperienceForLevel(550) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)

	elseif rebalanceStor == -1 and getPlayerLevel(cid) < 500 then
	doPlayerAddExperience(cid, (getExperienceForLevel(500) - getPlayerExperience(cid)))
	setPlayerStorageValue(cid, 37454, 1)
	
	else setPlayerStorageValue(cid, 37454, 1)

end
return TRUE
end