local coin = 8925 -- sua moeda vip
local lever = {
[1542] = {3,2357},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerNoSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                         
                         return true
end