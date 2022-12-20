local templo = {x=1031, y=1086, z=7} --arruma aqui o templo
function onAdvance(cid, skill, oldLevel, newLevel)
	if oldLevel <= 140 and newLevel >= 141 then
		doTeleportThing(cid, templo)
          doPlayerSendTextMessage(cid, 19, "Você foi teleportado para esse local, devido ao alcançe do nível 141.")
	end
	
	return true
end