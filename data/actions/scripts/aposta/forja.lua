local formulas = {
{{5911,30},0,0,id=8473,count=1}, --- red piece of cloth + nd + nd = Great health potion
{5922,{6500,2},0,id=2391,count=1}, -- holy orchid + 2 demoniac esscence = war hammer
{6500,6500,6500,id=2391,count=1}, -- demoniac esscence + demoniac esscence + demoniac esscence = war hammer
}
function isInArraya(a, v,i1,i2)--- script By mock
i1 = i1 or 0
i2 = i2 or 0
for i=1,#a do
if i ~= i1 and i ~= i2 then 
if a[i] == v then
return a[i], i
elseif type(a[i]) == 'table' and a[i][1] == v then
return a[i][1], i 
end
end 
end
return false
end
function getForm(n1,n2,n3,n1cnt,n2cnt,n3cnt)--- script By mock
n1 = n1 or 0
n2 = n2 or 0
n3 = n3 or 0
n2cnt = n2cnt or 1
n1cnt = n1cnt or 1
n3cnt = n3cnt or 1
if not n1 then
return 'nil'
end
local fnd = {}
local ret = {}
for i=1,#formulas do
local find1, p1 = isInArraya(formulas[i], n1,0)
local find2, p2 = isInArraya(formulas[i], n2,p1)
local find3, p3 = isInArraya(formulas[i], n3,p1,p2)
if (find1 == formulas[i][p1] or (type(formulas[i][p1]) == 'table' and formulas[i][p1][1] == find1 )) and
(find2 == formulas[i][p2] or (type(formulas[i][p2]) == 'table' and formulas[i][p2][1] == find2 )) and
(find3 == formulas[i][p3] or (type(formulas[i][p3]) == 'table' and formulas[i][p3][1] == find3 )) then
if (type(formulas[i][1]) ~= 'table' or formulas[i][1][2] <= n1cnt) and (type(formulas[i][2]) ~= 'table' or formulas[i][2][2] <= n2cnt) and (type(formulas[i][3]) ~= 'table' or formulas[i][3][2] <= n3cnt) then

if type(formulas[i][1]) == 'table' then
n1 = formulas[i][1][1]
n1cnt = formulas[i][1][2]
end
if type(formulas[i][2]) == 'table' then
n2 = formulas[i][2][1]
n2cnt = formulas[i][2][2]
end
if type(formulas[i][3]) == 'table' then
n3 = formulas[i][3][1]
n3cnt = formulas[i][3][2]
end
return {id=formulas[i].id,{n1,n1cnt},{n2,n2cnt},{n3,n3cnt},count=formulas[i].count,form=formulas[i]} 
end
end
end
return n1..'-'..n2..'-'..n3
end
function onUse(cid, item, frompos, item2, topos)
--- script By mock
if getPlayerStorageValue(cid, 10906) < os.time() then
setPlayerStorageValue(cid,10906, os.time()+5)
doTransformItem(item.uid, 9562)
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9562 then
doTransformItem(item.uid, 9563)
break
end
end
end,1500)
local posittions = {
{x=1089,y=1091,z=9,stackpos=255}, --- pos de um item
{x=1090,y=1091,z=9,stackpos=255}, --- pos de um item
{x=1091,y=1091,z=9,stackpos=255}, --- pos de um item
{x=1089,y=1090,z=9,stackpos=255}, --- pos do resultado.
}
local tb = {}
local k
for i=1,#posittions do
if i == 4 then break end;
k = getThingfromPos(posittions[i])

if k.itemid ~= 0 then
table.insert(tb,1,k)
doSendMagicEffect(posittions[i],14)
else
doSendMagicEffect(posittions[i],13)
end
end
local n1 = tb[1] or {temid=0,type=0}
local n2 = tb[2] or {temid=0,type=0}
local n3 = tb[3] or {temid=0,type=0}
doPlayerSendTextMessage(cid, 25,"Verificando.")
local ret = getForm(n1.itemid,n2.itemid,n3.itemid,n1.type,n2.type,n3.type)
if type(ret) == 'table' then
for i=1,#posittions do
if i == 4 then break end;
k = getThingfromPos(posittions[i])
for e=1,#ret do
if type(ret[e]) == 'table' then
if ret[e][1] == k.itemid and k.itemid ~= 0 then
local del = ret[e][2]
if del == 0 then del = 1 end
doRemoveItem(k.uid,del)
addEvent(doSendMagicEffect,3000,posittions[i], 0)
break
end
end 
end
end
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9563 then
doTransformItem(item.uid, 9565)
break
end
end
doCreateItem(ret.id,ret.count, posittions[4])
doSendMagicEffect(posittions[4], 56)
if ret.count ~= 1 then
fnsh = 's'
end
fnsh = fnsh or ''
if getItemNameById == nil then
getItemNameById = getItemName
end
doPlayerSendTextMessage(cid, 25,"Você criou "..ret.count.." ".. getItemNameById(ret.id) ..fnsh..".")
end,3000)
else
addEvent(function()
for stackpos=1,255 do
topos.stackpos = stackpos
item = getThingfromPos(topos)
if item.itemid == 9563 then
doTransformItem(item.uid, 9565)
break
end
end
doPlayerSendTextMessage(cid, 25,"Não existe esta combinação.")
end,3000)
end

return TRUE
else
doPlayerSendCancel(cid,"Aguarde.")
doSendMagicEffect(topos, 2)
return FALSE
end
end