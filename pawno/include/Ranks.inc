#include <a_samp>

#define RANKINC_RED 0xAA3333AA
#define RANKINC_GREEN 0x33AA33AA

#if defined _Ranks_included
	#endinput
#endif
#define _Ranks_included
#pragma library Ranks

#define NIL_FACTION -1
#define NIL_RANK -1


#define FACTION_ID_COP 0
#define COP_RANK_CADET 0
#define COP_RANK_OFFICER 1
#define FACTION_ID_FBI 1
#define FBI_RANK_FIELDCADET 2


enum Ranks
{
	factionid,
	rankid,
};

new System[MAX_PLAYERS][Ranks];

// 
stock SetPlayerRank(playerid, pfactionid, prankid)
{
	System[playerid][factionid] = pfactionid;
	System[playerid][rankid] = prankid;
}

//
stock ResetPlayerFactionRank(playerid)
{
	System[playerid][factionid] = NIL_FACTION;
	System[playerid][rankid] = NIL_RANK;
}

//
stock GetPlayerFaction(playerid)
{
	return System[playerid][factionid];
}

//
stock GetPlayerRank(playerid)
{
	return System[playerid][rankid];
}

//
stock RANKS_connect(playerid)
{
	SetPlayerRank(playerid,NIL_FACTION,NIL_RANK);
}

/*
native SetPlayerRank(playerid, pfactionid, prankid);
native ResetPlayerFactionRank(playerid);
native GetPlayerFaction(playerid);
native GetPlayerRank(playerid);
native RANKS_conncet(playerid);
*/
