local coin = 8918 -- sua moeda vip
local lever = {
[1535] = {3,8904},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 spellbook of dark mysteries.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de 3 spellbook of dark mysteries = 1 spellscroll of prophecies.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end