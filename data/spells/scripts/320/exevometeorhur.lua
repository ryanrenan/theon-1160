local combat = createCombatObject()
local combat2 = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 26)	
setCombatFormula(meteor, COMBAT_FORMULA_SKILL, 20, 20, 19, 19)

local meteor2 = createCombatObject()
setCombatParam(meteor2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(meteor2, COMBAT_PARAM_EFFECT, 5) 
setCombatFormula(meteor2, COMBAT_FORMULA_SKILL, 20, 29, 19, 19)

combat_arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(0, 0) == 0) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 1})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 3, y = pos.y + 5, z = pos.z}
doSendDistanceShoot(newpos, pos, 24)
addEvent(meteorCast, 300, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos2 = {x = pos.x - 9, y = pos.y - 9, z = pos.z}
doSendDistanceShoot(newpos2, pos, 24)
addEvent(meteorCast, 300, {cid = cid, pos = pos, combat = meteor})
local newpos3 = {x = pos.x - 9, y = pos.y - 9, z = pos.z}
doSendDistanceShoot(newpos3, pos, 24)
addEvent(meteorCast, 600, {cid = cid, pos = pos, combat = meteor2})
end
end
end


setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")


function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end