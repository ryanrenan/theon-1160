local coin = 2138 -- sua moeda vip
local lever = {
[1528] = {3,2131},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 Sapphire Amulet.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de 3 Sapphire Amulet = 1 Star amulet.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end