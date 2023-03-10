local egg = {
["Many Pet"] = {id = 10523, mon = "Many Pet"},
["Draug Pet"] = {id = 4850, mon = "Draug Pet"},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getTilePzInfo(getCreaturePosition(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT,"Voc? n?o pode sumonar seu pet em protection zone.")
	return true
	end

	if #getCreatureSummons(cid) >= 1 then
	return doPlayerSendCancel(cid, "Voc? s? pode ter 1 pet sumonado.")
	end

	for k, v in pairs(egg) do
		if item.itemid == v.id then
			local x = doSummonCreature(v.mon, getCreaturePosition(cid))
			doConvinceCreature(cid, x)
		end
	end

return true
end