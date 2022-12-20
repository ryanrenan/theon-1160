local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

if(msgcontains(msg, 'oi') or msgcontains(msg, 'eae')) then
selfSay("Ola, ".. getCreatureName(cid) ..", Compro escamas do castle, Você tem algo para me oferecer ? diga negociar", cid, TRUE)

elseif(msgcontains(msg, 'negociar') or msgcontains(msg, 'oferta')) then
selfSay("Bom ".. getCreatureName(cid) ..", Vejamos oque temos aqui.", cid)

elseif(msgcontains(msg, 'tchau') or msgcontains(msg, 'flw')) then
selfSay("Tchau ".. getCreatureName(cid) ..", Até o nosso próximo encontro..", cid)

function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('Eu so entendo portugues por favor diga "oi"?') -- msg que vai sair do npc
end
return true
end
function greetCallback(cid)
return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'Escama de Orshabaal'}, 5909,50000000, 'Escama de Orshabaal')
shopModule:addSellableItem({'Escama de Verminor'}, 5910,70000000, 'Escama de Verminor')
shopModule:addSellableItem({'Escama de Apocalypse'}, 5911,80000000, 'Escama de Apocalypse')
shopModule:addSellableItem({'Escama de Infernatil'}, 5912,140000000, 'Escama de Infernatil')
shopModule:addSellableItem({'Escama de Bazir'}, 5913,190000000, 'Escama de Bazir')
shopModule:addSellableItem({'Escama de Castle Master'}, 5914,320000000, 'Escama de Castle Master')

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
