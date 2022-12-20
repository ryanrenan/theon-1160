  function onUse(cid, item, frompos, item2, topos)
        if item2.itemid == 10077 then
                local skill = getPlayerSkillLevel(cid, 6)
                math.random(1, ((100+skill)/10))
                doSendAnimatedText(getPlayerPosition(cid), "DEAD NOOB", TEXTCOLOR_RED)
                doSendMagicEffect(getCreaturePosition(cid), math.random(28,30))
                if random_number<=skill_level then
                doPlayerAddItem(cid,2160,1)
          end
            doPlayerAddSkillTry(cid,6,1)
    else 
    return 0
  end
  return 1
  end


coloca no fishing original
 if getPlayerItemCount(cid, ITEM_WORM) > 0 then