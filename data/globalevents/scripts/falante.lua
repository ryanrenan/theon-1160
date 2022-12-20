function onThink(interval, lastExecution)
pos = {x = 1096, y = 1056, z = 7}
pos1 = {x = 1095, y = 1056, z = 7} 
pos3 = {x = 1098, y = 1066, z = 6}
pos4 = {x = 1098, y = 1065, z = 6}
pos5 = {x = 1098, y = 1064, z = 6}
pos11 = {x = 1142, y = 1054, z = 7}
pos12 = {x = 1143, y = 1054, z = 7}
pos16 = {x = 1029, y = 1168, z = 7}
pos21 = {x = 1096, y = 1060, z = 7}
pos22 = {x = 1094, y = 1056, z = 7}
pos23 = {x = 1040, y = 1096, z = 7}
pos25 = {x = 1097, y = 1056, z = 7}
pos28 = {x = 972, y = 1081, z = 7}
pos31 = {x = 959, y = 1182, z = 7}
doSendAnimatedText(pos, 'Trainers', math.random(1, 255))
doSendAnimatedText(pos1, 'Castle', math.random(1, 255))
doSendAnimatedText(pos3, 'Paladin', 50)
doSendAnimatedText(pos5, 'Knight', 50)
doSendAnimatedText(pos4, 'Mage', 50)
doSendAnimatedText(pos16, 'Bp', math.random(1, 255))
doSendAnimatedText(pos21, 'Pesca', math.random(1, 255))
doSendAnimatedText(pos22, 'Eventos', math.random(1, 255))
doSendAnimatedText(pos23, 'Cadeia', math.random(1, 255))
doSendAnimatedText(pos25, 'Respawns', math.random(1, 255))
doSendAnimatedText(pos28, 'Welcome', math.random(1, 255))
doSendAnimatedText(pos31, 'Danger', math.random(1, 255))

return true
end
