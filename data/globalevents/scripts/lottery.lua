function onThink(cid, interval, lastExecution)
local config = {
hours = 1,
items = {{2156,5},{2154,5},{2158,5},{6547,1},{6548,1},{6549,1}}
}
local on,list = getPlayersOnline(),{}
if #on > 0 then
for i = 1, #on do
if getPlayerAccess(on[i]) < 3 and getCreatureName(on[i]) ~= "Account Manager" then 
table.insert(list, on[i])
end
end
if #list > 0 then
local p,r = list[math.random(#list)],config.items[math.random(#config.items)]
doPlayerAddItem(p, r[1], r[2] or 1)
doBroadcastMessage("[LOTTERY SYSTEM] Winner: " .. getCreatureName(p) .. ", Reward: "..r[2].." "..getItemNameById(r[1]).."! Congratulations! (Next Lottery in "..config.hours.." hours)")
end
end         
return true
end