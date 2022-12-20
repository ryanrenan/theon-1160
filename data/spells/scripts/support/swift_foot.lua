local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local conditionHaste = createConditionObject(CONDITION_HASTE)

setConditionParam(conditionHaste, CONDITION_PARAM_TICKS, 10000)
setConditionFormula(conditionHaste, 0.8, 0, 0.8, 0)

setCombatCondition(combat, conditionHaste)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
