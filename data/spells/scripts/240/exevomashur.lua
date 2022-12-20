local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 9)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack * 40, level / 40 * 40
	return -(skillTotal / 40 + levelTotal), -(skillTotal + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Um reta 3x3 de físico foi ativada, afetando todos que estiver em seu caminho. O cálculo do dano é baseado em seus skills e ataque da arma.")
	return doCombat(cid, combat, var)
end