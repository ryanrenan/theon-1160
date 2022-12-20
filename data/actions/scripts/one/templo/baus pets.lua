local coin = 2160 -- sua moeda vip
local lever = {
[6011] = {20,6541},
[6012] = {20,6542},
[6013] = {20,6543},
[6014] = {20,6544},
[6015] = {20,6545},
}
local arrows = {6541,6542,6543,6544,6545} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente (20000 gold coins = 20k = 20 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doSendAnimatedText(toPosition,'Comprado!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end