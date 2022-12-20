local coin = 7759 -- sua moeda vip
local lever = {
[1541] = {10,6547},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 10 (Item exclusivo do Castle) Blue Gems.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 1 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Comprou uma Castle yellow gem +1.5k HP/MP.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end