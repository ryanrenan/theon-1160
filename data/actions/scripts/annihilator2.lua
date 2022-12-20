--[[> Annihilator script by Marcryzius D'evil <]]--


local pos_demons,pos_players,tele_players,exit_players = {

  -- posições onde serão sumonados os monstros na annihilator
  {x = 1128, y = 1153, z = 8,stackpos=8}

},{

  --posições onde estão os players antes de irem a sala da annihi
  {x = 1125, y = 1152, z = 7,stackpos=253},

},{

  --posições onde serão teleportados os players para a sala da annihi
  {x = 1125, y = 1153, z = 8,stackpos=253},

}, {x = 1095, y = 1062, z = 7} -- posição de saida


local level,time_annihi = 1,2

QUANT = time_annihi -- não mecha
RELOAD_ANNIHI = 0 -- não mecha

--== FUNÇÕES NECESSARIAS ==--
local function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers) --Marcryzius
    local creaturesList = {}

    for x = -radiusx, radiusx do
        for y = -radiusy, radiusy do
        local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE})
            if (creature.type == 1 and showPlayers == true) or (creature.type == 2 and showMonsters == true) then
                table.insert(creaturesList, creature.uid)
            end
        end
    end
    return creaturesList
end


local function repeatTxtInPos(alavanca_pos,cor)
  local pos = tele_players[3]

   if(QUANT > 0)then
      QUANT = QUANT-1

      doSendAnimatedText(alavanca_pos,QUANT,cor)
      doSendAnimatedText({x=pos.x-10,y=pos.y-10,z=pos.z},QUANT,cor)
      doSendAnimatedText({x=pos.x-10,y=pos.y+10,z=pos.z},QUANT,cor)
      doSendAnimatedText({x=pos.x+10,y=pos.y+10,z=pos.z},QUANT,cor)
      doSendAnimatedText({x=pos.x+10,y=pos.y-10,z=pos.z},QUANT,cor)
      addEvent(repeatTxtInPos,1000,alavanca_pos,cor)

   else
      QUANT = time_annihi
      stopEvent(RELOAD_ANNIHI)
      RELOAD_ANNIHI = 0
   end
end


local function reloadAnnihi()
  local players = getCreaturesInRange(tele_players[3], 6, 6, true, true)
  for _,cid in pairs(players) do
      if(isPlayer(cid) == true)then
         doTeleportThing(cid,exit_players, false)
         doPlayerSendCancel(cid,"Voce não conseguiu completar a annihi e por isso foi retirado dela... NOOB!")

      elseif(isMonster(cid))then
         doRemoveCreature(cid)
      end
   end
end


--== FUNÇÕES NECESSARIAS ==--
function onUse(cid, item, fPos, itemEx, toPosition)
   if(item.itemid == 1945)then
      for _,pos in pairs(pos_players) do
         local player = getThingFromPos(pos)
         if not(isPlayer(player.uid))then
            return true,doPlayerSendCancel(cid,"voce precisa de "..#pos_players.." pessoas para poder entrar na sala.")
         elseif(getPlayerLevel(player.uid) < level)then
            return true,doPlayerSendCancel(cid,"Todos necessitam ter level "..level.." ou mais.")
         end
      end

      local getMonsterInAnnihi = getCreaturesInRange(tele_players[3], 5, 5, true)

      for k,pos  in pairs(pos_demons) do
         if(k <= #pos_players)then
         local player = getThingFromPos(pos_players[k])
            if(player.uid ~= nil)then
               doTeleportThing(player.uid,tele_players[k], false)
            end
         end

         if(#getMonsterInAnnihi > 0)then
            reloadAnnihi()
         end
        doSummonCreature("Demon", pos) -- Nome do monstro
      end

      if(QUANT == time_annihi)then
         repeatTxtInPos(fPos,time_annihi,0)
         RELOAD_ANNIHI = addEvent(reloadAnnihi,time_annihi*1000)
      end

   elseif(item.itemid == 1945)then
      if(#getCreaturesInRange(tele_players[3], 6, 6, false, true) > 0)then
         return true,doPlayerSendCancel(cid,"Espere o time acabar de fazer a annihilator quest.")
      end
   end
end