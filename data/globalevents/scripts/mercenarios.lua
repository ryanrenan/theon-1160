
local t = {
{"Mercenario",{x= 1095, y= 1068, z= 7}},
{"Mercenario",{x= 1099, y= 1070, z= 7}},
{"Mercenario",{x= 1123, y= 1065, z= 7}},
{"Mercenario",{x= 1116, y= 1066, z= 7}},
{"Mercenario",{x= 1123, y= 1056, z= 7}},
{"Mercenario",{x= 1114, y= 1062, z= 7}},
{"Mercenario",{x= 1109, y= 1054, z= 7}},
{"Mercenario",{x= 1107, y= 1044, z= 7}},
{"Mercenario",{x= 1100, y= 1054, z= 7}},
{"Mercenario",{x= 1100, y= 1053, z= 7}},
{"Mercenario",{x= 1093, y= 1048, z= 7}},
{"Mercenario",{x= 1080, y= 1054, z= 7}},
{"Mercenario",{x= 1076, y= 1037, z= 7}},
{"Mercenario",{x= 1040, y= 1052, z= 7}},
{"Mercenario",{x= 1036, y= 1070, z= 7}},
{"Mercenario",{x= 1044, y= 1083, z= 7}},
{"Mercenario",{x= 1083, y= 1075, z= 7}},
{"Mercenario",{x= 1049, y= 1063, z= 7}},
{"Mercenario",{x= 1054, y= 1084, z= 7}},
{"Mercenaria",{x= 1054, y= 1114, z= 7}},
{"Mercenario",{x= 1063, y= 1115, z= 7}},
{"Mercenario",{x= 1059, y= 1093, z= 7}},
{"Mercenario",{x= 1065, y= 1098, z= 7}},
{"Mercenario",{x= 1077, y= 1098, z= 7}},
{"Mercenario",{x= 1085, y= 1098, z= 7}},
{"Mercenario",{x= 1075, y= 1085, z= 7}},
{"Mercenario",{x= 1075, y= 1074, z= 7}},
{"Mercenario",{x= 1076, y= 1067, z= 7}},
{"Mercenario",{x= 1102, y= 1101, z= 7}},
{"Mercenario",{x= 1107, y= 1093, z= 7}},
{"Mercenario",{x= 1110, y= 1094, z= 7}},
{"Mercenario",{x= 1114, y= 1092, z= 7}}
}

function onThink(interval, lastExecution, thinkInterval)

local tempo = 9 -- tempo para remover o monstro

doBroadcastMessage("MERCENARIOS EM CARLIN !",22)

for i = 1, #t do
pid = doCreateMonster(t[i][1], t[i][2])
addEvent(remove, tempo*9*10000, pid)
end
return TRUE
end

function remove(pid)
if (isMonster(pid) == true) then
doRemoveCreature(pid)
end
end