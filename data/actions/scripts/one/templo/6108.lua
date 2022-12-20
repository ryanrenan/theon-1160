local coin = 8301 -- sua moeda vip
local lever = {
[6108] = {1,2160},
}
local arrows = {8303,8302,8301} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem pedra refinadora nível 3 para vender (30000 gold coins = 3k = 3 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 3 or 3)
                                                                doSendAnimatedText(toPosition,'Vendido!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end