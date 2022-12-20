local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1492)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)


local Zombie = {
frompos = {x=1136, y=1019, z=7},
topos = {x=1169, y=1039, z=7},
}
function onCastSpell(cid, var)
if not isInArea(getPlayerPosition(cid), Zombie.frompos, Zombie.topos) then
return doCombat(cid, combat, var)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode usar firebomb rune no evento zombie.")
end
end