local config = {
    positions = {
        ["Bonus!"] = { x = 1093, y = 1060, z = 7 },
        ["ITEMS.."] = { x = 1089, y = 1065, z = 7 },
        ["ITEMS..."] = { x = 1088, y = 1058, z = 7 },
        ["TRAINES"] = { x = 1090, y = 1062, z = 6 },
        ["War Of Emperium"] = { x = 1143, y = 1063, z = 7 },
        [""] = { x = 969, y = 979, z = 11 },
        [""] = { x = 995, y = 984, z = 10 },
        [""] = { x = 177, y = 62, z = 7 },
        [""] = { x = 154, y = 50, z = 7 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  