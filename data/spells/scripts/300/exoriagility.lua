local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 31)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 21, 15, 19, 21)


function onCastSpell(cid, var)

doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Uma morte brutal foi ativada, afetando seu inimigo targetado por perto. O cálculo do dano é baseado seu skills e ataque da arma.")
	return 
doCombat(cid, combat, var)

end
