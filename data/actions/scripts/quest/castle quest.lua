function onUse(cid, item, fromPosition, itemEx, toPosition)
        local tppos = {x=1095,y=1062,z=7}
        local exp = 100000 -- Quanto de experience o player irá ganhar?!
        local default = {2090,6570}
        local vocs = {2158,2158,2154,2154,2158,2158,2154,2156}
        for x,i in pairs(default) do
                doPlayerAddItem(cid,i)
                doPlayerAddExp(cid, exp)
        end
        local bp = doPlayerAddItem(cid,5801,1)
        local gala = math.random(1,10)
        for x = 1, gala do
                doAddContainerItem(bp, 2160, 100)
        end
        local add = math.random(1,100)
        doAddContainerItem(bp, 2160, add)
        doPlayerAddItem(cid,vocs[getPlayerVocation(cid)],1)
        local ret = ""
        for x,i in pairs(default) do
                        if x == 1 then
                                ret = "1 " .. getItemNameById(i)
                        else
                                ret = ret .. ", 1 " ..getItemNameById(i)
                        end
        end
        for x,i in pairs(getPlayersOnline()) do
                doPlayerSendTextMessage(i, 19, "O jogador (" .. getPlayerName(cid).. ") completou o Castle e ganhou 100000 de experiência, "..ret..", 1 "..getItemNameById(vocs[getPlayerVocation(cid)]).." e "..gala..""..string.sub(add,1,10).." crystal coins!")
        end
        doTeleportThing(cid,tppos)
        doSendAnimatedText(getPlayerPosition(cid), "COMPLETOU!", TEXTCOLOR_YELLOW)
        doSendMagicEffect(getCreaturePosition(cid), math.random(28,28))
        doSendMagicEffect(tppos,10)
        return true
end