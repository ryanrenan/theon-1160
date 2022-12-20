-- Pre�os das apostas --
aposta1 = 10000 -- 1k ou 1000gold
premio1 = 20000 -- 1k ou 1000gold
aposta2 = 100000 -- 1k ou 1000gold
premio2 = 200000 -- 1k ou 1000gold
aposta3 = 1000000 -- 1k ou 1000gold
premio3 = 2000000 -- 1k ou 1000gold
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}	
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('Oi! Ganhe dinheiro com sua sorte!') -- msg que vai sair do npc
end
if rand == 2 then
selfSay ('S� entendo portugu�s, diga oi.')
end
if rand == 3 then
selfSay ('Posso te ajudar?')
end
return true
end
function greetCallback(cid)
return true
end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'jogar')) then
selfSay('O jogo � bem simples, voc� s� precisa decidir se quer apostar 1 crystal coin, 10 crystal coins ou 100 crystal coins. Ap�s decidir sua aposta, ser� sorteado um n�mero entre 1 e 10 para mim e para voc�, vence quem sortear o maior n�mero. Se der empate, voc� recebe o dinheiro da aposta de volta, se voc� ganhar receber� o dobro do valor da aposta e se perder eu fico com o seu dinheiro da aposta. Diga {1 crystal coin}, {10 crystal coins} ou {100 crystal coins} para come�ar o jogo.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, '1 crystal coin') and talkState[talkUser] == 1) then
selfSay('Voc� tem certeza que quer apostar 1 crystal coin?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if doPlayerRemoveMoney(cid, aposta1) == TRUE then
end
local mpn = math.random(5,5)
local npcn = math.random(10,10)
setPlayerStorageValue(cid, 2224, npcn)
setPlayerStorageValue(cid, 55411, mpn)
if getPlayerStorageValue(cid, 55411) < getPlayerStorageValue(cid, 2224)then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55411)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2224)..'. Voc� Perdeu!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55411) == getPlayerStorageValue(cid, 2224) then	
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55411)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2224)..'. Deu Empate!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55411) > getPlayerStorageValue(cid, 2224) then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55411)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2224)..'. Voc� Venceu!',cid) 
doPlayerAddMoney(cid, premio1)
talkState[talkUser] = 1
else
selfSay('Desculpe, mais voc� n�o possui dinheiro est� aposta',cid)
end
elseif(msgcontains(msg, '10 crystal coin') and talkState[talkUser] == 1) then
selfSay('Voc� tem certeza que quer apostar 10 crystal coin?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if doPlayerRemoveMoney(cid, aposta2) == TRUE then
end
local mpn2 = math.random(1,5)
local npcn2 = math.random(10,10)
setPlayerStorageValue(cid, 2225, npcn2)
setPlayerStorageValue(cid, 55412, mpn2)
if getPlayerStorageValue(cid, 55412) < getPlayerStorageValue(cid, 2225)then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55412)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2225)..'. Voc� Perdeu!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55412) == getPlayerStorageValue(cid, 2225) then	
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55412)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2225)..'. Deu Empate!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55412) > getPlayerStorageValue(cid, 2225) then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55412)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2225)..'. Voc� Venceu!',cid) 
doPlayerAddMoney(cid, premio2)
talkState[talkUser] = 1
else
selfSay('Desculpe, mais voc� n�o possui dinheiro est� aposta',cid)
end
elseif(msgcontains(msg, '100 crystal coin') and talkState[talkUser] == 1) then
selfSay('Voc� tem certeza que quer apostar 100 crystal coin?', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'sim') and talkState[talkUser] == 1) then
if doPlayerRemoveMoney(cid, aposta3) == TRUE then
end
local mpn = math.random(5,10)
local npcn = math.random(5,10)
setPlayerStorageValue(cid, 2226, npcn)
setPlayerStorageValue(cid, 55413, mpn)
if getPlayerStorageValue(cid, 55413) < getPlayerStorageValue(cid, 2226)then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55413)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2226)..'. Voc� Perdeu!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55413) == getPlayerStorageValue(cid, 2226) then	
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55413)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2226)..'. Deu Empate!',cid) 
talkState[talkUser] = 1
elseif getPlayerStorageValue(cid, 55413) > getPlayerStorageValue(cid, 2226) then
selfSay('Seu n�mero: '..getPlayerStorageValue(cid, 55413)..'. Meu n�mero: '..getPlayerStorageValue(cid, 2226)..'. Voc� Venceu!',cid) 
doPlayerAddMoney(cid, premio3)
talkState[talkUser] = 1
else
selfSay('Desculpe, mais voc� n�o possui dinheiro est� aposta',cid)
end	 end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())