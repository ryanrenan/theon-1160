local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20, -28, -12, -48)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20, -28, -12, -40)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 30)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -20, -28, -12, -40)

local function onCastSpell1(parameters)
        doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
        doCombat(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
        doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6, combat7 = combat7, combat8 = combat8, combat9 = combat9, combat10 = combat10 }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Meteoros divinos foi ativado, afetando o inimigo múltiplas vezes (3x). O cálculo de regeneração é de acordo com seu nível mágico.")
return TRUE
end