function onLogin(cid)
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == -1 then
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
end
registerCreatureEvent(cid, "BattleTeam")
registerCreatureEvent(cid, "BattleDeath")
return true
end


function onCombat(cid, target)
if isPlayer(cid) and isPlayer(target) then
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 and getPlayerStorageValue(target, _Lib_Battle_Info.TeamOne.storage) == 1 then
doPlayerSendCancel(cid, "Voc� n�o pode atacar o jogadores do seu time.") return false
end
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 and getPlayerStorageValue(target, _Lib_Battle_Info.TeamTwo.storage) == 1 then
doPlayerSendCancel(cid, "Voc� n�o pode atacar o jogadores do seu time.") return false
end
return true
end
return true
end

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 then
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, -1)
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)-1)
doRemoveCondition(cid, CONDITION_OUTFIT)
doPlayerSendTextMessage(cid, "[Evento Battlefield] Voc� foi morto!")
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 then
getWinnersBattle(_Lib_Battle_Info.TeamTwo.storage)
else
doBroadCastBattle(19,"[Evento Battlefield Informa��o] ".._Lib_Battle_Info.TeamOne.name.." "..getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage).." vs "..getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage).." " .._Lib_Battle_Info.TeamTwo.name)
end
elseif getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage, -1)
setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage)-1)
doRemoveCondition(cid, CONDITION_OUTFIT)
doPlayerSendTextMessage(cid, "[Evento Battlefield] Voc� foi morto!")
if getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage) == 0 then
getWinnersBattle(_Lib_Battle_Info.TeamOne.storage)
else
doBroadCastBattle(19,"[Evento Battlefield Informa��o] ".._Lib_Battle_Info.TeamOne.name.." "..getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage).." vs "..getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage).." " .._Lib_Battle_Info.TeamTwo.name)
end
end
return true
end