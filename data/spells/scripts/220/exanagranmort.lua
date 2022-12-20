local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, falser)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 30, 20, 31, 29)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Cura sua life múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu nível.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
        end
        return true
end