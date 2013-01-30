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
#include <foreach>
#include <sscanf>
#include <inventory>
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define PATH "/Users/%s.ini"
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#pragma tabsize 0

/* ** COLOURS ** */
#define COLOR_GREY 0xAFAFAFAA
// System Defined Colors
#define COLOR_ACTIVEBORDER 0xB4B4B4FF
#define COLOR_ACTIVECAPTION 0x99B4D1FF
#define COLOR_ACTIVECAPTIONTEXT 0x000000FF
#define COLOR_ALICEBLUE 0xF0F8FFFF
#define COLOR_ANTIQUEWHITE 0xFAEBD7FF
#define COLOR_APPWORKSPACE 0xABABABFF
#define COLOR_AQUA 0x00FFFFFF
#define COLOR_AQUAMARINE 0x7FFFD4FF
#define COLOR_AZURE 0xF0FFFFFF
#define COLOR_BEIGE 0xF5F5DCFF
#define COLOR_BISQUE 0xFFE4C4FF
#define COLOR_BLACK 0x000000FF
#define COLOR_BLANCHEDALMOND 0xFFEBCDFF
#define COLOR_BLUE 0x0000FFFF
#define COLOR_BLUEVIOLET 0x8A2BE2FF
#define COLOR_BROWN 0xA52A2AFF
#define COLOR_BURLYWOOD 0xDEB887FF
#define COLOR_BUTTONFACE 0xF0F0F0FF
#define COLOR_BUTTONHIGHLIGHT 0xFFFFFFFF
#define COLOR_BUTTONSHADOW 0xA0A0A0FF
#define COLOR_CADETBLUE 0x5F9EA0FF
#define COLOR_CHARTREUSE 0x7FFF00FF
#define COLOR_CHOCOLATE 0xD2691EFF
#define COLOR_CONTROL 0xF0F0F0FF
#define COLOR_CONTROLDARK 0xA0A0A0FF
#define COLOR_CONTROLDARKDARK 0x696969FF
#define COLOR_CONTROLLIGHT 0xE3E3E3FF
#define COLOR_CONTROLLIGHTLIGHT 0xFFFFFFFF
#define COLOR_CONTROLTEXT 0x000000FF
#define COLOR_CORAL 0xFF7F50FF
#define COLOR_CORNFLOWERBLUE 0x6495EDFF
#define COLOR_CORNSILK 0xFFF8DCFF
#define COLOR_CRIMSON 0xDC143CFF
#define COLOR_CYAN 0x00FFFFFF
#define COLOR_DARKBLUE 0x00008BFF
#define COLOR_DARKCYAN 0x008B8BFF
#define COLOR_DARKGOLDENROD 0xB8860BFF
#define COLOR_DARKGRAY 0xA9A9A9FF
#define COLOR_DARKGREEN 0x006400FF
#define COLOR_DARKKHAKI 0xBDB76BFF
#define COLOR_DARKMAGENTA 0x8B008BFF
#define COLOR_DARKOLIVEGREEN 0x556B2FFF
#define COLOR_DARKORANGE 0xFF8C00FF
#define COLOR_DARKORCHID 0x9932CCFF
#define COLOR_DARKRED 0x8B0000FF
#define COLOR_DARKSALMON 0xE9967AFF
#define COLOR_DARKSEAGREEN 0x8FBC8BFF
#define COLOR_DARKSLATEBLUE 0x483D8BFF
#define COLOR_DARKSLATEGRAY 0x2F4F4FFF
#define COLOR_DARKTURQUOISE 0x00CED1FF
#define COLOR_DARKVIOLET 0x9400D3FF
#define COLOR_DEEPPINK 0xFF1493FF
#define COLOR_DEEPSKYBLUE 0x00BFFFFF
#define COLOR_DESKTOP 0x000000FF
#define COLOR_DIMGRAY 0x696969FF
#define COLOR_DODGERBLUE 0x1E90FFFF
#define COLOR_FIREBRICK 0xB22222FF
#define COLOR_FLORALWHITE 0xFFFAF0FF
#define COLOR_FORESTGREEN 0x228B22FF
#define COLOR_FUCHSIA 0xFF00FFFF
#define COLOR_GAINSBORO 0xDCDCDCFF
#define COLOR_GHOSTWHITE 0xF8F8FFFF
#define COLOR_GOLD 0xFFD700FF
#define COLOR_GOLDENROD 0xDAA520FF
#define COLOR_GRADIENTACTIVECAPTION 0xB9D1EAFF
#define COLOR_GRADIENTINACTIVECAPTION 0xD7E4F2FF
#define COLOR_GRAY 0x808080FF
#define COLOR_GRAYTEXT 0x808080FF
#define COLOR_GREEN 0x008000FF
#define COLOR_GREENYELLOW 0xADFF2FFF
#define COLOR_HIGHLIGHT 0x3399FFFF
#define COLOR_HIGHLIGHTTEXT 0xFFFFFFFF
#define COLOR_HONEYDEW 0xF0FFF0FF
#define COLOR_HOTPINK 0xFF69B4FF
#define COLOR_HOTTRACK 0x0066CCFF
#define COLOR_INACTIVEBORDER 0xF4F7FCFF
#define COLOR_INACTIVECAPTION 0xBFCDDBFF
#define COLOR_INACTIVECAPTIONTEXT 0x434E54FF
#define COLOR_INDIANRED 0xCD5C5CFF
#define COLOR_INDIGO 0x4B0082FF
#define COLOR_INFO 0xFFFFE1FF
#define COLOR_INFOTEXT 0x000000FF
#define COLOR_IVORY 0xFFFFF0FF
#define COLOR_KHAKI 0xF0E68CFF
#define COLOR_LAVENDER 0xE6E6FAFF
#define COLOR_LAVENDERBLUSH 0xFFF0F5FF
#define COLOR_LAWNGREEN 0x7CFC00FF
#define COLOR_LEMONCHIFFON 0xFFFACDFF
#define COLOR_LIGHTBLUE 0xADD8E6FF
#define COLOR_LIGHTCORAL 0xF08080FF
#define COLOR_LIGHTCYAN 0xE0FFFFFF
#define COLOR_LIGHTGOLDENRODYELLOW 0xFAFAD2FF
#define COLOR_LIGHTGRAY 0xD3D3D3FF
#define COLOR_LIGHTGREEN 0x90EE90FF
#define COLOR_LIGHTPINK 0xFFB6C1FF
#define COLOR_LIGHTSALMON 0xFFA07AFF
#define COLOR_LIGHTSEAGREEN 0x20B2AAFF
#define COLOR_LIGHTSKYBLUE 0x87CEFAFF
#define COLOR_LIGHTSLATEGRAY 0x778899FF
#define COLOR_LIGHTSTEELBLUE 0xB0C4DEFF
#define COLOR_LIGHTYELLOW 0xFFFFE0FF
#define COLOR_LIME 0x00FF00FF
#define COLOR_LIMEGREEN 0x32CD32FF
#define COLOR_LINEN 0xFAF0E6FF
#define COLOR_MAGENTA 0xFF00FFFF
#define COLOR_MAROON 0x800000FF
#define COLOR_MEDIUMAQUAMARINE 0x66CDAAFF
#define COLOR_MEDIUMBLUE 0x0000CDFF
#define COLOR_MEDIUMORCHID 0xBA55D3FF
#define COLOR_MEDIUMPURPLE 0x9370DBFF
#define COLOR_MEDIUMSEAGREEN 0x3CB371FF
#define COLOR_MEDIUMSLATEBLUE 0x7B68EEFF
#define COLOR_MEDIUMSPRINGGREEN 0x00FA9AFF
#define COLOR_MEDIUMTURQUOISE 0x48D1CCFF
#define COLOR_MEDIUMVIOLETRED 0xC71585FF
#define COLOR_MENU 0xF0F0F0FF
#define COLOR_MENUBAR 0xF0F0F0FF
#define COLOR_MENUHIGHLIGHT 0x3399FFFF
#define COLOR_MENUTEXT 0x000000FF
#define COLOR_MIDNIGHTBLUE 0x191970FF
#define COLOR_MINTCREAM 0xF5FFFAFF
#define COLOR_MISTYROSE 0xFFE4E1FF
#define COLOR_MOCCASIN 0xFFE4B5FF
#define COLOR_NAVAJOWHITE 0xFFDEADFF
#define COLOR_NAVY 0x000080FF
#define COLOR_OLDLACE 0xFDF5E6FF
#define COLOR_OLIVE 0x808000FF
#define COLOR_OLIVEDRAB 0x6B8E23FF
#define COLOR_ORANGE 0xFFA500FF
#define COLOR_ORANGERED 0xFF4500FF
#define COLOR_ORCHID 0xDA70D6FF
#define COLOR_PALEGOLDENROD 0xEEE8AAFF
#define COLOR_PALEGREEN 0x98FB98FF
#define COLOR_PALETURQUOISE 0xAFEEEEFF
#define COLOR_PALEVIOLETRED 0xDB7093FF
#define COLOR_PAPAYAWHIP 0xFFEFD5FF
#define COLOR_PEACHPUFF 0xFFDAB9FF
#define COLOR_PERU 0xCD853FFF
#define COLOR_PINK 0xFFC0CBFF
#define COLOR_PLUM 0xDDA0DDFF
#define COLOR_POWDERBLUE 0xB0E0E6FF
#define COLOR_PURPLE 0x800080FF
#define COLOR_RED 0xFF0000FF
#define COLOR_ROSYBROWN 0xBC8F8FFF
#define COLOR_ROYALBLUE 0x4169E1FF
#define COLOR_SADDLEBROWN 0x8B4513FF
#define COLOR_SALMON 0xFA8072FF
#define COLOR_SANDYBROWN 0xF4A460FF
#define COLOR_SCROLLBAR 0xC8C8C8FF
#define COLOR_SEAGREEN 0x2E8B57FF
#define COLOR_SEASHELL 0xFFF5EEFF
#define COLOR_SIENNA 0xA0522DFF
#define COLOR_SILVER 0xC0C0C0FF
#define COLOR_SKYBLUE 0x87CEEBFF
#define COLOR_SLATEBLUE 0x6A5ACDFF
#define COLOR_SLATEGRAY 0x708090FF
#define COLOR_SNOW 0xFFFAFAFF
#define COLOR_SPRINGGREEN 0x00FF7FFF
#define COLOR_STEELBLUE 0x4682B4FF
#define COLOR_TAN 0xD2B48CFF
#define COLOR_TEAL 0x008080FF
#define COLOR_THISTLE 0xD8BFD8FF
#define COLOR_TOMATO 0xFF6347FF
#define COLOR_TRANSPARENT 0xFFFFFF00
#define COLOR_TURQUOISE 0x40E0D0FF
#define COLOR_VIOLET 0xEE82EEFF
#define COLOR_WHEAT 0xF5DEB3FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_WHITESMOKE 0xF5F5F5FF
#define COLOR_WINDOW 0xFFFFFFFF
#define COLOR_WINDOWFRAME 0x646464FF
#define COLOR_WINDOWTEXT 0x000000FF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_YELLOWGREEN 0x9ACD32FF
#define STEALTH_ORANGE 0xFF880000
#define STEALTH_OLIVE 0x66660000
#define STEALTH_GREEN 0x33DD1100
#define STEALTH_PINK 0xFF22EE00
#define STEALTH_BLUE 0x0077BB00 

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

/* ** REPLACE UNDERSCORE IN PLAYER NAME ** */


stock strreplace(string[], find, replace)
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            string[i] = replace;
        }
    }
}
stock GetName(playerid)
{
    new
        name[24];
    GetPlayerName(playerid, name, sizeof(name));
    strreplace(name, '_', ' ');
    return name;
}

/* ** PROXIMITY CHAT ** */

stock ProxDetector(Float:radi, playerid, string[],color)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    foreach(Player,i)
    {
        if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
        {
            SendClientMessage(i,color,string);
        }
    }
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
LoadInventory(playerid);

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
SaveInventory(playerid);
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

public OnPlayerUseItem(playerid,ItemName[])
{
  if(!strcmp(ItemName,"Desert Eagle",true))
  {
    new message[128];
    GivePlayerWeapon(playerid, 24, 5);
    RemoveItem(playerid,ItemName,1);
    format(message, sizeof(message), "%s takes out their Desert Eagle.", GetName(playerid));
    ProxDetector(30.0, playerid, message, COLOR_PURPLE);
    return SendClientMessage(playerid,0xFFFFFFFF,"You have taken out your Desert Eagle.");
  }
  return 0;
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

    new message[128];
    format(message, sizeof(message), "%s says: %s", GetName(playerid), text);
    ProxDetector(30.0, playerid, message, -1);
    return 0;
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
    InventoryOnDialogResponse(playerid, dialogid, response, inputtext);
    return 1;
}

/* ** ANOTHER YET TO BE USED FUNCTION ** */

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
    return 1;
}

/* ** CHAT COMMANDS ** */

CMD:me(playerid, params[])
{
    new
        string[128],
        action[100];
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, "USAGE: /me [action]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "* %s %s", GetName(playerid), action);
        ProxDetector(30, playerid, string, COLOR_PURPLE);
    }
    return 1;
}

CMD:do(playerid, params[])
{
    new
        string[128],
        action[100];
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, "USAGE: /do [action]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "* %s ( %s )", action, GetName(playerid));
        ProxDetector(30, playerid, string, COLOR_PURPLE);
    }
    return 1;
}

CMD:shout(playerid, params[])
{
    new
        string[128],
        shout[100];
    if(sscanf(params, "s[100]", shout))
    {
        SendClientMessage(playerid, -1, "USAGE: /(s)hout [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "%s shouts: %s!",GetName(playerid),shout);
        ProxDetector(50.0, playerid, string, COLOR_WHEAT);
    }
    return 1;
}
CMD:s(playerid, params[]) return cmd_shout(playerid, params);

CMD:ooc(playerid, params[])
{
    new
        string[128],
        ooc[100];
    if(sscanf(params, "s[100]", ooc))
    {
        SendClientMessage(playerid, -1, "USAGE: /(o)oc [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "((%s: %s))",GetName(playerid),ooc);
        SendClientMessageToAll(-1, string);
    }
    return 1;
}
CMD:o(playerid, params[]) return cmd_ooc(playerid, params);

CMD:b(playerid, params[])
{
    new
        string[128],
        local[100];
    if(sscanf(params, "s[100]", local))
    {
        SendClientMessage(playerid, -1, "USAGE: /b [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "%s: ((%s))",GetName(playerid),local);
        ProxDetector(30.0, playerid, string, -1);
    }
    return 1;
}

CMD:gun(playerid, params[])
{
AddItem(playerid,"Desert Eagle",1);
return 1;
}
CMD:i(playerid, params[])
{
ShowInventory(playerid);
return 1;
}
CMD:inventory(playerid, params[]) return cmd_i(playerid, params);
CMD:inv(playerid, params[]) return cmd_i(playerid, params);