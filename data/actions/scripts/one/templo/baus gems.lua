local coin = 2160 -- sua moeda vip
local lever = {
[6016] = {1000,2158},
[6017] = {1000,2154},
[6018] = {1000,2156},
}
local arrows = {8303,8302,8301} -- coloque o ID aqui
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente (1000000 gold coins = 1000k = 1000 crystal coins).")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doSendAnimatedText(toPosition,'Comprado!', TEXTCOLOR_BLUE)
                                                                doSendMagicEffect(toPosition,12)
                                return true
end