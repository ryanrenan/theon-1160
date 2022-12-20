function onUse(cid, item, frompos, item2, topos)
local pos = {x=1095, y=1062, z=7} -- lugar

if getPlayerLevel(cid) < 120 then
return doPlayerSendCancel(cid, "So level 120 pode fazer a quest.")
end 
if item.uid == 3948 then
queststatus = getPlayerStorageValue(cid,8749)
if queststatus == -1 then
doPlayerSendTextMessage(cid,19,"Você completou a quest da fishing rod e picareta, parabéns!")
doPlayerAddItem(cid,2553,1)
doPlayerAddItem(cid,2580,1)
setPlayerStorageValue(cid,8749,1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid,22,"O Bau esta vazio.")
end
end
end