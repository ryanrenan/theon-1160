--[[ 
    Talking Tp/signs/tiles for TFS 0.2+
    70%shawak,30%Damadgerz
    Idea by Damadgerz
]]--
    local time = 3    -- 1 = 1 sec, 2 = 2 sec, ...

     local say_events = {}
local function SayText(cid)
    if isPlayer(cid) == TRUE then
         if say_events[getPlayerGUID(cid)] ~= nil then
             if isPlayer(cid) == TRUE then
                 doSendAnimatedText(getPlayerPosition(cid),"Restart!", math.random(01,255))
             end
             say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 700 / 2, cid)       
         end                                                       
    end
    return TRUE
end
function onSay(cid, words, param, channel) 
    if(param == '') then
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
     return true
     end
     if param == "on" then
        if isPlayer(cid) == TRUE then
            doSendAnimatedText(getPlayerPosition(cid),"Restart!", math.random(01,255))
        end
        say_events[getPlayerGUID(cid)] = addEvent(SayText, time * 1000, cid)
        doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Restart MODE ON.")
     elseif param == "off" then
            stopEvent(say_events[getPlayerGUID(cid)])
            say_events[getPlayerGUID(cid)] = nil
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Restart MODE OFF.")
    end
    return TRUE
end

