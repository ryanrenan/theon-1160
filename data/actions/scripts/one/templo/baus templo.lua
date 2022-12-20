local coin = 2160 -- sua moeda vip
local lever = {
[6002] = {10,9931},
[6003] = {10,2184},
[6004] = {10,7438},
[6005] = {10,2352},
[6007] = {10,2197},
[6008] = {10,8929},
[6009] = {10,8925},
[6010] = {10,8932}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente (10000 gold coins = 10k = 10 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doSendAnimatedText(toPosition,'Comprado!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end