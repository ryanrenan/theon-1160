function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "\nMana atual: " .. getCreatureHealth(cid) .. "\nMana máxima: " .. getCreatureMaxHealth(cid) .. "")
return true
end
 
if isPremium(cid) == TRUE then
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O jogador com o nome " .. param .. " não esta online ou não existe.")
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "\nMana de ( " .. getCreatureName(pid) .. " ) atual: " .. getCreatureHealth(pid) .. "\nMana de ( " .. getCreatureName(pid) .. " ) máxima: " .. getCreatureMaxMana(pid) .. "")
return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Apenas jogadores VIP podem utilizar este comando para visualizar informações de outros jogadores.")
return true
end
end