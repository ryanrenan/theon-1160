function onUse(cid, item, frompos, item2, topos)
local pos = {x=1067, y=1033, z=7} -- lugar

if getPlayerLevel(cid) < 120 then
return doPlayerSendCancel(cid, "Voc� precisa de level 120+ para fazer a quest.")
end 
if item.uid == 3948 then
queststatus = getPlayerStorageValue(cid,8749)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� completou a quest, parab�ns!")
doPlayerAddItem(cid,2580,1)
doPlayerAddItem(cid,2553,1)
setPlayerStorageValue(cid,8749,1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid,22,"O Ba� est� vazio.")
end
end
end