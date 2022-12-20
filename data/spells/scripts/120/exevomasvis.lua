local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 47)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 18, 5, 25)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 11)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 5, 18, 5, 25)


local area = createCombatArea(AREA_CROSS7X7)
setCombatArea(combat, area)
local area = createCombatArea(AREA_CROSS7X8)
setCombatArea(combat2, area)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Uma estrela de energia foi ativado, afetando todos que estiver ao alcan�e. O c�lculo do dano de ataque � baseado em seu n�vel m�gico.")
doCombat(cid, combat, var)
return doCombat(cid, combat2, var)

end