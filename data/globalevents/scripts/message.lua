local messages = {
"Aqui A Diversão é Garantida !",
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
doBroadcastMessage("MENSAGEM SISTEMA: " .. message,19)
i = i + 1
return TRUE
end