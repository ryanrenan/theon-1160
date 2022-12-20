local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function getSpellDamage(cid, weaponSkill, weaponAttack)
    damage_min = (weaponSkill * weaponAttack / 22) * 2.5
    damage_max = (weaponSkill * weaponAttack / 22) * 4.5

    if(damage_max < damage_min) then
        local tmp = damage_max
	  damage_max = damage_min
	  damage_min = tmp
    end
    return -damage_min, -damage_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getSpellDamage")

local condition = createConditionObject(EXHAUST_HEALING)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
