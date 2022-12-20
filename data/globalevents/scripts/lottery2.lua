local config = {
    lottery_hora = "1 Hora", -- Time to next lottery (only for broadcast message, real time you can set on globalevents.xml)
    rewards_id = {2159}, -- Reward ID
    event_counts = 3, -- Used only if on rewards_id is event coin (ID: 2159).
    website = "yes" -- Only if you have php scripts and table `lottery` in your database!
    }
function onThink(interval, lastExecution)
    local list = {}
    for i, tid in ipairs(getPlayersOnline()) do
    list[i] = tid
end

        local winner = list[math.random(1, #list)]
        local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
       
        if(random_item == 2159) then
                doPlayerAddItem(winner, random_item, config.event_counts)
                doBroadcastMessage("[SISTEMA LOTERICA] Vencedor: " .. getCreatureName(winner) .. ", Prêmio: " .. config.event_counts .. " " .. getItemNameById(random_item) .. "s. Parabéns! (Próxima Lotérica em " .. config.lottery_hora .. "")
        else
                doBroadcastMessage("[SISTEMA LOTERICA] Vencedor: " .. getCreatureName(winner) .. ", Prêmio: " .. getItemNameById(random_item) .. " Parabéns! (Próxima Lotérica em " .. config.lottery_hora .. ")")
                doPlayerAddItem(winner, random_item, 1)
        end
       
        if(config.website == "yes") then
                db.executeQuery("INSERT INTO `lottery` (`name`, `item`) VALUES ('".. getCreatureName(winner) .."', '".. getItemNameById(random_item) .."');")
        end
        return true
end