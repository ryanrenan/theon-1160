local config = {
[1] = {item = {2152, 1}, chance = 10000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 Platinum Coin
[2] = {item = {2152, 2}, chance = 15000000, fishing = 10, quest = {enable = false, storage = nil}}, -- 2 Platinum Coins
[3] = {item = {2152, 3}, chance = 10000000, fishing = 30, quest = {enable = false, storage = nil}}, -- 3 Platinum Coins
[4] = {item = {2152, 4}, chance = 1500000, fishing = 50, quest = {enable = false, storage = nil}}, -- 4 Platinum Coins
[5] = {item = {2152, 5}, chance = 100000, fishing = 70, quest = {enable = false, storage = nil}}, -- 5 Platinum Coins
[6] = {item = {2152, 6}, chance = 100000, fishing = 90, quest = {enable = false, storage = nil}}, --  6 Platinum Coins

[7] = {item = {2160, 1}, chance = 10000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 Crystal Coin
[8] = {item = {2160, 2}, chance = 10000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 Crystal Coins
[9] = {item = {2160, 3}, chance = 1000000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 Crystal Coins
[10] = {item = {2160, 4}, chance = 1000000, fishing = 60, quest = {enable = false, storage = nil}}, -- 4 Crystal Coins
[11] = {item = {2160, 5}, chance = 100000, fishing = 80, quest = {enable = false, storage = nil}}, -- 5 Crystal Coins
[12] = {item = {2160, 6}, chance = 100000, fishing = 100, quest = {enable = false, storage = nil}}, -- 6 Crystal Coins

[13] = {item = {6541, 1}, chance = 1000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 holy pet
[14] = {item = {6541, 2}, chance = 1000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 holy pets
[15] = {item = {6541, 3}, chance = 100000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 holy pets
[16] = {item = {6541, 4}, chance = 100000, fishing = 60, quest = {enable = false, storage = nil}}, -- 4 holy pets
[17] = {item = {6541, 5}, chance = 10000, fishing = 75, quest = {enable = false, storage = nil}}, -- 5 holy pets
[18] = {item = {6541, 6}, chance = 10000, fishing = 90, quest = {enable = false, storage = nil}}, -- 6 holy pets

[19] = {item = {6542, 1}, chance = 1000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 fire pet
[20] = {item = {6542, 2}, chance = 1000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 fire pets
[21] = {item = {6542, 3}, chance = 100000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 fire pets
[22] = {item = {6542, 4}, chance = 100000, fishing = 60, quest = {enable = false, storage = nil}}, -- 4 fire pets
[23] = {item = {6542, 5}, chance = 10000, fishing = 75, quest = {enable = false, storage = nil}}, -- 5 fire pets
[24] = {item = {6542, 6}, chance = 10000, fishing = 90, quest = {enable = false, storage = nil}}, -- 6 fire pets

[25] = {item = {6543, 1}, chance = 1000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 ice pet
[26] = {item = {6543, 2}, chance = 1000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 ice pets
[27] = {item = {6543, 3}, chance = 100000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 ice pets
[28] = {item = {6543, 4}, chance = 100000, fishing = 50, quest = {enable = false, storage = nil}}, -- 4 ice pets
[29] = {item = {6543, 5}, chance = 10000, fishing = 75, quest = {enable = false, storage = nil}}, -- 5 ice pets
[30] = {item = {6543, 6}, chance = 10000, fishing = 90, quest = {enable = false, storage = nil}}, -- 6 ice pets

[31] = {item = {6544, 1}, chance = 1000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 terra pet
[32] = {item = {6544, 2}, chance = 1000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 terra pets
[33] = {item = {6544, 3}, chance = 100000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 terra pets
[34] = {item = {6544, 4}, chance = 100000, fishing = 50, quest = {enable = false, storage = nil}}, -- 4 terra pets
[35] = {item = {6544, 5}, chance = 10000, fishing = 75, quest = {enable = false, storage = nil}}, -- 5 terra pets
[36] = {item = {6544, 6}, chance = 10000, fishing = 90, quest = {enable = false, storage = nil}}, -- 6 terra pets

[37] = {item = {6545, 1}, chance = 1000000, fishing = 0, quest = {enable = false, storage = nil}}, -- 1 energy pet
[38] = {item = {6545, 2}, chance = 1000000, fishing = 20, quest = {enable = false, storage = nil}}, -- 2 energy pets
[39] = {item = {6545, 3}, chance = 100000, fishing = 40, quest = {enable = false, storage = nil}}, -- 3 energy pets
[40] = {item = {6545, 4}, chance = 100000, fishing = 50, quest = {enable = false, storage = nil}}, -- 4 energy pets
[41] = {item = {6545, 5}, chance = 10000, fishing = 75, quest = {enable = false, storage = nil}}, -- 5 energy pets
[42] = {item = {6545, 6}, chance = 10000, fishing = 90, quest = {enable = false, storage = nil}}, -- 6 energy pets

[43] = {item = {8911, 1}, chance = 0, fishing = 50, quest = {enable = false, storage = nil}}, -- northwind rod 0,005%
[44] = {item = {2185, 1}, chance = 0, fishing = 50, quest = {enable = false, storage = nil}}, -- Fish Fin 0,05%
[45] = {item = {8850, 1}, chance = 0, fishing = 60, quest = {enable = false, storage = nil}}, -- chain bolter 0,01%
[46] = {item = {2644, 1}, chance = 0, fishing = 60, quest = {enable = false, storage = nil}}, -- bunny slippers 0,0015%
[47] = {item = {2196, 1}, chance = 0, fishing = 60, quest = {enable = false, storage = nil}}, -- broken amulet 0,0005%
[48] = {item = {2508, 1}, chance = 0, fishing = 60, quest = {enable = false, storage = nil}}, -- native armor 0,0005%
[49] = {item = {8853, 1}, chance = 0, fishing = 60, quest = {enable = false, storage = nil}}, -- ironworker 0,0065%
[50] = {item = {2669, 1}, chance = 0, fishing = 70, quest = {enable = false, storage = nil}}, -- Northern Pikes 10%
[51] = {item = {2183, 1}, chance = 0, fishing = 70, quest = {enable = false, storage = nil}}, -- hailstorm rod 0,0015%
[52] = {item = {8912, 1}, chance = 0, fishing = 70, quest = {enable = false, storage = nil}}, -- springsprout rod 0,0015%
[53] = {item = {8856, 1}, chance = 0, fishing = 70, quest = {enable = false, storage = nil}}, -- yol's bow 0,005%
[54] = {item = {7963, 1}, chance = 0, fishing = 80, quest = {enable = false, storage = nil}}, -- # FISH SHARK FISH 10%
[55] = {item = {8858, 1}, chance = 0, fishing = 80, quest = {enable = false, storage = nil}}, -- elethriel's elemental bow 0,001%
[56] = {item = {8888, 1}, chance = 0, fishing = 90, quest = {enable = false, storage = nil}}, -- master archer's armor 0,0001%
[57] = {item = {2130, 1}, chance = 0, fishing = 100, quest = {enable = false, storage = nil}}, -- golden amulet 0,0001%
[58] = {item = {2646, 1}, chance = 0, fishing = 100, quest = {enable = false, storage = nil}}, -- golden boots 0,0001%

[59] = {item = {ITEM_WORM, 1}, chance = 92392, fishing = 0, quest = {enable = false, storage = nil}}
}
local max = 0
for _, i in pairs(config) do
        max = max + i.chance
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local playerFishing = getPlayerSkill(cid, SKILL_FISHING)
        local random = math.random(max)
        local now = nil
        for i = 1, #config do
                random = random - config[i].chance
                if random <= 1 then
                        now = config[i]
                        break
                end
        end

if getPlayerLevel(cid) <= 119 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem nível 120+ para ter acesso a pesca!")
return true
end

        if itemEx.itemid >= 8632 and itemEx.itemid <= 8632 or itemEx.itemid == 8632 then
                if math.random(1, 0.7 + playerFishing / 0.8) <= playerFishing and now then
                        if playerFishing >= now.fishing then
                                if now.quest.enable then
                                        if getPlayerStorageValue(cid, now.quest.storage) < 1 then
                                                doPlayerAddItem(cid, now.item[1], now.item[2])
                                                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                                                doSendMagicEffect(fromPosition, 12)
                                                doSendAnimatedText(getPlayerPosition(cid), "OLD ROD!", TEXTCOLOR_LIGHTBLUE)
                                        else
                                                doPlayerAddItem(cid, 2152, 0)
                                                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                                                doSendMagicEffect(fromPosition, 12)
                                                doSendAnimatedText(getPlayerPosition(cid), "OLD ROD!", TEXTCOLOR_LIGHTBLUE)
                                        end
                                else
                                        doPlayerAddItem(cid, now.item[1], now.item[2])
                                        doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                                        doSendMagicEffect(fromPosition, 12)
                                        doSendAnimatedText(getPlayerPosition(cid), "OLD ROD!", TEXTCOLOR_LIGHTBLUE)
                                end
                        else
                                doPlayerAddItem(cid, 2152, 1)
                                doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
                                doSendMagicEffect(fromPosition, 12)
                                doSendAnimatedText(getPlayerPosition(cid), "OLD ROD!", TEXTCOLOR_LIGHTBLUE)
                        end
                end
                doSendMagicEffect(toPosition, 53)
                doPlayerRemoveItem(cid, ITEM_WORM, 1)
        return TRUE
        end
return FALSE
end 