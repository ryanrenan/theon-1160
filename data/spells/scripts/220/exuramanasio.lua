local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 11, 15, 15, 12)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Cura sua mana múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu nível mágico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
        end
        return true
end