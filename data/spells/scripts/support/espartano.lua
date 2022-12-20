function onCastSpell(cid, var)

    local playerpos = getPlayerPosition(cid)
    local MaximoSummon = 1
    local summons = getCreatureSummons(cid)
    if(table.maxn(summons) < MaximoSummon) then -- no summons
        local Arqueiro = doSummonCreature("espartano", playerpos)
        local Arqueira = doSummonCreature("espartana", playerpos)
        doConvinceCreature(cid, espartano)
        doConvinceCreature(cid, espartana)
        return true
    end
end