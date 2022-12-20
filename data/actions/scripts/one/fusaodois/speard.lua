local coin = 7378 -- sua moeda vip
local lever = {
[1533] = {3,7367},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 royal spear.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de 3 royal spear = 1 enchanted spear.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end