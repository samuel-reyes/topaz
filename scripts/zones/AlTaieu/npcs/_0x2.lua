-----------------------------------
-- Area: Al'Taieu
--  NPC: Rubious Crystal (West Tower)
-- !pos -683.709 -6.250 -222.142 33
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs.lua");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]WestTower") == 0
        and player:getVar("[SEA][AlTieu]WestTowerCS") == 0
        and not GetMobByID(ID.mob.AERNS_TOWER_WEST+0):isSpawned()
        and not GetMobByID(ID.mob.AERNS_TOWER_WEST+1):isSpawned()
        and not GetMobByID(ID.mob.AERNS_TOWER_WEST+2):isSpawned()
    ) then
        player:messageSpecial(ID.text.OMINOUS_SHADOW);
        SpawnMob(ID.mob.AERNS_TOWER_WEST+0):updateClaim(player);
        SpawnMob(ID.mob.AERNS_TOWER_WEST+1):updateClaim(player);
        SpawnMob(ID.mob.AERNS_TOWER_WEST+2):updateClaim(player);

    elseif (
            player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY
        and player:getVar("PromathiaStatus") == 2
        and player:getVar("[SEA][AlTieu]WestTower") == 1
        and player:getVar("[SEA][AlTieu]WestTowerCS") == 0
    ) then
        player:startEvent(162);

    else
        player:messageSpecial(ID.text.NOTHING_OF_INTEREST);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 162) then
        player:setVar("[SEA][AlTieu]WestTowerCS", 1);
        player:setVar("[SEA][AlTieu]WestTower", 0);
    end
end;
