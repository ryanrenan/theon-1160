function onUse(cid, item, item2)

local cfg = {
                listas = {
                chance100 = {2494, 2492, 2646}, -- Demon Armor, DSA, Golden Boots
                chance75 = {2400, 2472, 2470}, -- SOV, MPA, Golden Legs
                chance50 = {2466, 2514, 2640}, -- Golden Armor, MMS, Soft Boots
                chance30 = {2487, 2498, 2491}, -- Crown Armor, RH, Crown Helmet
                chance10 = {4, 8, 10, 30, 50, 80}, -- Crystal coins (40k, 80k, 100k...)
                }
}

if getPlayerFreeCap(cid) < 150 then doPlayerSendCancel(cid, "Lack cap!") return true end

if math.random(1, 100) <= 10 then
doPlayerAddItem(cid, 2160, cfg.listas.chance10[math.random(1, #cfg.listas.chance10)])
doCreatureSay(cid, "Rolled [Chance 10%]", TALKTYPE_ORANGE_1)
elseif math.random(1, 100) > 10 or math.random(1, 100) < 30 then
doPlayerAddItem(cid, cfg.listas.chance30[math.random(1, #cfg.listas.chance30)])
doCreatureSay(cid, "Rolled [Chance 30%]", TALKTYPE_ORANGE_1)
elseif math.random(1, 100) > 30 or math.random(1, 100) < 50 then
doPlayerAddItem(cid, cfg.listas.chance50[math.random(1, #cfg.listas.chance50)])
doCreatureSay(cid, "Rolled [Chance 50%]", TALKTYPE_ORANGE_1)
elseif math.random(1, 100) > 50 or math.random(1, 100) < 75 then
doPlayerAddItem(cid, cfg.listas.chance75[math.random(1, #cfg.listas.chance75)])
doCreatureSay(cid, "Rolled [Chance 75%]", TALKTYPE_ORANGE_1)
elseif math.random(1, 100) > 75 or math.random(1, 100) < 100 then
doPlayerAddItem(cid, cfg.listas.chance100[math.random(1, #cfg.listas.chance100)])
doCreatureSay(cid, "Rolled [Chance 100%]", TALKTYPE_ORANGE_1)
end

doSendMagicEffect(getCreaturePosition(cid), 26)
doRemoveItem(item.uid, 1)
return true
end