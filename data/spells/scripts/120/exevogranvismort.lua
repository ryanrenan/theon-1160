local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)

setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 10, 15, 11, 29)


local area = createCombatArea(AREA_BEAM7)

setCombatArea(combat, area)

function onCastSpell(cid, var)

doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Um corredor da morte foi ativado, afetando todos que estiver em sua reta. O c�lculo do dano de ataque � baseado em seu n�vel m�gico.")

        return doCombat(cid, combat, var)

end