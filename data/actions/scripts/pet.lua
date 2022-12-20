local egg = {
["Amarelo"] = {id = 6541, mon = "Holy Pet"},
["Vermelho"] = {id = 6542, mon = "Fire Pet"},
["Azul"] = {id = 6543, mon = "Ice Pet"},
["Verde"] = {id = 6544, mon = "Terra Pet"},
["Roxo"] = {id = 6545, mon = "Energy Pet"},
["Lava"] = {id = 11737, mon = "Phoenix Pet"},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getTilePzInfo(getCreaturePosition(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"Voc� n�o pode sumonar seu pet em protection zone.")
	return true
	end

	if #getCreatureSummons(cid) >= 1 then
	return doPlayerSendCancel(cid, "Voc� s� pode ter 1 pet sumonado.")
	end

	for k, v in pairs(egg) do
		if item.itemid == v.id then
			local x = doSummonCreature(v.mon, getCreaturePosition(cid))
			doConvinceCreature(cid, x)
			doRemoveItem(item.uid, 1)
		end
	end

return true
end