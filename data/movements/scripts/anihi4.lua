function onStepIn(cid, item, position, fromPosition)
location = {
{x=1134, y=1156, z=8}, -- Adicione uma coordenada
}

return doTeleportThing(cid, location[math.random(#location)])
end