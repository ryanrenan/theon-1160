local coin = 2157 -- sua moeda vip
local lever = {
[1001] = {1,2156},
[1002] = {1,2154},
[1003] = {1,2158},
[1004] = {1,7958},
[1006] = {1,2400},
[1007] = {1,2431},
[1008] = {1,2452},
[1009] = {1,1990}
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem a moeda (1 Annihi Coin,Dropa Do Anihilation).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doSendAnimatedText(toPosition,'Receba!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end