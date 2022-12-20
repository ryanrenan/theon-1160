local combat1 = createCombatObject()
	setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat1, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGICSKILL, -1, -9.8, -1.7, 8)

local combat2 = createCombatObject()
	setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat2, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.9, 8)

local combat3 = createCombatObject()
	setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat3, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.7, 8)

local combat4 = createCombatObject()
	setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat4, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.9, 8)

local combat5 = createCombatObject()
	setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat5, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.7, 8)

local combat6 = createCombatObject()
	setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat6, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.9, 8)

local combat7 = createCombatObject()
	setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat7, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat7, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat7, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.7, 8)

local combat8 = createCombatObject()
	setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat8, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat8, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat8, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.7, 8)

local combat9 = createCombatObject()
	setCombatParam(combat9, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat9, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat9, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat9, COMBAT_FORMULA_LEVELMAGIC, -1, -7.8, -1.7, 8)
local combat10 = createCombatObject()
	setCombatParam(combat10, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
	setCombatParam(combat10, COMBAT_PARAM_EFFECT, 39)
        setCombatParam(combat10, COMBAT_PARAM_DISTANCEEFFECT, 37)
	setCombatFormula(combat10, COMBAT_FORMULA_LEVELMAGIC, -1, -9.8, -1.7, 8)


local function onCastSpell1(parameters)
	doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
	doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
	doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
	doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
	doCombat(parameters.cid, combat5, parameters.var)
end

local function onCastSpell6(parameters)
	doCombat(parameters.cid, combat6, parameters.var)
end

local function onCastSpell7(parameters)
	doCombat(parameters.cid, combat7, parameters.var)
end

local function onCastSpell8(parameters)
	doCombat(parameters.cid, combat8, parameters.var)
end

local function onCastSpell9(parameters)
	doCombat(parameters.cid, combat9, parameters.var)
end

local function onCastSpell10(parameters)
	doCombat(parameters.cid, combat10, parameters.var)
end

function onCastSpell(cid, var)
	local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6, combat7 = combat7, combat8 = combat8, combat9 = combat9, combat10 = combat10 } 
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 900, parameters)
addEvent(onCastSpell4, 1100, parameters)
addEvent(onCastSpell5, 1400, parameters)
addEvent(onCastSpell6, 1600, parameters)
addEvent(onCastSpell7, 1900, parameters)
addEvent(onCastSpell8, 2100, parameters)
addEvent(onCastSpell9, 2300, parameters)
addEvent(onCastSpell10, 2500, parameters)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Um ataque múltiplo (10x) divino foi ativado, causando dano em seu alvo. O cálculo do dano é baseado em seu nível mágico.")
		return true
end