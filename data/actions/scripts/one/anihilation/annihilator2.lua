    function onUse(cid, item, frompos, item2, topos)
    if item.uid == 6004 then
    if item.itemid == 1945 then
    player1pos = {x=1122, y=1152, z=7, stackpos=253}
    player1 = getThingfromPos(player1pos)

    player2pos = {x=1123, y=1152, z=7, stackpos=253}
    player2 = getThingfromPos(player2pos)

    player3pos = {x=1124, y=1152, z=7, stackpos=253}
    player3 = getThingfromPos(player3pos)

    player4pos = {x=1125, y=1152, z=7, stackpos=253}
    player4 = getThingfromPos(player4pos)


    if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

    player1level = getPlayerLevel(player1.uid)
    player2level = getPlayerLevel(player2.uid)
    player3level = getPlayerLevel(player3.uid)
    player4level = getPlayerLevel(player4.uid)

    questlevel = 100

    if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

    queststatus1 = getPlayerStorageValue(player1.uid,6026)
    queststatus2 = getPlayerStorageValue(player2.uid,6026)
    queststatus3 = getPlayerStorageValue(player3.uid,6026)
    queststatus4 = getPlayerStorageValue(player4.uid,6026)

    if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then

    demon1pos = {x=1129, y=1152, z=8}
    demon2pos = {x=1129, y=1153, z=8}
    demon3pos = {x=1129, y=1154, z=8}
    demon4pos = {x=1121, y=1152, z=8}
    demon5pos = {x=1121, y=1153, z=8}
    demon6pos = {x=1121, y=1154, z=8}

    doSummonCreature("Demon", demon1pos)
    doSummonCreature("Demon", demon2pos)
    doSummonCreature("Demon", demon3pos)
    doSummonCreature("Demon", demon4pos)
    doSummonCreature("Demon", demon5pos)
    doSummonCreature("Demon", demon6pos)

    nplayer1pos = {x=1124, y=1153, z=8}
    nplayer2pos = {x=1125, y=1153, z=8}
    nplayer3pos = {x=1126, y=1153, z=8}
    nplayer4pos = {x=1127, y=1153, z=8}

    doSendMagicEffect(player1pos,2)
    doSendMagicEffect(player2pos,2)
    doSendMagicEffect(player3pos,2)
    doSendMagicEffect(player4pos,2)

    doTeleportThing(player1.uid,nplayer1pos)
    doTeleportThing(player2.uid,nplayer2pos)
    doTeleportThing(player3.uid,nplayer3pos)
    doTeleportThing(player4.uid,nplayer4pos)

    doSendMagicEffect(nplayer1pos,10)
    doSendMagicEffect(nplayer2pos,10)
    doSendMagicEffect(nplayer3pos,10)
    doSendMagicEffect(nplayer4pos,10)

    doTransformItem(item.uid,item.itemid+0)

    else
    doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    else
    doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    else
    doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    elseif item.itemid == 1945 then
    if getPlayerAccess(cid) == 3 then
    doTransformItem(item.uid,item.itemid-1)
    else
    doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    end
    end
    return 1
    end