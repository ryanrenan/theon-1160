local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 31)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)

setCombatFormula(combat, COMBAT_FORMULA_SKILL, 8, 10, 8, 13)


function onCastSpell(cid, var)

doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Uma morte brutal foi ativada, afetando seu inimigo targetado por perto. O c�lculo do dano � baseado seu skills e ataque da arma.")
	return 
doCombat(cid, combat, var)

end
