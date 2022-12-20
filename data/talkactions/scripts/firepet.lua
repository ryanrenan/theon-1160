local sellTable = {
	[6542] = 100000,
}

function on_search_container(cid, uid)
	local size = getContainerCap(uid)
	for slot = (size - 1), 0, -1 do
		local item = getContainerItem(uid, slot)
		if item.uid > 0 then
			if sellTable[item.itemid] then
				doPlayerAddMoney(cid, sellTable[item.itemid])
				doSendAnimatedText(getPlayerPosition(cid), "VENDIDO!", TEXTCOLOR_RED)
                                          doSendMagicEffect(getCreaturePosition(cid), math.random(29,29))
                                          doSendMagicEffect(getPlayerPosition(cid), 13)
				doRemoveItem(item.uid, 1)
			elseif isContainer(item.uid) then
				on_search_container(cid, item.uid)
			end
		end
	end
end

function onSay(cid, words, param, channel)
	on_search_container(cid, getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid)
	return true
end