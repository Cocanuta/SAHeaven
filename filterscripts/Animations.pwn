#define FILTERSCRIPT

#include <a_samp>//Standard
#include <sscanf2>//Advanced Sscanf
#include <zcmd>//CMD: Ability
#include <foreach>//Improved loops
#include <a_angles>//Special Angle Functions

#define COLOR_LIGHTRED 0xFF6347AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_LIGHTBLUE 0x00BFFFAA

new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new gPlayerAnimLibsPreloaded[MAX_PLAYERS];

new Text:txtAnimHelper;
new ExitAnim[MAX_PLAYERS];
new Offer[MAX_PLAYERS];
new ChosenStyle[MAX_PLAYERS];
//-------------------------------------------------

public OnFilterScript()
{
	print("<|-----------------------------------------|>");
	print(" |Animation System By Quinlynn_Larson|");
	print("<|-----------------------------------------|>");
	return 1;
}


OnePlayAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, freeze, time)
{
	ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, freeze, time, 1);
	return;
}

//-------------------------------------------------

LoopingAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, freeze, time)
{
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, freeze, time, 1);
    TextDrawShowForPlayer(playerid,txtAnimHelper);
    return;
}

//-------------------------------------------------

StopLoopingAnim(playerid)
{
    if(gPlayerUsingLoopingAnim[playerid] == 2)
    {
        SetPlayerSpecialAction(playerid, 0);
	}
	if(ExitAnim[playerid] == 1)
	{
	    OnePlayAnim(playerid, "ped", "SEAT_up", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 2)
	{
	    OnePlayAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 3)
	{
	    OnePlayAnim(playerid, "PARK", "Tai_Chi_Out", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 4)
	{
	    OnePlayAnim(playerid, "PAULNMAC", "wank_out", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 5)
	{
	    OnePlayAnim(playerid, "PAULNMAC", "Piss_out", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 6)
	{
	    OnePlayAnim(playerid, "BLOWJOBZ", "BJ_COUCH_END_W", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 7)
	{
	    OnePlayAnim(playerid, "CAR", "Fixn_Car_Out", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 8)
	{
	    OnePlayAnim(playerid, "Attractors", "Stepsit_out", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 9)
	{
	    OnePlayAnim(playerid, "FOOD", "FF_Sit_Out_L_180", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 10)
	{
	    OnePlayAnim(playerid, "FOOD", "FF_Sit_Out_R_180", 4.0, 0, 0, 0, 0, 0);
	}
	else if(ExitAnim[playerid] == 11)
	{
	    OnePlayAnim(playerid, "ON_LOOKERS", "Pointup_out", 4.0, 0, 0, 0, 0, 0);
	}
	else
	{
    	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
	}
	ExitAnim[playerid] = 0;
	gPlayerUsingLoopingAnim[playerid] = 0;
	return;
}

//-------------------------------------------------

PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0,0);
	return;
}

//-------------------------------------------------

// ********** CALLBACKS **********

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(!gPlayerUsingLoopingAnim[playerid]) return;

	if(IsPlayerInAnyVehicle(playerid))
	{
	    if((newkeys & 128) && !(oldkeys & 128))
	    {
		    StopLoopingAnim(playerid);
		    TextDrawHideForPlayer(playerid,txtAnimHelper);
	    }
	}
    else if((newkeys & KEY_SPRINT) && !(oldkeys & KEY_SPRINT))
	{
	    StopLoopingAnim(playerid);
	    TextDrawHideForPlayer(playerid,txtAnimHelper);
    }
}

//------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
	// if they die whilst performing a looping anim, we should reset the state
	if(gPlayerUsingLoopingAnim[playerid])
	{
	    ExitAnim[playerid] = 0;
        gPlayerUsingLoopingAnim[playerid] = 0;
        TextDrawHideForPlayer(playerid,txtAnimHelper);
	}
 	return 1;
}

//-------------------------------------------------

public OnPlayerSpawn(playerid)
{
	if(!gPlayerAnimLibsPreloaded[playerid])
	{
		PreloadAnimLib(playerid,"MISC");
		PreloadAnimLib(playerid,"ped");
		PreloadAnimLib(playerid,"BEACH");
		PreloadAnimLib(playerid,"SMOKING");
		PreloadAnimLib(playerid,"BOMBER");
		PreloadAnimLib(playerid,"RAPPING");
		PreloadAnimLib(playerid,"SHOP");
		PreloadAnimLib(playerid,"COP_AMBIENT");
		PreloadAnimLib(playerid,"FOOD");
		PreloadAnimLib(playerid,"ON_LOOKERS");
		PreloadAnimLib(playerid,"SWEET");
		PreloadAnimLib(playerid,"DEALER");
		PreloadAnimLib(playerid,"CRACK");
		PreloadAnimLib(playerid,"BLOWJOBZ");
		PreloadAnimLib(playerid,"PARK");
		PreloadAnimLib(playerid,"GYMNASIUM");
		PreloadAnimLib(playerid,"PAULNMAC");
		PreloadAnimLib(playerid,"CAR");
		PreloadAnimLib(playerid,"GANGS");
		PreloadAnimLib(playerid,"GHANDS");
		PreloadAnimLib(playerid,"MEDIC");
		PreloadAnimLib(playerid,"Attractors");
		PreloadAnimLib(playerid,"HEIST9");
		PreloadAnimLib(playerid,"RIOT");
		PreloadAnimLib(playerid,"CARRY");
		gPlayerAnimLibsPreloaded[playerid] = 1;
	}
	Offer[playerid] = -1;
	return 1;
}

//-------------------------------------------------

public OnPlayerConnect(playerid)
{
    ExitAnim[playerid] = 0;
    ChosenStyle[playerid] = 0;
    Offer[playerid] = -1;
    gPlayerUsingLoopingAnim[playerid] = 0;
	gPlayerAnimLibsPreloaded[playerid] = 0;
	TextDrawHideForPlayer(playerid,txtAnimHelper);
	return 1;
}

//-------------------------------------------------

public OnFilterScriptInit()
{
	// Init our text display
	txtAnimHelper = TextDrawCreate(610.0, 400.0,
	"~r~~k~~PED_SPRINT~ ~w~to stop the animation");
	TextDrawUseBox(txtAnimHelper, 0);
	TextDrawFont(txtAnimHelper, 2);
	TextDrawSetShadow(txtAnimHelper,0); // no shadow
    TextDrawSetOutline(txtAnimHelper,1); // thickness 1
    TextDrawBackgroundColor(txtAnimHelper,0x000000FF);
    TextDrawColor(txtAnimHelper,0xFFFFFFFF);
    TextDrawAlignment(txtAnimHelper,3); // align right
    return 1;
}

//---------------Commands-------------------
CMD:animhelp(playerid) return cmd_animlist(playerid);
CMD:animlist(playerid)
{
	new main[800];
	new string[200];
	format(main, sizeof(main), "{FFFFFF}You type all animations like this: {7CFC00}'/AN [Name]'.\n{FFFFFF}The only exception is for {7CFC00}'/Kiss [playerid/PartOfName]' {FFFFFF}and {7CFC00}'/Greet [playerid/PartOfName]'{FFFFFF}.\n\nHere is a list of all animations:\n");
	format(string, sizeof(string),"{9ACD32}Cellin - Cellout - Hitch - Scratch - Sit - Lay - Smoke - Bomb - Laugh - Robman - Lookout - Crossarms - Hide - Vomit - Wave\n");
	strcat(main, string);
	format(string, sizeof(string),"Slapass - Blowjob - Deal - Idle - Pay - Crack - Chat - Fucku - Taichi - Dance - Injured - Shadowbox - Piss - Wank - Sleep\n");
	strcat(main, string);
	format(string, sizeof(string),"Point - Shout - Look - Aim - CPR - Fixcar - Flag - Bat - Lean - Gang - Wallshoot - What - Insult");
    strcat(main, string);
	ShowPlayerDialog(playerid, 110, DIALOG_STYLE_MSGBOX, "{00BFFF}Available animations",main, "Cool", "");
    return 1;
}

CMD:an(playerid, params[]) return cmd_animation(playerid, params);
CMD:anim(playerid, params[]) return cmd_animation(playerid, params);
CMD:animation(playerid, params[])
{
    if(CallRemoteFunction("IsPlayerBlocked", "d", playerid) != 0 || GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
    {
        SendClientMessage(playerid, COLOR_LIGHTRED, "   You can't do that right now!");
        return 1;
	}
	new name[30],id;
	if(!sscanf(params, "s[29]I(0)", name, id))
	{
		if(!strcmp(name, "cellin", true))
		{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		}
		else if(!strcmp(name, "cellout", true))
		{
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		}
		else if(!strcmp(name, "hitch", true))
		{
		    LoopingAnim(playerid,"MISC","Hiker_Pose", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "scratch", true))
		{
			LoopingAnim(playerid,"MISC","Scratchballs_01", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "sit", true))
		{
		    if(id == 1)
		    {
				ExitAnim[playerid] = 1;
		   		LoopingAnim(playerid,"ped","SEAT_idle", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 2)
			{
			    LoopingAnim(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 3)
			{
			    LoopingAnim(playerid,"BEACH", "ParkSit_W_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 4)
			{
			    LoopingAnim(playerid,"BEACH", "SitnWait_loop_W", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 5)
			{
			    ExitAnim[playerid] = 8;
			    LoopingAnim(playerid,"Attractors", "Stepsit_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 6)
			{
			    ExitAnim[playerid] = 9;
			    LoopingAnim(playerid,"FOOD", "FF_Sit_In_L", 4.0, 0, 0, 0, 1, 0);
			}
			else if(id == 7)
			{
			    ExitAnim[playerid] = 10;
			    LoopingAnim(playerid,"FOOD", "FF_Sit_In_R", 4.0, 0, 0, 0, 1, 0);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation sit [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 - Chair sit");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "2 - Male groundsit");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "3 - Female groundsit");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "4 - Bored seat");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "5 - Step seat");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "6 - Right booth seat");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "7 - left booth seat");
			}
		}
		else if(!strcmp(name, "lay", true))
		{
		   	LoopingAnim(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "smoke", true))
		{
		    if(id == 1)
		    {
		   		LoopingAnim(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 2)
			{
			    LoopingAnim(playerid,"SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else if(id == 3)
			{
			    LoopingAnim(playerid,"SMOKING", "M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation smoke [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 - Male lean");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "2 - Female lean");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "3 - Male standing");
			}
		}
		else if(!strcmp(name, "bomb", true))
		{
		   	OnePlayAnim(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "laugh", true))
		{
		   	OnePlayAnim(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "robman", true))
		{
		   	LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "lookout", true))
		{
		   	OnePlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "crossarms", true))
		{
		   	LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "hide", true))
		{
		   	LoopingAnim(playerid,"ped", "cower", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "vomit", true))
		{
		   	LoopingAnim(playerid,"FOOD", "EAT_Vomit_P", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "wave", true))
		{
		    ExitAnim[playerid] = 2;
		   	LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "slapass", true))
		{
		   	OnePlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "blowjob", true))
		{
		    ExitAnim[playerid] = 6;
		   	LoopingAnim(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.1,0,0,0,0,0);
		}
		//dealing
		else if(!strcmp(name, "deal", true))
		{
		   	OnePlayAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "idle", true))
		{
		   	LoopingAnim(playerid, "DEALER", "DEALER_IDLE", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "pay", true))
		{
		   	OnePlayAnim(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "crack", true))
		{
		   	LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "chat", true))
		{
		   	OnePlayAnim(playerid,"ped","IDLE_CHAT",4.0,0,0,0,0,0);
		}
		else if(!strcmp(name, "fucku", true))
		{
		   	OnePlayAnim(playerid,"ped","fucku",4.0,0,0,0,0,0);
		}
		else if(!strcmp(name, "taichi", true))
		{
		    ExitAnim[playerid] = 3;
		   	LoopingAnim(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0);
		}
		else if(!strcmp(name, "dance", true))
		{
		    if(id == 1)
		    {
		        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		    }
		    else if(id == 2)
		    {
		        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		    }
		    else if(id == 3)
		    {
		        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		    }
		    else if(id == 4)
		    {
		        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
		    }
		    else
		    {
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation dance [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1,2,3,4");
			}
		}
		else if(!strcmp(name, "injured", true))
		{
		   	LoopingAnim(playerid,"SWEET", "Sweet_injuredloop", 4.0,1,0,0,0,0);
		}
		else if(!strcmp(name, "shadowbox", true))
		{
		   	LoopingAnim(playerid,"GYMNASIUM", "GYMshadowbox", 1.800001, 1, 0, 0, 1, 600);
		}
		else if(!strcmp(name, "wank", true))
		{
		    ExitAnim[playerid] = 4;
		   	LoopingAnim(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);
		}
		else if(!strcmp(name, "piss", true))
		{
		    ExitAnim[playerid] = 5;
		   	LoopingAnim(playerid,"PAULNMAC","Piss_loop",4.1,1,0,0,0,0);
		   	SetPlayerSpecialAction(playerid, 68);//Piss particles
		   	gPlayerUsingLoopingAnim[playerid] = 2;
		}
		else if(!strcmp(name, "sleep", true))
		{
		   	LoopingAnim(playerid,"CRACK","crckdeth1",4.1,1,0,0,0,0);
		}
		else if(!strcmp(name, "point", true))
		{
		    ExitAnim[playerid] = 11;
		   	LoopingAnim(playerid,"ON_LOOKERS","Pointup_loop",4.1,1,0,0,0,0);
		}
		else if(!strcmp(name, "shout", true))
		{
		    if(id == 1)
		    {
		   		OnePlayAnim(playerid,"ON_LOOKERS", "shout_01", 4.0, 0, 0, 0, 0, 0);
			}
			else if(id == 2)
			{
			    OnePlayAnim(playerid,"ON_LOOKERS", "shout_02", 4.0, 0, 0, 0, 0, 0);
			}
			else
		    {
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation shout [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1,2");
			}
		}
		else if(!strcmp(name, "look", true))
		{
		    OnePlayAnim(playerid,"ON_LOOKERS", "lkaround_loop", 4.0, 0, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "aim", true))
		{
		   	LoopingAnim(playerid,"ped", "ARRESTgun", 4.0, 1, 0, 0, 0, 0);
		}
		else if(!strcmp(name, "CPR", true))
		{
		   	OnePlayAnim(playerid,"MEDIC", "CPR", 4.0, 0, 0, 0, 0, 0);
		}
		//Car anims
		else if(!strcmp(name, "fixcar", true))
		{
		    ExitAnim[playerid] = 7;
		   	LoopingAnim(playerid,"CAR","Fixn_Car_Loop",4.1,1,0,0,0,0);
		}
		else if(!strcmp(name, "flag", true))
		{
		   	OnePlayAnim(playerid,"CAR","flag_drop",4.1,0,0,0,0,0);
		}
		//Gang anims
		else if(!strcmp(name, "bat", true))
		{
		    if(id == 1)
		    {
		   		OnePlayAnim(playerid,"CRACK","Bbalbat_Idle_01",4.1,0,0,0,0,0);
			}
			else if(id == 2)
			{
			    OnePlayAnim(playerid,"CRACK","Bbalbat_Idle_02",4.1,0,0,0,0,0);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation bat [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 - Bat on shoulder");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "2 - Neck crack");
			}
		}
		else if(!strcmp(name, "lean", true))
		{
		    if(id == 1)
		    {
		    	LoopingAnim(playerid,"GANGS","leanIDLE",4.1,1,0,0,0,0);
			}
			else if(id == 2)
			{
			    LoopingAnim(playerid,"MISC","Plyrlean_loop",4.1,1,0,0,0,0);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation lean [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 - Back lean");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "2 - Left lean");
			}
		}
		else if(!strcmp(name, "gang", true))
		{
		    if(id == 1)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign1",4.1,0,0,0,0,0);
			}
			else if(id == 2)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign2",4.1,0,0,0,0,0);
			}
			else if(id == 3)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign3",4.1,0,0,0,0,0);
			}
			else if(id == 4)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign4",4.1,0,0,0,0,0);
			}
			else if(id == 5)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign5",4.1,0,0,0,0,0);
			}
			else if(id == 6)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign1LH",4.1,0,0,0,0,0);
			}
			else if(id == 7)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign2LH",4.1,0,0,0,0,0);
			}
			else if(id == 8)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign3LH",4.1,0,0,0,0,0);
			}
			else if(id == 9)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign4LH",4.1,0,0,0,0,0);
			}
			else if(id == 10)
			{
			    OnePlayAnim(playerid,"GHANDS","gsign5LH",4.1,0,0,0,0,0);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation gang [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 to 10");
			}
		}
		else if(!strcmp(name, "wallshoot", true))
		{
		    if(id == 1)
		    {
		        OnePlayAnim(playerid,"HEIST9","swt_wllshoot_out_L",4.1,0,0,0,0,0);
		    }
		    else if(id == 2)
		    {
		        OnePlayAnim(playerid,"HEIST9","swt_wllshoot_out_R",4.1,0,0,0,0,0);
		    }
		    else
		    {
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation wallshoot [ID]");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "1 - Shoot left");
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "2 - Shoot right");
			}
		}
		else if(!strcmp(name, "what", true))
		{
		    OnePlayAnim(playerid,"RIOT","RIOT_ANGRY",4.1,0,0,0,0,0);
		}
		else if(!strcmp(name, "insult", true))
		{
		    OnePlayAnim(playerid,"RIOT","RIOT_FUKU",4.1,0,0,0,0,0);
		}
		else if(!strcmp(name, "list", true))
		{
			cmd_animlist(playerid);
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid name!");
		}
		return 1;
	}
	else
	{
	    SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/An)imation [Name]");
	    SendClientMessage(playerid, COLOR_LIGHTBLUE, "For a list of all animations type '/animlist'.");
	}
	return 1;
}

CMD:kiss(playerid, params[])
{
    if(CallRemoteFunction("IsPlayerBlocked", "d", playerid) != 0)
    {
        SendClientMessage(playerid, COLOR_LIGHTRED, "   You can't do that right now!");
        return 1;
	}
	new playa,style;
	if(!sscanf(params, "ui", playa, style))
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(ProxDetectorS(1.5, playerid, playa))//Make sure they are close enough for the anim to work
	        {
	            if(style < 0 || style > 3)
	            {
	                SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid style! (1-3)");
	                return 1;
				}
	            ChosenStyle[playa] = style;
	            Offer[playa] = playerid;
	            new string[100];
	            format(string, sizeof(string), "* %s wants to greet you. Type '/Kiss' to accept.", PlayerNameEx(playerid));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            format(string, sizeof(string), "* You offered %s a greeting.", PlayerNameEx(playa));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            return 1;
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_LIGHTRED, "   You are too far away!");
	            return 1;
			}
	    }
	    else
	    {
	        SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid player!");
	        return 1;
		}
	}
	else
	{
	    if(Offer[playerid] > -1)
	    {
			playa = Offer[playerid];
			style = ChosenStyle[playerid];
			if(IsPlayerConnected(playa))
		    {
		        if(ProxDetectorS(1.5, playerid, playa))//Make sure they are close enough for the anim to work
		        {
		            SetPlayerToFacePlayer(playerid, playa);//Make em face each other
		            if(style == 1)
		            {
		                OnePlayAnim(playerid,"KISSING","Grlfrd_Kiss_01",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"KISSING","Playa_Kiss_01",4.1,0,0,0,0,0);
		            }
		            else if(style == 2)
		            {
		                OnePlayAnim(playerid,"KISSING","Grlfrd_Kiss_02",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"KISSING","Playa_Kiss_02",4.1,0,0,0,0,0);
		            }
		            else if(style == 3)
		            {
		                OnePlayAnim(playerid,"KISSING","Grlfrd_Kiss_03",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"KISSING","Playa_Kiss_03",4.1,0,0,0,0,0);
		            }
		            else//Should anything happen just use the default
		            {
		                OnePlayAnim(playerid,"KISSING","Grlfrd_Kiss_03",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"KISSING","Playa_Kiss_03",4.1,0,0,0,0,0);
		            }
		            return 1;
				}
		        else
		        {
		            SendClientMessage(playerid, COLOR_LIGHTRED, "   You are too far away!");
				}
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid player!");
			}
	        Offer[playerid] = -1;
	        ChosenStyle[playerid] = 0;
	    }
	    else
	    {
	    	SendClientMessage(playerid, COLOR_WHITE, "USAGE: /Kiss [playerid/PartOfName] [Style ID]");
	    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Styles: 1 - 3");
		}
	}
	return 1;
}

CMD:greet(playerid, params[])
{
    if(CallRemoteFunction("IsPlayerBlocked", "d", playerid) != 0)
    {
        SendClientMessage(playerid, COLOR_LIGHTRED, "   You can't do that right now!");
        return 1;
	}
	new playa,style;
	if(!sscanf(params, "ui", playa, style))
	{
	    if(IsPlayerConnected(playa))
	    {
	        if(ProxDetectorS(1.5, playerid, playa))//Make sure they are close enough for the anim to work
	        {
	            if(style < 0 || style > 9)
	            {
	                SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid style! (1-9)");
	                return 1;
				}
	            ChosenStyle[playa] = style;
	            Offer[playa] = playerid;
	            new string[100];
	            format(string, sizeof(string), "* %s wants to greet you. Type '/Greet' to accept.", PlayerNameEx(playerid));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            format(string, sizeof(string), "* You offered %s a greeting.", PlayerNameEx(playa));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            return 1;
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_LIGHTRED, "   You are too far away!");
	            return 1;
			}
	    }
	    else
	    {
	        SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid player!");
	        return 1;
		}
	}
	else
	{
	    if(Offer[playerid] > -1)
	    {
			playa = Offer[playerid];
			style = ChosenStyle[playerid];
			if(IsPlayerConnected(playa))
		    {
		        if(ProxDetectorS(1.5, playerid, playa))//Make sure they are close enough for the anim to work
		        {
		            SetPlayerToFacePlayer(playerid, playa);//Make em face each other
		            if(style == 1)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkaa",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkaa",4.1,0,0,0,0,0);
		            }
		            else if(style == 2)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkaa",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkaa",4.1,0,0,0,0,0);
		            }
		            else if(style == 3)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkba",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkba",4.1,0,0,0,0,0);
		            }
		            else if(style == 4)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkca",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkca",4.1,0,0,0,0,0);
		            }
		            else if(style == 5)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkda",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkda",4.1,0,0,0,0,0);
		            }
		            else if(style == 6)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkea",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkea",4.1,0,0,0,0,0);
		            }
		            else if(style == 7)
		            {
		                OnePlayAnim(playerid,"GANGS","hndshkfa",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","hndshkfa",4.1,0,0,0,0,0);
		            }
		            else if(style == 8)
		            {
		                OnePlayAnim(playerid,"GANGS","prtial_hndshk_01",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","prtial_hndshk_01",4.1,0,0,0,0,0);
		            }
		            else if(style == 9)
		            {
		                OnePlayAnim(playerid,"GANGS","prtial_hndshk_biz_01",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","prtial_hndshk_biz_01",4.1,0,0,0,0,0);
		            }
		            else//Should anything happen just use the default
		            {
		                OnePlayAnim(playerid,"GANGS","prtial_hndshk_biz_01",4.1,0,0,0,0,0);
		                OnePlayAnim(playa,"GANGS","prtial_hndshk_biz_01",4.1,0,0,0,0,0);
		            }
		            return 1;
				}
		        else
		        {
		            SendClientMessage(playerid, COLOR_LIGHTRED, "   You are too far away!");
				}
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_LIGHTRED, "   Invalid player!");
			}
	        Offer[playerid] = -1;
	        ChosenStyle[playerid] = 0;
	    }
	    else
	    {
	    	SendClientMessage(playerid, COLOR_WHITE, "USAGE: /Greet [playerid/PartOfName] [Style ID]");
	    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "Styles: 1 - 9");
		}
	}
	return 1;
}

ProxDetectorS(Float:radi, playerid, targetid)
{
	if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
	    if(GetPlayerState(targetid) != PLAYER_STATE_SPECTATING)
	    {
	        if(GetPlayerVirtualWorld(targetid) == GetPlayerVirtualWorld(playerid))
	        {
				new Float:posx, Float:posy, Float:posz;
				new Float:oldposx, Float:oldposy, Float:oldposz;
				new Float:tempposx, Float:tempposy, Float:tempposz;
				GetPlayerPos(playerid, oldposx, oldposy, oldposz);
				//radi = 2.0; //Trigger Radius
				GetPlayerPos(targetid, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
				if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					return 1;
				}
			}
		}
	}
	return 0;
}

stock PlayerNameEx(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
    new i;
    while(name[i])
    {
        if(name[i] == '_')  name[i] = ' ';
        i++;
    }
    return name;
}
