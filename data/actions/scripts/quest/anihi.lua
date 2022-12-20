function onUse(cid, item, fromPosition, itemEx, toPosition)
local config = {
position = {x=1183, y=1224, z=7}, -- Posição aonde sera criado o teleport
position1 = {x=1177, y=1241, z=8},
position2 = {x=1177, y=1249, z=8},
position3 = {x=1183, y=1241, z=8},
position4 = {x=1183, y=1249, z=8},
fromPosition = {x=1176, y=1240, z=8},
toPosition = {x=1183, y=1249, z=8},
walls = {x=1177, y=1224, z=7},
wallr = {x=1177, y=1224, z=7,  stackpos = 1},
id = 1498,
time = 2 -- tempo que o teleport ira sumir em minutos
}
local t = {
level = 120, -- level minimo para poder entrar
inicio = -- posical inicial dos players
{
{x=1184,y=1224,z=7},
{x=1183,y=1224,z=7},
{x=1182,y=1224,z=7},
{x=1181,y=1224,z=7},
{x=1180,y=1224,z=7}
},
fim =	  -- posição para onde serão teleportados
{
{x=1182,y=1245,z=8},
{x=1181,y=1245,z=8},
{x=1180,y=1245,z=8},
{x=1179,y=1245,z=8},
{x=1178,y=1245,z=8}
}
}
local time = 120
local sto = 5937

local test = {}
for _, k in ipairs(t.inicio) do
local x = getTopCreature(k).uid
if(x == 0 or not isPlayer(x) or getPlayerLevel(x) < t.level) then
doPlayerSendCancel(cid, 'Você precisa de 5 jogadores')
return true
end
if getGlobalStorageValue(sto) == 1 then
doPlayerSendCancel(cid, 'Espere o tempo acabar')
return true
end
table.insert(test, x)
end
for i, pid in ipairs(test) do
doSendMagicEffect(t.inicio[i], CONST_ME_POFF)
doTeleportThing(pid, t.fim[i], false)
doSendMagicEffect(t.fim[i], CONST_ME_ENERGYAREA)
doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end
setGlobalStorageValue(sto, 1)
for i = 1,time do
formula = time - 1*i
addEvent(doSendAnimatedText,i*1000, config.position, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position1, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position2, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position3, formula, math.random(1, 255))
addEvent(doSendAnimatedText,i*1000, config.position4, formula, math.random(1, 255))
end
function removeWall()
setGlobalStorageValue(sto, -1)
return true
end
addEvent(removeWall, config.time*60*1000)
for x = config.fromPosition.x, config.toPosition.x do
for y = config.fromPosition.y, config.toPosition.y do
for z = config.fromPosition.z, config.toPosition.z do
areapos = {x = x, y = y, z = z, stackpos = 253}
getMonsters = getThingfromPos(areapos)
if isMonster(getMonsters.uid) then
doRemoveCreature(getMonsters.uid)
end
end
end
end
function removePlayer()
if isInArea(getPlayerPosition(cid), config.fromPosition, config.toPosition) then
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
end
end
addEvent(removePlayer, config.time*60*1000)
return TRUE
end 



