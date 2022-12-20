function onThink(interval, lastExecution)
  -- Configurações
    local cor = 30 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[War Carlin Information: 
Sou foda na cama ti comi na sala ou no quintal
na cama sou sinistro bla bla n sei canta mis kk'
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end