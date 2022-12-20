local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)

setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1492)


setCombatParam(combat, COMBAT_PARAM_EFFECT, 6)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

addDamageCondition(condition, 10, 2000, -10000)
setCombatCondition(combat, condition)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80, -40, -80, -40, 1, 1, 1.4, 1.1)


function onCastSpell(cid, var)

doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Uma explos�o flamejante foi ativado, queimando seu inimigo por 20 segundos. O c�lculo do dano � baseado seu n�vel m�gico.")
	return 
doCombat(cid, combat, var)

end
