function onCastSpell(cid, var)
local playerpos = getPlayerPosition(cid)
local MaximoSummon = 2 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones
local summons = getCreatureSummons(cid)

if getTilePzInfo(getCreaturePosition(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você não pode usar em protection zone.")
return true
end

if(table.maxn(summons) < MaximoSummon) then -- no summons
local espartano = doCreateMonster("espartano", playerpos)
local espartana = doCreateMonster("espartana", playerpos)
doConvinceCreature(cid, espartano)
doConvinceCreature(cid, espartana)
doSendMagicEffect(playerpos, 2)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você invocou um casal de Espartanos.")
return TRUE
end
end