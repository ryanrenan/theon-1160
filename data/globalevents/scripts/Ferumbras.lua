
local t = {
{"Ferumbras",{x= 1095, y= 1070, z= 7}}
}

function onThink(interval, lastExecution, thinkInterval)

local tempo = 119 -- tempo para remover o monstro

doBroadcastMessage("Ferumbras EM CARLIN !",22)

for i = 1, #t do
pid = doCreateMonster(t[i][1], t[i][2])
addEvent(remove, tempo*60*10000, pid)
end
return TRUE
end

function remove(pid)
if (isMonster(pid) == true) then
doRemoveCreature(pid)
end
end