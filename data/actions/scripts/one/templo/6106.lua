local coin = 8302 -- sua moeda vip
local lever = {
[6106] = {1,2160},
}
local arrows = {8303,8302,8301} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem pedra refinadora nível 4 para vender (60000 gold coins = 6k = 6 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 6 or 6)
                                                                doSendAnimatedText(toPosition,'Vendido!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end