local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

function onGetFormulaValues(cid, level, maglevel)
	local min = (-level /4 * 3 - maglevel * 4) * 15.6
	local max = (-level /4 * 3 - maglevel * 4) * 15.0
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Uma reta 3x3 da morte foi ativada, afetando todos que estiver em seu caminho. O cálculo do dano é baseado em seu nível mágico.")
	return doCombat(cid, combat, var)
end