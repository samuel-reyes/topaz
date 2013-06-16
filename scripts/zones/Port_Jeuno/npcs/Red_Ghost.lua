-----------------------------------
-- Area: Port Jeuno
-- NPC: Red Ghost
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");
require("scripts/globals/quests");

path = {
	-96.5, 0, -8,
	-96.5, 0, 8
};

function onInitialize(npc)
	npc:setPos(path[1], path[2], path[3]);
	npc:walkThrough(path);
end;

function onPathFinish(npc)
	if(npc:atPoint(path[1], path[2], path[3])) then
		npc:walkThrough(path);
	else
		npc:walkThrough(path, true);
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local WildcatJeuno = player:getVar("WildcatJeuno");
	if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,15) == false) then
		player:startEvent(314);
	else
		player:startEvent(0x22);
	end

	-- wait until event is over
	npc:wait(-1);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	if (csid == 314) then
		player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",15,true)
	end

	local npc = GetNPCByID(17784896);
	
	if(npc ~= nil) then
		npc:wait(0);
	end
end;
