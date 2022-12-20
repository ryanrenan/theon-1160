local coin = 10523 -- sua moeda vip
local lever = {
[1543] = {3,8976},
}
function onUse(cid,item,fromPosition,itemEx,toPosition)
                                  if doPlayerRemoveItem(cid,coin,lever[item.actionid][1]) == FALSE then
                                  return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem 3 (Item exclusivo do Castle) a  many pet egg.")
                                  end
                                                                doPlayerAddItem(cid,lever[item.actionid][2], isItemStackable(lever[item.actionid][2]) and 100 or 1)
                                                                doBroadcastMessage("O jogador (" .. getCreatureName(cid) .. ") Fez a fusão de (fusão exclusivo de pet) Lendary Killer.")
                                                                doSendMagicEffect(toPosition,12)
                                return true
end