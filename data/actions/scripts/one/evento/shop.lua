local coin = 2159 -- sua moeda vip
local lever = {
[6020] = {10,2214},
[6021] = {10,2168},
[6022] = {10,9933},
[6023] = {10,2695},
[6024] = {10,1990},
[6026] = {10,5952},
[6030] = {10,8305},
[6031] = {10,2206},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você precisa de 10 event coins.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 5 or 1)
                                                                doSendAnimatedText(toPosition,'Comprado!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end