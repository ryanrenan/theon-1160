local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 25, 20, 20, 19)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat2, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 20, 21, 20, 22)

function onCastSpell(cid, var)
doPlayerSendTextMessage(cid,27,"EFEITO MÁGICO: Cura sua life e mana múltiplas vezes (10x) durante 5 segundos. O cálculo de regeneração é de acordo com seu nível mágico.")
        for i = 1, 10 do
                addEvent(doCombat, (i * 600) - 600, cid, combat, var)
                addEvent(doCombat, (i * 600) - 600, cid, combat2, var)
end
return true
end