local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC,  -9, -9, -10, -13)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC,  -9, -9, -10, -14)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 36)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC,  -9, -9, -10, -16)

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
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1000, parameters)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Cuspe de fogo foi ativado, afetando o inimigo múltiplas vezes (3x). O cálculo do dano de ataque é baseado em seu nível mágico.")
return TRUE
end