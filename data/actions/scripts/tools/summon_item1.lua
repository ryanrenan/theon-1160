function onUse(cid, item, fromPosition, itemEx, toPosition)

local items = {
["Nome1"] = {id = 6541, mon = "Rat"},

}

for k,v in pairs(items) do
if item.itemid == v.id then
x = doSummonCreature(v.mon, getCreaturePosition(cid))
doConvinceCreature(cid, 1)
doPlayerRemoveItem(cid, v.id, 1)
end
end
end
