function onLook(cid, thing, position, lookDistance)
function getArticle(str) return isInArray({"a","e","i","o","u"},string.sub(str,0,1)) and "an" or "a" end
 
    if isPlayer(thing.uid) and thing.uid ~= cid and getPlayerAccess(thing.uid) > 4 then
s = getPlayerSex(thing.uid)
        doPlayerSetSpecialDescription(thing.uid,'\n'..(s == 1 and "He" or "She")..' is '..getArticle(getPlayerVocationName(thing.uid))..' '..getPlayerVocationName(thing.uid)..'.')
        return true
    elseif thing.uid == cid then
if getPlayerAccess(cid) > 4 then
doPlayerSetSpecialDescription(thing.uid,'\nYou are '..getArticle(getPlayerVocationName(cid))..' '..getPlayerVocationName(cid)..'.')
end
        local string = 'You see yourself.'
        if getPlayerFlagValue(cid, PLAYERFLAG_SHOWGROUPINSTEADOFVOCATION) then
            string = string..' You are '.. getPlayerGroupName(cid) ..'.'
        elseif getPlayerVocation(cid) ~= 0 then
            string = string..' You are '.. getPlayerVocationName(cid) ..'.'
        else
            string = string..' You have no vocation.'
        end
        string = string..getPlayerSpecialDescription(cid)..''
 
        if getPlayerNameByGUID(getPlayerPartner(cid), false, false) ~= nil then
            string = string..' You are '.. (getPlayerSex(cid) == 0 and 'wife' or 'husband') ..' of '.. getPlayerNameByGUID(getPlayerPartner(cid)) ..'.'
        end
 
        if getPlayerGuildId(cid) > 0 then 
            string = string..' You are ' .. (getPlayerGuildRank(cid) == '' and 'a member' or getPlayerGuildRank(cid)) ..' of the '.. getPlayerGuildName(cid)
            string = getPlayerGuildNick(cid) ~= '' and string..' ('.. getPlayerGuildNick(cid) ..').' or string..'.'
        end 
 
        if getPlayerFlagValue(cid, MESSAGE_STATUS_CONSOLE_ORANGE) then
            string = string..'\nHealth: ['.. getCreatureHealth(cid) ..' / '.. getCreatureMaxHealth(cid) ..'], Mana: ['.. getCreatureMana(cid) ..' / '.. getCreatureMaxMana(cid) ..'].'
            string = string..'\nIP: '.. doConvertIntegerToIp(getPlayerIp(cid)) ..'.'
        end
 
        if getPlayerFlagValue(cid, PLAYERCUSTOMFLAG_CANSEEPOSITION) then
            string = string..'\nPosition: [X:'.. position.x..'] [Y:'.. position.y..'] [Z:'.. position.z..'].'
        end
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, string)  
        return false
    end
    return true
end