local coin = 8901 -- sua moeda vip
local lever = {
[1527] = {3,8918},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� n�o tem 3 spellbook of warding.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fus�o de 3 spellbook of warding = 1 spellbook of mind control.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end