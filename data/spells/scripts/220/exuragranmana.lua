local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 15, 12, 16, 13)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO M�GICO: Cura sua mana m�ltiplas vezes (10x) durante 5 segundos. O c�lculo de regenera��o � de acordo com seu n�vel m�gico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
        end
        return true
end