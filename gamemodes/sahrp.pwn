/*
 *      /$$$$$$   /$$$$$$  /$$   /$$                                                         /$$$$$$$  /$$$$$$$ 
 *     /$$__  $$ /$$__  $$| $$  | $$                                                        | $$__  $$| $$__  $$
 *    | $$  \__/| $$  \ $$| $$  | $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$$$$$  /$$$$$$$       | $$  \ $$| $$  \ $$
 *    |  $$$$$$ | $$$$$$$$| $$$$$$$$ /$$__  $$ |____  $$|  $$  /$$//$$__  $$| $$__  $$      | $$$$$$$/| $$$$$$$/
 *     \____  $$| $$__  $$| $$__  $$| $$$$$$$$  /$$$$$$$ \  $$/$$/| $$$$$$$$| $$  \ $$      | $$__  $$| $$____/ 
 *     /$$  \ $$| $$  | $$| $$  | $$| $$_____/ /$$__  $$  \  $$$/ | $$_____/| $$  | $$      | $$  \ $$| $$      
 *    |  $$$$$$/| $$  | $$| $$  | $$|  $$$$$$$|  $$$$$$$   \  $/  |  $$$$$$$| $$  | $$      | $$  | $$| $$      
 *     \______/ |__/  |__/|__/  |__/ \_______/ \_______/    \_/    \_______/|__/  |__/      |__/  |__/|__/      
 *                                                                                                              
 *                                San Andreas Heaven Role Play Server Gamemode Script.                          
 *                            Created By: Ben Cherrington, David Engles and Jason Alderson.                      
 */

/* ** INCLUDES AND DEFINES ** */

#include <a_samp>
#include <YSI\y_ini>
#include <fixed>
#include <zcmd>
#include <progress>
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define PATH "/Users/%s.ini"
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COLOR_ORANGE 0xFFA500AA
#pragma tabsize 0

/* ** MAIN SCRIPT BEGIN ** */

main()
{
    print("\n----------------------------------");
    print(" SAHeaven RP Script Started...");
    print("----------------------------------\n");
}

/* ** PLAYER INFORMATION ** */

enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
    pScores,
    pRegisterd,
    pLoggedin,
    pSkin,
    Float:pPosx,
    Float:pPosy,
    Float:pPosz,
    pInt,
    pVw,
    pW1,
    pWam1,
    pW2,
    pWam2,
    pW3,
    pWam3,
    pW4,
    pWam4,
    pW5,
    pWam5,
    pW6,
    pWam6,
    pW7,
    pWam7,
    pW8,
    pWam8,
    Float:pHealth,
    Float:pArmour
}

new PlayerInfo[MAX_PLAYERS][pInfo];

/* ** LIST OF AVAILABLE SKINS FOR TESTING ** */

new skins[] = {
  60, //Asian Normal Guy
  33, //Town Folk Guy
  121 //Da Nang Boy
};

/* ** TEXT DRAW DATA ** */

new Text:welcometitle;
new Text:welcomeversion;
new Text:welcomeweb;

/* ** LOAD PLAYER DATA FROM INI FILE ** */

forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Scroes",PlayerInfo[playerid][pScores]);
    INI_Int("Registerd",PlayerInfo[playerid][pRegisterd]);
    INI_Int("LoggedIn",PlayerInfo[playerid][pLoggedin]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    INI_Float("X",PlayerInfo[playerid][pPosx]);
    INI_Float("Y",PlayerInfo[playerid][pPosy]);
    INI_Float("Z",PlayerInfo[playerid][pPosz]);
    INI_Int("Int",PlayerInfo[playerid][pInt]);
    INI_Int("Vw",PlayerInfo[playerid][pVw]);
    INI_Int("WEAPON1",PlayerInfo[playerid][pW1]);
    INI_Int("WEAPONAMMU1",PlayerInfo[playerid][pWam1]);
    INI_Int("WEAPON2",PlayerInfo[playerid][pW2]);
    INI_Int("WEAPONAMMU2",PlayerInfo[playerid][pWam2]);
    INI_Int("WEAPON3",PlayerInfo[playerid][pW3]);
    INI_Int("WEAPONAMMU3",PlayerInfo[playerid][pWam3]);
    INI_Int("WEAPON4",PlayerInfo[playerid][pW4]);
    INI_Int("WEAPONAMMU4",PlayerInfo[playerid][pWam4]);
    INI_Int("WEAPON5",PlayerInfo[playerid][pW5]);
    INI_Int("WEAPONAMMU5",PlayerInfo[playerid][pWam5]);
    INI_Int("WEAPON6",PlayerInfo[playerid][pW6]);
    INI_Int("WEAPONAMMU6",PlayerInfo[playerid][pWam6]);
    INI_Int("WEAPON7",PlayerInfo[playerid][pW7]);
    INI_Int("WEAPONAMMU7",PlayerInfo[playerid][pWam7]);
    INI_Int("WEAPON8",PlayerInfo[playerid][pW8]);
    INI_Int("WEAPONAMMU8",PlayerInfo[playerid][pWam8]);
    INI_Float("Health",PlayerInfo[playerid][pHealth]);
    INI_Float("Armour",PlayerInfo[playerid][pArmour]);
    return 1;
}
stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}

/* ** HASH PLAYER PASSWORD ** */

stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

/* ** BASIC GAMEMODE INITILIZATION ** */
    
public OnGameModeInit()
{
    SetGameModeText("SAH:RP");
    ShowPlayerMarkers(0);
    ShowNameTags(0);
    SetDeathDropAmount(100);
    LimitGlobalChatRadius(10.0);
    LimitPlayerMarkerRadius(100);
    
    // WEBSITE
    welcomeweb = TextDrawCreate(10.0, 420.0, "www.SAHeaven.com");
    TextDrawUseBox(welcomeweb, 0);
    TextDrawFont(welcomeweb, 2);
    TextDrawLetterSize(welcomeweb, 0.5, 2.0);
    TextDrawSetProportional(welcomeweb, 1);
    // VERSION
    welcomeversion = TextDrawCreate(630.0, 10.0, "v0.0.3");
    TextDrawUseBox(welcomeversion, 0);
    TextDrawFont(welcomeversion, 2);
    TextDrawLetterSize(welcomeversion, 0.5, 2.0);
    TextDrawSetProportional(welcomeversion, 1);
    TextDrawAlignment(welcomeversion, 3);
    // TITLE
    welcometitle = TextDrawCreate(320.0, 35.0, "SAHeaven Roleplay");
    TextDrawUseBox(welcometitle, 1);
    TextDrawFont(welcometitle, 0);
    TextDrawLetterSize(welcometitle, 1.0, 4.0);
    TextDrawSetProportional(welcometitle, 1);
    TextDrawAlignment(welcometitle, 2);
    
    return 1;
}

public OnGameModeExit()
{
    return 1;
}

/* ** WHEN PLAYER CONNECTS, CHECK IF THEY HAVE AN ACCOUNT ** */

public OnPlayerConnect(playerid)
{
new randomskin = skins[random(3)];
PlayerInfo[playerid][pLoggedin] = 0;
SetSpawnInfo(playerid, 0, randomskin, 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
TogglePlayerSpectating(playerid, 1);
TextDrawShowForPlayer(playerid, welcometitle);
TextDrawShowForPlayer(playerid, welcomeversion);
TextDrawShowForPlayer(playerid, welcomeweb);

/* ** CLEAR CHAT ** */

    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    SendClientMessage(playerid,0xDEEE20FF, " ");
    
if(fexist(UserPath(playerid)))
{
    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_WHITE"Welcome back to SAHeaven RP.\n\nType your password below to login.","Login","Quit");
}
else
{
    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,""COL_WHITE"Registering...",""COL_WHITE"Welcome to SAHeaven RP.\n\nYou don't appear to have registered yet.\n\nTo make a new account, type your password below.","Register","Quit");
}
return 1;
}

/* ** STORE PLAYER DATA WHEN LOG-OUT ** */

public OnPlayerDisconnect(playerid, reason)
{
if(PlayerInfo[playerid][pLoggedin] == 1){
GetPlayerPos(playerid,PlayerInfo[playerid][pPosx],PlayerInfo[playerid][pPosy],PlayerInfo[playerid][pPosz]);
GetPlayerWeaponData(playerid,1,PlayerInfo[playerid][pW1],PlayerInfo[playerid][pWam1]);
GetPlayerWeaponData(playerid,2,PlayerInfo[playerid][pW2],PlayerInfo[playerid][pWam2]);
GetPlayerWeaponData(playerid,3,PlayerInfo[playerid][pW3],PlayerInfo[playerid][pWam3]);
GetPlayerWeaponData(playerid,4,PlayerInfo[playerid][pW4],PlayerInfo[playerid][pWam4]);
GetPlayerWeaponData(playerid,5,PlayerInfo[playerid][pW5],PlayerInfo[playerid][pWam5]);
GetPlayerWeaponData(playerid,6,PlayerInfo[playerid][pW6],PlayerInfo[playerid][pWam6]);
GetPlayerWeaponData(playerid,7,PlayerInfo[playerid][pW7],PlayerInfo[playerid][pWam7]);
GetPlayerWeaponData(playerid,8,PlayerInfo[playerid][pW8],PlayerInfo[playerid][pWam8]);
GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
GetPlayerArmour(playerid,PlayerInfo[playerid][pArmour]);
PlayerInfo[playerid][pLoggedin] = 0;
new INI:File = INI_Open(UserPath(playerid));
INI_SetTag(File,"data");
INI_WriteInt(File,"Cash",GetPlayerMoney(playerid));
INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
INI_WriteInt(File,"Scores",GetPlayerScore(playerid));
INI_WriteInt(File,"Registerd",PlayerInfo[playerid][pRegisterd]);
INI_WriteInt(File,"LoggedIn",PlayerInfo[playerid][pLoggedin]);
INI_WriteInt(File,"Skin",GetPlayerSkin(playerid));
INI_WriteFloat(File,"X",PlayerInfo[playerid][pPosx]);
INI_WriteFloat(File,"Y",PlayerInfo[playerid][pPosy]);
INI_WriteFloat(File,"Z",PlayerInfo[playerid][pPosz]);
INI_WriteInt(File,"Int",GetPlayerInterior(playerid));
INI_WriteInt(File,"Vw",GetPlayerVirtualWorld(playerid));
INI_WriteInt(File,"WEAPON1",PlayerInfo[playerid][pW1]);
INI_WriteInt(File,"WEAPONAMMU1",PlayerInfo[playerid][pWam1]);
INI_WriteInt(File,"WEAPON2",PlayerInfo[playerid][pW2]);
INI_WriteInt(File,"WEAPONAMMU2",PlayerInfo[playerid][pWam2]);
INI_WriteInt(File,"WEAPON3",PlayerInfo[playerid][pW3]);
INI_WriteInt(File,"WEAPONAMMU3",PlayerInfo[playerid][pWam3]);
INI_WriteInt(File,"WEAPON4",PlayerInfo[playerid][pW4]);
INI_WriteInt(File,"WEAPONAMMU4",PlayerInfo[playerid][pWam4]);
INI_WriteInt(File,"WEAPON5",PlayerInfo[playerid][pW5]);
INI_WriteInt(File,"WEAPONAMMU5",PlayerInfo[playerid][pWam5]);
INI_WriteInt(File,"WEAPON6",PlayerInfo[playerid][pW6]);
INI_WriteInt(File,"WEAPONAMMU6",PlayerInfo[playerid][pWam6]);
INI_WriteInt(File,"WEAPON7",PlayerInfo[playerid][pW7]);
INI_WriteInt(File,"WEAPONAMMU7",PlayerInfo[playerid][pWam7]);
INI_WriteInt(File,"WEAPON8",PlayerInfo[playerid][pW8]);
INI_WriteInt(File,"WEAPONAMMU8",PlayerInfo[playerid][pWam8]);
INI_WriteFloat(File,"Health",PlayerInfo[playerid][pHealth]);
INI_WriteFloat(File,"Armour",PlayerInfo[playerid][pArmour]);
INI_Close(File);
}
else{
}
return 1;
}

/* ** INITILIZE PLAYER ON SPAWN ** */
public OnPlayerSpawn(playerid)
{
    if(PlayerInfo[playerid][pRegisterd] == 1){
    SetPlayerSkin(playerid,PlayerInfo[playerid][pSkin]);
    SetPlayerPos(playerid,PlayerInfo[playerid][pPosx],PlayerInfo[playerid][pPosy],PlayerInfo[playerid][pPosz]);
    SetPlayerVirtualWorld(playerid,PlayerInfo[playerid][pVw]);
    SetPlayerInterior(playerid,PlayerInfo[playerid][pInt]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW1],PlayerInfo[playerid][pWam1]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW2],PlayerInfo[playerid][pWam2]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW3],PlayerInfo[playerid][pWam3]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW4],PlayerInfo[playerid][pWam4]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW5],PlayerInfo[playerid][pWam5]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW6],PlayerInfo[playerid][pWam6]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW7],PlayerInfo[playerid][pWam7]);
    GivePlayerWeapon(playerid,PlayerInfo[playerid][pW8],PlayerInfo[playerid][pWam8]);
    SetPlayerArmour(playerid,PlayerInfo[playerid][pArmour]);
    SetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
    }
    else{
    }
    PlayerInfo[playerid][pLoggedin] = 1;
    TextDrawHideForPlayer(playerid, welcometitle);
    TextDrawHideForPlayer(playerid, welcomeversion);
    TextDrawHideForPlayer(playerid, welcomeweb);
    return 1;
}

/* ** SIMPLE KILL/DEATH STUFF ON PLAYER DEATH ** */

public OnPlayerDeath(playerid, killerid, reason)
{
PlayerInfo[killerid][pKills]++;
PlayerInfo[playerid][pDeaths]++;
    return 1;
}

/* ** THIS SECTION IS FOR UNUSED FUNCTIONS I PLAN TO USE IN FUTURE ** */

public OnVehicleSpawn(vehicleid)
{
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    return 1;
}

public OnPlayerText(playerid, text[])
{
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
    return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
    return 1;
}

public OnRconCommand(cmd[])
{
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 1;
}

public OnObjectMoved(objectid)
{
    return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
    return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
    return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
    return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    return 1;
}

public OnPlayerExitedMenu(playerid)
{
    return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
    return 1;
}

public OnPlayerUpdate(playerid)
{
    return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
    return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
    return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
    return 1;
}

/* ** BASIC LOG-IN DIALOGS ** */

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_REGISTER)
    {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, ""COL_WHITE"Registering...",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
                new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Cash",0);
                INI_WriteInt(File,"Admin",0);
                INI_WriteInt(File,"Kills",0);
                INI_WriteInt(File,"Deaths",0);
                INI_WriteInt(File,"Scores",0);
                INI_WriteInt(File,"Registerd",0);
                INI_WriteInt(File,"LoggedIn",1);
                INI_Close(File);
                TogglePlayerSpectating(playerid, 0);
                SpawnPlayer(playerid);
                }
   }
    if(dialogid == DIALOG_LOGIN)
    {
        if ( !response ) return Kick ( playerid );
        if( response )
        {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);
                    if(PlayerInfo[playerid][pRegisterd] == 0){
                    PlayerInfo[playerid][pRegisterd] = 1;
                    }
                    else{
                    }
                    TogglePlayerSpectating(playerid, 0);
                    SpawnPlayer(playerid);
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                }
                return 1;
        }
    }
    return 1;
}

/* ** ANOTHER YET TO BE USED FUNCTION ** */

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    return 1;
}