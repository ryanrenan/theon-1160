function onDeath(cid)
   setZombiesToSpawnCount(getZombiesToSpawnCount() + 2)
   doCreatureSay(cid, "Volvere!", 19)
   return true
end