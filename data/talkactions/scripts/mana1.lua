function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "\nHealth: [" .. getCreatureHealth(cid) .. "/" .. getCreatureMaxHealth(cid) .. "]\nMana: [" .. getCreatureMana(cid) .. "/" .. getCreatureMaxMana(cid) .. "]")
return true
end
 
if isPremium(cid) == FALSE then
local pid = getPlayerByNameWildcard(param)
if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O jogador com o nome " .. param .. " n�o esta online ou n�o existe.")
return true
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Informa��o do jogador (" .. getCreatureName(pid) .. ")")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Health: [" .. getCreatureHealth(pid) .. "/" .. getCreatureMaxHealth(pid) .. "]")
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Mana: [" .. getCreatureMana(pid) .. "/" .. getCreatureMaxMana(pid) .. "]")

return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Apenas jogadores VIP podem utilizar este comando para visualizar informa��es de outros jogadores.")
return true
end
end