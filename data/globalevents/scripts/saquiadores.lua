local t = {
{"Saquiador",{x= 1094, y= 1069, z= 7}},
{"Saquiadora",{x= 1118, y= 1064, z= 7}},
{"Saquiador",{x= 1106, y= 1054, z= 7}},
{"Saquiadora",{x= 1098, y= 1043, z= 7}},
{"Saquiador",{x= 1075, y= 1057, z= 7}},
{"Saquiadora",{x= 1073, y= 1034, z= 7}},
{"Saquiador",{x= 1065, y= 1047, z= 7}},
{"Saquiadora",{x= 1047, y= 1049, z= 7}},
{"Saquiador",{x= 1056, y= 1060, z= 7}},
{"Saquiadora",{x= 1053, y= 1070, z= 7}},
{"Saquiador",{x= 1029, y= 1070, z= 7}},
{"Saquiadora",{x= 1054, y= 1083, z= 7}},
{"Saquiador",{x= 1039, y= 1083, z= 7}},
{"Saquiadora",{x= 1056, y= 1094, z= 7}},
{"Saquiador",{x= 1052, y= 1112, z= 7}},
{"Saquiadora",{x= 1072, y= 1118, z= 7}},
{"Saquiador",{x= 1071, y= 1104, z= 7}},
{"Saquiadora",{x= 1084, y= 1099, z= 7}},
{"Saquiador",{x= 1078, y= 1084, z= 7}},
{"Saquiadora",{x= 1080, y= 1070, z= 7}},
{"Saquiador",{x= 1103, y= 1109, z= 7}},
{"Saquiadora",{x= 1115, y= 1092, z= 7}},
{"Saquiador",{x= 1109, y= 1094, z= 7}},
{"Saquiadora",{x= 1092, y= 1086, z= 7}},
{"Saquiador",{x= 1126, y= 1075, z= 7}},
{"Saquiadora",{x= 1103, y= 1045, z= 7}},
{"Saquiador",{x= 1091, y= 1046, z= 7}}
}

function onThink(interval, lastExecution, thinkInterval)

local tempo = 25 -- tempo para remover o monstro

doBroadcastMessage("SAQUIADORES EM CARLIN !",22)

for i = 1, #t do
pid = doCreateMonster(t[i][1], t[i][2])
addEvent(remove, tempo*25*10000, pid)
end
return TRUE
end

function remove(pid)
if (isMonster(pid) == true) then
doRemoveCreature(pid)
end
end