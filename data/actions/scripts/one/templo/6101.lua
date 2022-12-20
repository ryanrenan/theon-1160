local coin = 6542 -- sua moeda vip
local lever = {
[6101] = {1,2160},
}
local arrows = {8303,8302,8301} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem fire pet para vender (10000 gold coins = 10k = 10 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 10 or 10)
                                                                doSendAnimatedText(toPosition,'Vendido!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end