function onKill(cid, target, lastHit)
if lastHit and isMonster(target) and getCreatureName(target):lower() == 'verminor' then
doPlayerBroadcastMessage(cid, "O player" .. getCreatureName(cid) .. ", matou o BOSS Darkzu!")
end
return true
end