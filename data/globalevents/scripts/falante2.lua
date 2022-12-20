function onThink(interval, lastExecution)
pos = {x = 1093, y = 1056, z = 7}
pos1 = {x = 1083, y = 1186, z = 8}
pos2 = {x = 1147, y = 1057, z = 7}
pos3 = {x = 1147, y = 1058, z = 7}
pos4 = {x = 1147, y = 1059, z = 7}

doSendAnimatedText(pos, 'annihilon!', math.random(1, 255))
doSendAnimatedText(pos1, 'Saída!', math.random(1, 255))
doSendAnimatedText(pos2, 'Pesque!', math.random(1, 255))
doSendAnimatedText(pos3, 'Minere!', math.random(1, 255))
doSendAnimatedText(pos4, 'Em Paz!', math.random(1, 255))

return true
end
