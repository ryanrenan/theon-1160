function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[War Carlin Information: 
Novas Talkactions
!rulando on
!zzz on
!bot on
!rulando on
!ronaldo on
!pvprulez on
!restart on
!soufoda on
!sinistro on
Divirta-se
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end