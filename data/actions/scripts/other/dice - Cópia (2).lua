function onUse(cid, item, fromPosition, itemEx, toPosition)
local bet = 500
local ultimo_item = 4
local jejoy = {
[1] = {id = 5796,effect = 26,count = 1,animated = "Dice!"},
[2] = {id = 2148,effect = 39,count = 13,animated = "Coins!"},
[3] = {id = 2463,effect = 34,count = 1,animated = "Armor!"},
[4] = {id = 0,effect = 2,count = 0,animated = "Lose!"}
}
local random = math.random(1,ultimo_item)
        if getPlayerMoney(cid) < bet then
        doPlayerSendCancel(cid,"You need "..bet - getPlayerMoney(cid).." gold coins to play.")
        end
        if doPlayerRemoveMoney(cid,bet) == TRUE then
        if random == ultimo_item then
        doSendMagicEffect(getPlayerPosition(cid),jejoy[random].effect)
        doSendAnimatedText(toPosition,jejoy[random].animated,TEXTCOLOR_BROWN)
        doPlayerSendCancel(cid,"You get anything.")
        end
        if random < ultimo_item then
        doPlayerAddItem(cid,jejoy[random].id,jejoy[random].count)
        doSendMagicEffect(getPlayerPosition(cid),jejoy[random].effect)
        doSendAnimatedText(toPosition,jejoy[random].animated,TEXTCOLOR_BROWN)
        doPlayerSendCancel(cid,"You get a "..getItemNameById(jejoy[random].id).."!")
        end
        end
        return true
end