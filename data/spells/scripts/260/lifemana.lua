local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, 12)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 4)


local percent = 15 --porcentagem que irá drenar.
local exhaust = 10 --tempo em segundos para usar a magia de novo.


function onCastSpell(cid, var)
	local enemy = getCreatureTarget(cid)
	local enemyMana = (getCreatureMana(enemy) / 100 * percent)
	local enemyHealth = (getCreatureHealth(enemy) / 100 * percent)
	if exhaustion.get(cid, 10223) then
	return false 
	end
	if getCreatureMana(enemy) >= enemyMana then
	if getCreatureHealth(enemy) >= enemyHealth then
	doCreatureAddMana(enemy, -enemyMana)
	doCreatureAddHealth(enemy, -(enemyHealth))
	doCreatureAddMana(cid, enemyMana)
	doCreatureAddHealth(cid, enemyHealth)
	exhaustion.set(cid, 10223, exhaust)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Uma drenagem de mana foi ativado, retirando 15% de mana do sua vitima e crescentando a você.")
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Uma drenagem de health foi ativada, retirando 30% de life do sua vitima e crescentando a você.")
        return doCombat(cid, combat, var)
	else
		enemyMana = getCreatureMana(enemy)
		enemyHealth = getCreatureHealth(enemy)
		doCreatureAddMana(enemy, -enemyMana)
		doCreatureAddHealth(enemy, -enemyHealth)
		doCreatureAddMana(cid, enemyMana)
		doCreatureAddHealth(cid, enemyHealth)
		exhaustion.set(cid, 10223, exhaust)
	end
return true
end 