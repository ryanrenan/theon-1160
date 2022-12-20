local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 40)

local percent = 15 --porcentagem que ir� drenar.
local exhaust = 10 --tempo em segundos para usar a magia de novo.


function onCastSpell(cid, var)
	local enemy = getCreatureTarget(cid)
	local enemyHealth = (getCreatureHealth(enemy) / 100 * percent)
	if exhaustion.get(cid, 10223) then
	return false 
	end
	if getCreatureHealth(enemy) >= enemyHealth then
	doCreatureAddHealth(enemy, -(enemyHealth))
	doCreatureAddHealth(cid, enemyHealth)
	exhaustion.set(cid, 10223, exhaust)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Uma drenagem de health foi ativada, retirando 30% de life do sua vitima e crescentando a voc�.")
        return doCombat(cid, combat, var)
	else
		enemyHealth = getCreatureHealth(enemy)
		doCreatureAddHealth(enemy, -enemyHealth)
		doCreatureAddHealth(cid, enemyHealth)
		exhaustion.set(cid, 10223, exhaust)
	end
return true
end