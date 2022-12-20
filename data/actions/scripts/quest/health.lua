function onUse(cid, item, frompos, item2, topos)
local pos = {x=1095, y=1062, z=7}

if getPlayerLevel(cid) <= 140 then
doPlayerSendTextMessage(cid,22,"Você ganhou uma Life Gem!")
doPlayerAddItem(cid,2156,1)
doTeleportThing(cid, pos)
else
doPlayerSendTextMessage(cid,22,"O Bau esta vazio.")
end
end