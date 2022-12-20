function onUse(cid, item, item2)

local cfg = {
                listas = {
                chance100 = {2145}, -- Premium Coin
                chance75 = {5952}, -- exp scroll
                chance50 = {2156, 2158, 2154}, -- mana gem, health gem, spirit gem
                chance25 = {200}, -- crystal coins (2kk)
                chance10 = {100}, -- crystal coins (1kk)
                }
}



if math.random(1, 100) <= 1 then

doPlayerAddItem(cid, 2160, cfg.listas.chance10[math.random(1, #cfg.listas.chance10)])
doCreatureSay(cid, "Dado foi jogado (chances de 10%)", TALKTYPE_ORANGE_1)
doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") rolou um dado premiado e ganhou 100 Crystal Coins.", 19)
elseif math.random(1, 100) > 20 or math.random(1, 100) < 25 then

doPlayerAddItem(cid, 2160, cfg.listas.chance25[math.random(1, #cfg.listas.chance25)])
doCreatureSay(cid, "Dado foi jogado (chances de 25%)", TALKTYPE_ORANGE_2)
doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") rolou um dado premiado e ganhou 200 Crystal Coins.", 19)
elseif math.random(1, 100) > 25 or math.random(1, 100) < 50 then

doPlayerAddItem(cid, cfg.listas.chance50[math.random(2, #cfg.listas.chance50)])
doCreatureSay(cid, "Dado foi jogado (chances de 50%)", TALKTYPE_ORANGE_1)
doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") rolou um dado premiado e ganhou 1 Gem Aleatório.", 19)
elseif math.random(1, 100) > 50 or math.random(1, 100) < 75 then

doPlayerAddItem(cid, cfg.listas.chance75[math.random(1, #cfg.listas.chance75)])
doCreatureSay(cid, "Dado foi jogado (chances de 75%)", TALKTYPE_ORANGE_1)
doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") rolou um dado premiado e ganhou 1 Exp Scroll.", 19)
elseif math.random(1, 100) > 75 or math.random(1, 100) < 100 then

doPlayerAddItem(cid, cfg.listas.chance100[math.random(1, #cfg.listas.chance100)])
doCreatureSay(cid, "Dado foi jogado (chances de 90%)", TALKTYPE_ORANGE_1)
doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") rolou um dado premiado e ganhou 1 Premium Coin.", 19)
elseif math.random(1, 100) > 90 or math.random(1, 100) < 100 then
end

doSendMagicEffect(getCreaturePosition(cid), 26)
doRemoveItem(item.uid, 1)
return true
end