-- CONFIGURAÇÕES DE EXPERIENCIA --

useStages = false -- Usar sistema de Stages , true/false
premiumMultipliqueExp = 2 -- Players Premiums terão exp multiplicada, caso não querer deixe 1.
rateExp = 25 -- Exp caso não for usar stages.


local stages = { -- ["DELEVEL-ATELEVEL"] = EXP, (OBS: NUNCA  REPETIR O MSM NUMERO, SEMPRE COLOCAR UM A MAIS.)
	["1-50"] = 50,
	["51-100"] = 45,
	["101-150"] = 40,
	["151-200"] = 35,
	["201-250"] = 30,
	["251-300"] = 25,
	["351-400"] = 20,
}
ultimateExp = 15 -- exp que vai usar caso o level do player não tiver mais na tabela .

-- CONFIGURAÇÕES DA PARTY

partyPorcent = 40 -- Quantos Porcento da exp vai para os membros da party
levelBlockParty = 1000 -- Diferença Maxima de Level permitida para membro da party ganhar exp.
expShareRadiusX = 30 -- Distancia maxima permitida no eixo X para membro da party ganhar exp.
expShareRadiusY = 30 -- Distancia maxima permitida no eixo Y para membro da party ganhar exp.
expShareRadiusZ = 1 -- Distancia maxima permitida no eixo Z para membro da party ganhar exp.

-- CONFIGURAÇÕES DE RINGS --

local rings = { -- [ID DO ANEL] = EXP MULTIPLICADA POR X EXP.
	[3048] = 2,
	[3049] = 4,
	[3050] = 6,
}

-- FIM DAS CONFIGURAÇÕES --


function CalculeExp(monsterhp, exptotal, hit)
	hit = hit <= monsterhp and math.ceil(exptotal * hit / monsterhp) or 0
	return hit < 0 and 0 or hit
end

function isSummon(uid)
	return uid ~= getCreatureMaster(uid) or false
end

function onStatsChange(cid, attacker, type, combat, value)
	if getCreatureStorage(cid, 50001) ~= 1 then
		doCreatureSetStorage(cid, 50002, getMonsterInfo(getCreatureName(cid)).experience * rateExp)
		doCreatureSetStorage(cid, 50001, 1)
	end
	if type == STATSCHANGE_HEALTHLOSS then
		if isMonster(cid) then
			if isCreature(attacker) then
				local _cid = isSummon(attacker) and getCreatureMaster(attacker) or attacker
				if isPlayer(_cid) then
					if useStages then
						for strstage, experience in pairs(stages) do
							tabstage = string.explode(strstage, "-")
							if getPlayerLevel(_cid) >= tonumber(tabstage[1]) and getPlayerLevel(_cid) <= tonumber(tabstage[2]) then
								ultimateExp = experience
							end
						end
						experienceRate = ultimateExp
					else
						experienceRate = rateExp
					end
					local expgain = CalculeExp(getCreatureMaxHealth(cid), getMonsterInfo(getCreatureName(cid)).experience * experienceRate, value)
					if getCreatureStorage(cid, 50002) > 0 then
						if getCreatureStorage(cid, 50002) - expgain < 0 then
							expgain = getCreatureStorage(cid, 50002)
						end
						doCreatureSetStorage(cid, 50002, getCreatureStorage(cid, 50002) - expgain)
						local ringexp = 1
						for idring, expring in pairs(rings) do
							if getPlayerSlotItem(_cid, 9).itemid == idring then
								ringexp = expring
								break
							end
						end
						local premiumMultipliqueExp = isPremium(_cid) and premiumMultipliqueExp or 1
						expgain = expgain * ringexp * premiumMultipliqueExp
						local party = false
						if isInParty(_cid) then
							local partyMembers, expParty = getPartyMembers(getPartyLeader(_cid)), expgain / 100 * partyPorcent
							for indice, partyMember in pairs(partyMembers) do
								attackerLevel, partyLevel = getPlayerLevel(_cid), getPlayerLevel(partyMember)
								attackerPos, partyPos = getThingPos(_cid), getThingPos(partyMember)
								x = false
								if math.abs(attackerLevel - partyLevel) > levelBlockParty then
									x = true
								elseif math.abs(attackerPos.x - partyPos.x) > expShareRadiusX then
									x = true
								elseif math.abs(attackerPos.y - partyPos.y) > expShareRadiusY then
									x = true
								elseif attackerPos.z ~= partyPos.z then
									x = true
								elseif _cid == partyMember then
									x = true
								end
								if x then
									partyMembers[indice] = nil
								end
							end
							if #partyMembers ~= 0 then
								expParty = math.ceil(expgain / 100 * partyPorcent)
								expmember = math.ceil(expParty / #partyMembers)
								for _, member in pairs(partyMembers) do
									if member ~= _cid then
										doPlayerSendTextMessage(member, 12, "You received "..expmember.." party exp.")
										doPlayerAddExp(member, expmember)
									end
								end
								doPlayerSendTextMessage(_cid, 12, "You gain "..expgain.." exp. (" ..partyPorcent.."% send to party)")
								doPlayerAddExp(_cid, expgain - expParty)
								party = true
							else
								party = false
							end
						end
						if not party then
							doPlayerSendTextMessage(_cid, 12, "You gain "..expgain.." exp.")
                                                        doSendAnimatedText(getThingPos(_cid), expg, 215)
							doPlayerAddExp(_cid, expgain)
						end
					end
				end
			end
		end
	end
	return true
end

function onCombat(cid, target)
	if isMonster(target) and not isSummon(target) and not isPlayer(target) then
		registerCreatureEvent(target, "ExpGain")
	end
	return true
end