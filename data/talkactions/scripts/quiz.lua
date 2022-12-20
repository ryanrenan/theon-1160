function onSay(cid, words, param)
onquiz_event = {
storage_reply = 36201, -- global storage
storage_check = 175201,
storage_points = 175202,
acess = 3
}
        if isInArray({'/quizpts','!quizpts','!quizpoints'}, words) then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� possui "..(getPlayerStorageValue(cid, onquiz_event.storage_points) <= 0 and 0 or getPlayerStorageValue(cid, onquiz_event.storage_points)).." pontos de quiz.")
        elseif isInArray({'/openquiz','!openquiz','/abrirquiz'}, words) then
                if getPlayerAccess(cid) < onquiz_event.acess then
                        doPlayerSendTextMessage(cid, 28, "Voc� n�o pode executar essa a��o.") return true
                end
        local t = string.explode(param, ",")
        if not tonumber(getGlobalStorageValue(onquiz_event.storage_reply)) then
                doPlayerSendTextMessage(cid, 27, "J� h� um quiz aberto no momento.") return true
        elseif not t[1] or not t[2] then
                doPlayerSendTextMessage(cid, 28, "Digite: comando pergunta,reposta.")return true
        end
                setGlobalStorageValue(onquiz_event.storage_reply, ":"..t[1]..",:"..t[2])
                doBroadcastMessage("Quiz aberto com a seguinte pergunta: ["..t[1].."]\ndigite '/quiz resposta' para responder ou !quizinfo para saber mais.")
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Quiz aberto com a pergunta "..t[1].." e resposta: "..t[2]..".")
        elseif isInArray({'/quiz','!quiz'}, words) then
        if not param or param == "" then
                doPlayerSendCancel(cid, "Digite a resposta.") return true
        elseif getPlayerAccess(cid) >= onquiz_event.acess then
                doPlayerSendCancel(cid, "Staff n�o pode responder o quiz.") return true
        elseif tonumber(getGlobalStorageValue(onquiz_event.storage_reply)) then
                doPlayerSendCancel(cid, "N�o h� quiz aberto no momento.") return true
        elseif getPlayerStorageValue(cid, onquiz_event.storage_check) >= 1 then
                doPlayerSendCancel(cid, "Voc� j� respondeu o quiz do momento.") return true
        end
        local s = tostring(getGlobalStorageValue(onquiz_event.storage_reply)):gsub(':', ''):explode(',')
                setPlayerStorageValue(cid, onquiz_event.storage_check, 1)
        if string.lower(param) ~= string.lower(s[2]) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� errou o quiz. Fale /quizpts para ver seus pontos.") return true
        end
                setPlayerStorageValue(cid, onquiz_event.storage_points, getPlayerStorageValue(cid, onquiz_event.storage_points) <= 0 and 1 or getPlayerStorageValue(cid, onquiz_event.storage_points)+1)
        print("[QUIZ SYSTEM] "..getCreatureName(cid).." respondeu "..s[1]..". Certo.")
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� acertou o quiz. Voc� marcou 1 ponto. Fale /quizpts para ver seus pontos.")
        elseif isInArray({'/closequiz','!closequiz','/fecharquiz'}, words) then
        if getPlayerAccess(cid) < onquiz_event.acess then
                doPlayerSendTextMessage(cid, 28, "Voc� n�o pode executar essa a��o.") return true
        end
        for _, pid in ipairs(getPlayersOnline()) do
                setPlayerStorageValue(pid, onquiz_event.storage_check, -1)
        end
                db.executeQuery("DELETE FROM `player_storage` WHERE `key` = "..onquiz_event.storage_check)
        local s = tostring(getGlobalStorageValue(onquiz_event.storage_reply)):gsub(':', ''):explode(',')
                doBroadcastMessage("Quiz fechado. Pergunta: "..s[1].."\nResposta: "..s[2])
        return setGlobalStorageValue(onquiz_event.storage_reply, 0)
        elseif isInArray({'/infoquiz','!infoquiz'}, words) then
        if tonumber(getGlobalStorageValue(onquiz_event.storage_reply)) then
                doPlayerSendCancel(cid, "N�o h� quiz aberto no momento.") return true
        end
        local s = tostring(getGlobalStorageValue(onquiz_event.storage_reply)):gsub(':', ''):explode(',')
        return doPlayerPopupFYI(cid, "--[Quiz System]--\n\nPergunta: "..s[1].."\n\n"..(getPlayerAccess(cid) >= onquiz_event.acess and "Resposta: "..s[2] or "").."\n\nPara responder digite: /quiz resposta, exemplo: /quiz messi.\n\nOBS: Cuidado com espa�os ou pontos no final da reposta.")
        end
return true
end