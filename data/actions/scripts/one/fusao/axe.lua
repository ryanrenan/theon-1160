local coin = 8926 -- sua moeda vip
local lever = {
[1523] = {3,8924},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 demonwing axe.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de 3 demonwing axe = 1 hellforged axe.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end