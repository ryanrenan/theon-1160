function onSay(cid, words, param)
if words == "!myhonor" or  words == "/myhonor" then
return doPlayerPopupFYI(cid,"Honor Points pode ser trocado por items no npc\nE cada dominio, cada guild os jogadores recebem "..frag_guild.Honor_Point.." Honor Points!\n\n\nMeu Honor Points: "..getHonorPoints(cid))
elseif words == "!guildfrags" or words == "/guildfrags" then
if param == "rank" then
local max_guild,str = 10,""
str = "--[ Rank Guild Frags ]--\n\n"
				query = db.getResult("SELECT `name`, `frags` FROM `guilds` WHERE `frags` ORDER BY `frags` DESC, `name` ASC;")
				if (query:getID() ~= -1) then k = 1 while true do
				str = str .. "\n " .. k .. ". " .. query:getDataString("name") .. " - [" .. query:getDataInt("frags") .. "]"
				k = k + 1
				if not(query:next()) or k > max_guild then break end end query:free()end
				if str ~= "" then doPlayerPopupFYI(cid, str) end
return true
end
doPlayerPopupFYI(cid,"".. (getGuildWinnerName() == "" and "O server não tem nenhuma guild dominante\n\nPara mostrar o rank de frags digite !guildfrags rank" or "Atualmente a guild dominate e ["..getGuildWinnerName().."]\n\nSeu dominio termina em "..getAcessDate(getGuildWinnerName()).."") .."")
end
return true
end