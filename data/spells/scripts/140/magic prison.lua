local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)


local area = createCombatArea(AREA_CROSS4X8)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Uma prisão de magic walls foi ativada, deixando seu alvo preso e sem saída.")
doCombat(cid, combat, var)
return doCombat(cid, combat, var)
end