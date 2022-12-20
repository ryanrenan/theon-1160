local toPos = {x = 1096, y = 1068, z = 7}  --pos para onde o player sera teleportado

local createPos = {x = 1090, y = 1090, z = 9} --pos aonde o tp sera criado

local tpID = 1387    --id do tp, nunca usei um, n sei se eh esse ms...

local tempo = 90 --90seg



local function removeTP(pos, id, time)

if time == 0 then

   local item = getTileItemById(pos, id).uid

   if item > 1 then

	  doRemoveItem(item, 1)

	  doSendAnimatedText(pos, "Fexado!", 192)

	  doBroadcastMessage("ENTRADA PARA O EVENTO MEGA WAR ESTA FECHADA!", 20)

   end

else

   doSendAnimatedText(pos, time, 227)

   addEvent(removeTP, 1000, pos, id, time-1)

end

end



function onUse(cid, item, frompos, item2, topos)

local item = getTileItemById(createPos, tpID).uid

   if item > 1 then

	  return doPlayerSendTextMessage(cid, 27, "The teleport already is open!")

   end



doCreateTeleport(tpID, toPos, createPos)

function onUse(cid, item)
removeTP(createPos, tpID, tempo)

doBroadcastMessage("EVENTO MEGA WAR FOI ABERTO!", 20)

doTransformItem(item.uid, (item.itemid == 1945 and 1946 or 1945))



return true

end