function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Voce Esta jogando Darkness BaiaK Edited by [ADM] Smacck.!! 

     Novo Comando Adcionado !aol , !bless . bom jogo .
  
    Vip2 na quest vip!
    Master Vip na master vip quest!

Bom Jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end