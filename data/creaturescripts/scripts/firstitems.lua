  local commonItems = {
  -- ITEMS ALL VOCS RECEIVE
  {itemid=2120, count=1}, -- rope
  {itemid=2789, count=100}, -- brown mushrooms
  {itemid=2305, count=1}, -- fire bomb rune
  {itemid=2261, count=1}, -- destroy field rune
  {itemid=2168, count=1}, -- mana ring
  {itemid=2273, count=1}, -- uh
}

local firstItems = {
  { -- SORC ITEMS
    {itemid=2461, count=1}, -- leather helmet
    {itemid=2467, count=1}, -- leather armor
    {itemid=2649, count=1}, -- leather legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2175, count=1}, -- spellbook
    {itemid=2190, count=1}, -- wand of inferno  

    {itemid=2268, count=1}, -- sd
    {itemid=7590, count=1}, -- gmp
    {itemid=2293, count=1}, -- mw
    {itemid=2269, count=1}, -- wg
  },
  { -- DRUID ITEMS
    {itemid=2461, count=1}, -- leather helmet
    {itemid=2467, count=1}, -- leather armor
    {itemid=2649, count=1}, -- leather legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2175, count=1}, -- spellbook
    {itemid=2182, count=1}, -- hailstorm rod  

    {itemid=2268, count=1}, -- sd
    {itemid=7590, count=1}, -- gmp
    {itemid=2293, count=1}, -- mw
    {itemid=2269, count=1}, -- wg
    {itemid=2278, count=1}, -- para
  },
  { -- PALADIN ITEMS
    {itemid=2461, count=1}, -- leather helmet
    {itemid=2467, count=1}, -- leather armor
    {itemid=2649, count=1}, -- leather legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2526, count=1}, -- studded shield
    {itemid=7368, count=10}, -- assassin stars

    {itemid=2268, count=1}, -- sd
    {itemid=8472, count=1}, -- gsp
    {itemid=7589, count=1}, -- smp
    {itemid=7588, count=1}, -- shp
    {itemid=2293, count=1}, -- mw
    {itemid=2269, count=1}, -- wg
  },
  { -- KNIGHT ITEMS
    {itemid=2461, count=1}, -- leather helmet
    {itemid=2467, count=1}, -- leather armor
    {itemid=2649, count=1}, -- leather legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2526, count=1}, -- studded shield
    {itemid=8602, count=1}, -- jagged sword
    {itemid=8601, count=1}, -- Steel Axe
    {itemid=2394, count=1}, -- morning star

    {itemid=7620, count=1}, -- mp
    {itemid=7591, count=1}, -- ghp
    {itemid=8473, count=1}, -- uhp
    {itemid=2313, count=1}, -- explosion
    {itemid=2293, count=1}, -- mw
    {itemid=2269, count=1}, -- wg
  }
}

for _, items in ipairs(firstItems) do
  for _, item in ipairs(commonItems) do
    table.insert(items, item)
  end
end

function onLogin(cid)
  if getPlayerGroupId(cid) < 2 then
    local hasReceivedFirstItems = getPlayerStorageValue(cid, 67708)

    if hasReceivedFirstItems == -1 then
      --[[local backpack = ]]doPlayerAddItem(cid, 1988, 1)

      local giveItems = firstItems[getPlayerVocation(cid)]

      if giveItems ~= nil then
        for _, v in ipairs(giveItems) do
          --doAddContainerItem(backpack, v.itemid, v.count or 1)
          doPlayerAddItem(cid, v.itemid, v.count or 1)
        end

        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você recebeu seus equipamentos.")
        setPlayerStorageValue(cid, 67708, 1)  
      end
    end
  end
  return TRUE
end 