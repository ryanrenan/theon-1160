function onUse(cid, item, fromPosition, itemEx, toPosition)

local pos1, itm1 = {x=1081, y=1085, z=9, stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE} -- pos do item 1
local pos2, itm2 = {x=1082, y=1085, z=9, stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE} -- pos do item 2
local pos3, itm3 = {x=1083, y=1085, z=9, stackpos=STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE} -- pos do item 3

local config = {
      [1] = {item1= 2433,item2 = 2433,item3 = 2433,newitem = 7735}, -- item 1, item 2, item 3, item que ganha.
      [2] = {item1= 2523,item2 = 2523,item3 = 2523,newitem = 2524},
      [3] = {item1= 8926,item2 = 8926,item3 = 8926,newitem = 8924},
      [4] = {item1= 8927,item2 = 8927,item3 = 8927,newitem = 8928},
      [5] = {item1= 8931,item2 = 8931,item3 = 8931,newitem = 8930},
      [6] = {item1= 8854,item2 = 8854,item3 = 8854,newitem = 8857},
      [7] = {item1= 8901,item2 = 8901,item3 = 8901,newitem = 8902},
      [8] = {item1= 2138,item2 = 2138,item3 = 2138,newitem = 2131},
      [9] = {item1= 2389,item2 = 2389,item3 = 2389,newitem = 7378}
}
local posNewItem = {x= 1081, y= 1084, z=9} -- pos do novo item

local it1= getThingFromPos(pos1)
local it2= getThingFromPos(pos2)
local it3= getThingFromPos(pos3)

  if (it1.itemid == config[1].item1) and (it2.itemid == config[1].item2) and (it3.itemid == config[1].item3) then
    doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[1].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 enchanted staff e obteve 1 spellwand.", MESSAGE_STATUS_CONSOLE_BLUE)
  elseif (it1.itemid == config[2].item1) and (it2.itemid == config[2].item2) and (it3.itemid == config[2].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[2].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 blessed shield e obteve 1 ornamented shield .", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[3].item1) and (it2.itemid == config[3].item2) and (it3.itemid == config[3].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[3].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 demonwing axe e obteve 1 hellgord axe.", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[4].item1) and (it2.itemid == config[4].item2) and (it3.itemid == config[4].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[4].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 dark trinity mace e obteve 1 obsidian truncheon .", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[5].item1) and (it2.itemid == config[5].item2) and (it3.itemid == config[5].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[5].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 ephinnyc sword e obteve 1 emerald sword.", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[6].item1) and (it2.itemid == config[6].item2) and (it3.itemid == config[6].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[6].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 warsinger bow e obteve 1 silkweaver bow .", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[7].item1) and (it2.itemid == config[7].item2) and (it3.itemid == config[7].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[7].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 spellbook of warding e obteve 1 spellbook of mind control .", MESSAGE_STATUS_CONSOLE_BLUE)
   elseif (it1.itemid == config[8].item1) and (it2.itemid == config[8].item2) and (it3.itemid == config[8].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[8].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 sapphire amulet e obteve 1 star amulet.", MESSAGE_STATUS_CONSOLE_BLUE)
  elseif (it1.itemid == config[9].item1) and (it2.itemid == config[9].item2) and (it3.itemid == config[9].item3)then 
     doRemoveItem(it1.uid)
      doRemoveItem(it2.uid)
         doRemoveItem(it3.uid)
      doCreateItem(config[9].newitem, 1, posNewItem)
     doBroadcastMessage("[SISTEMA DE FUSAO] O jogador (" .. getCreatureName(cid) .. ") fundiu 3 spear e obteve 1 royal spear.", MESSAGE_STATUS_CONSOLE_BLUE)
    -- so seguir o padrao de elseif.
  end

  
 return true
end