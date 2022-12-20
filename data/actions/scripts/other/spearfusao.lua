function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local t = {}
	for i = 0, getPlayerInstantSpellCount(cid) - 1 do
		
local spell = getPlayerInstantSpellInfo(cid, i)
		
if(spell.level ~= 0) then
			
if(spell.manapercent > 0) then
				
spell.mana = spell.manapercent .. "%"
			
end

			
table.insert(t, spell)
		
end
	
end

	
table.sort(t, function(a, b) return a.level < b.level end)
			
local line = ""
		
if(prevLevel ~= spell.level) then
			
if(i ~= 1) then
				
line = "\n"
			
end

			
line = line .. "  Sistema de Fusão \n"				
end

		
text = text .. line .. " 3 spears = 1 enchanted spear \n"
	
end

	
doShowTextDialog(cid, item.itemid, text)
	
return true
end
