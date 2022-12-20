local coin = 8928 -- sua moeda vip
local lever = {
[1531] = {3,2453},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 obsidian truncheon.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de 3 obsidian truncheon = 1 Arcane Club.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end