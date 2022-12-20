local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 29)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 40, 40, 45, 40)
local area = createCombatArea(AREA_CIRCLE3X3)

local condition = createConditionObject(CONDITION_POISON)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

addDamageCondition(condition, 10, 2000, -5000)
setCombatCondition(combat, condition)

setCombatArea(combat, area)


function onCastSpell(cid, var)
	
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Uma explosão de veneno foi ativado, deixando seu alvo envenenado por 20 segundos. O cálculo do dano é baseado seu nível mágico.")
return doCombat(cid, combat, var)
end
