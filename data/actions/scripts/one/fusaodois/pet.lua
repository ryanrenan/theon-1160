local coin = 4850 -- sua moeda vip
local lever = {
[1546] = {3,8976},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� n�o tem 3 draug pet egg.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fus�o de 1 (fus�o exclusivo de pet) Lendary Killer pet egg.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end