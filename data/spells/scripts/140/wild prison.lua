local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1499)


local area = createCombatArea(AREA_CROSS4X8)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Uma prisão de wild growths foi ativada, deixando seu alvo preso e com chances de saída.")
doCombat(cid, combat, var)
return doCombat(cid, combat, var)
end