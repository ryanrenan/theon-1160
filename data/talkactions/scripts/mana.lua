function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "\nMana atual: " .. getCreatureHealth(cid) .. "\nMana m�xima: " .. getCreatureMaxHealth(cid) .. "")
return true
end
 
if isPremium(cid) == TRUE then
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O jogador com o nome " .. param .. " n�o esta online ou n�o existe.")
return true
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "\nMana de ( " .. getCreatureName(pid) .. " ) atual: " .. getCreatureHealth(pid) .. "\nMana de ( " .. getCreatureName(pid) .. " ) m�xima: " .. getCreatureMaxMana(pid) .. "")
return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Apenas jogadores VIP podem utilizar este comando para visualizar informa��es de outros jogadores.")
return true
end
end