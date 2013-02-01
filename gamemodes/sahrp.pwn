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
 *                               Created By: Ben Cherrington and David Engles ( Ideas ).                    
 */

/* ** INCLUDES AND DEFINES ** */

#include <a_samp>
#include <YSI\y_ini>
#include <fixed>
#include <zcmd>
#include <ProgressBar>
#include <foreach>
#include <sscanf>
#include <a_angles>
#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define PATH "/Users/%s.ini"
#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#pragma tabsize 0
#define INV_DIALOG_ID 13337
#define MAX_ITEMS 20
#define MAX_ITEM_STACK 99
#define MAX_ITEM_NAME 24



#define NIL_FACTION -1
#define NIL_RANK -1

#define FACTION_ID_COP 0
#define COP_RANK_CADET 0
#define COP_RANK_OFFICER 1
#define FACTION_ID_RR 1
#define RR_RANK_RECRUIT 0


/* ** COLOURS ** */
#define RANKINC_RED 0xAA3333AA
#define RANKINC_GREEN 0x33AA33AA
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
#define COLOR_LIGHTRED 0xFF6347AA
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
    Float:pHunger,
    Float:pPosx,
    Float:pPosy,
    Float:pPosz,
    pInt,
    pVw,
    pFac,
    pRank,
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

enum Ranks
{
	factionid,
	rankid,
};

new System[MAX_PLAYERS][Ranks];

new Bar:hungry[MAX_PLAYERS] = {INVALID_BAR_ID, ...};
forward ProgressBar();
forward update();

new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new gPlayerAnimLibsPreloaded[MAX_PLAYERS];

new Text:txtAnimHelper;
new ExitAnim[MAX_PLAYERS];
new Offer[MAX_PLAYERS];
new ChosenStyle[MAX_PLAYERS];

forward OnPlayerUseItem(playerid,ItemName[]);
new gItemList[(MAX_ITEMS+1)*(MAX_ITEM_NAME+3)];

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
    INI_Float("Hunger",PlayerInfo[playerid][pHunger]);
    INI_Float("X",PlayerInfo[playerid][pPosx]);
    INI_Float("Y",PlayerInfo[playerid][pPosy]);
    INI_Float("Z",PlayerInfo[playerid][pPosz]);
    INI_Int("Int",PlayerInfo[playerid][pInt]);
    INI_Int("Vw",PlayerInfo[playerid][pVw]);
    INI_Int("Faction",PlayerInfo[playerid][pFac]);
    INI_Int("Rank",PlayerInfo[playerid][pRank]);
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

/* ** INVENTORY STOCKS ** */

stock _GetItemNamePVar(playerid,item)
{
	new tmp[32];
	new tmp2[MAX_ITEM_NAME];
	format(tmp,32,"PITEMNAME%d",item);
	GetPVarString(playerid,tmp,tmp2,MAX_ITEM_NAME);
	return tmp2;
}
stock _SetItemNamePVar(playerid,item,ItemName[])
{
	new tmp[MAX_ITEM_NAME];
	format(tmp,MAX_ITEM_NAME,"PITEMNAME%d",item);
	SetPVarString(playerid,tmp,ItemName);
}
stock _GetItemAmountPVar(playerid,item)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	return GetPVarInt(playerid,tmp);
}
stock _SetItemAmountPVar(playerid,item,Amount)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	SetPVarInt(playerid,tmp,Amount);
}
stock AddItem(playerid,ItemName[],Amount)
{
	new slot=-1;
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))
		{
			if(slot==-1)slot=item;
			continue;
		}
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
		{
			_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)+Amount);
			if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
			if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
			{
				_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
				return 2;
			}
			return 1;
		}
	}
	if(slot>-1)
	{
		_SetItemNamePVar(playerid,slot,ItemName);
		_SetItemAmountPVar(playerid,slot,Amount);
		if(_GetItemAmountPVar(playerid,slot)>MAX_ITEM_STACK)
		{
			_SetItemAmountPVar(playerid,slot,MAX_ITEM_STACK);
			return 2;
		}
		return 1;
	}
	return 0;
}
stock RemoveItem(playerid,ItemName[],Amount)
{
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))continue;
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
		{
			_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)-Amount);
			if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
			if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
			{
				_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
				return 2;
			}
			return 1;
		}
	}
	return 0;
}
stock PlayerHasItem(playerid,ItemName[])
{
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))continue;
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,false))return _GetItemAmountPVar(playerid,item);
	}
	return 0;
}
stock GetPlayerItemInfo(playerid,&idx,ItemName[],len=sizeof(ItemName),&Amount)
{
	if(idx>=MAX_ITEMS)return 0;
	format(ItemName,len,_GetItemNamePVar(playerid,idx));
	Amount=_GetItemAmountPVar(playerid,idx);
	idx++;
	return 1;
}
stock ResetPlayerInventory(playerid)
{
	for(new item;item<MAX_ITEMS;item++)_SetItemAmountPVar(playerid,item,0);
}
stock ShowInventory(playerid)
{
	gItemList="";
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
		format(gItemList,sizeof(gItemList),"%s\n%d\t\t%s",gItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
	}
	format(gItemList,sizeof(gItemList),"Amount\t\tItem Name%s",gItemList);
	ShowPlayerDialog(playerid,INV_DIALOG_ID,DIALOG_STYLE_LIST,"Inventory",gItemList,"Use","Close");
	SetPVarInt(playerid,"PUSINGDIALOG",1);
}
stock SaveInventory(playerid)
{
	gItemList="";
	new filename[48];
	GetPlayerName(playerid,filename,24);
	format(filename,48,"Inventory/%s.inv",filename);
	new File:file=fopen(filename,io_write);
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
		format(gItemList,sizeof(gItemList),"%s%s\n%d\n",gItemList,_GetItemNamePVar(playerid,item),_GetItemAmountPVar(playerid,item));
	}
	fwrite(file,gItemList);
	fclose(file);
	GetPlayerName(playerid,filename,24);
	printf("[INV] %s[%d]'s inventory saved.",filename,playerid);
}
stock LoadInventory(playerid)
{
	new tstring[48];
	new tstring2[12];
	GetPlayerName(playerid,tstring,48);
	format(tstring,48,"Inventory/%s.inv",tstring);
	if(!fexist(tstring))return 0;
	new File:file=fopen(tstring,io_read);
	fread(file,tstring);
	while(tstring[0])
	{
		format(tstring,strlen(tstring),"%s",tstring); //Delete last character
		fread(file,tstring2);
		AddItem(playerid,tstring,strval(tstring2));
		fread(file,tstring);
	}
	fclose(file);
	GetPlayerName(playerid,tstring,24);
	printf("[INV] %s[%d]'s inventory loaded.",tstring,playerid);
	return 1;
}
InventoryOnDialogResponse(playerid, dialogid, response, inputtext[])
{
	if(dialogid!=INV_DIALOG_ID)return 1;
	if(!GetPVarInt(playerid,"PUSINGDIALOG"))return 1;
	if(!response)return 1;
	if(!strcmp(inputtext,"Amount",true,6))
	{
		ShowInventory(playerid);
		return 1;
	}
	format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
	if(CallLocalFunction("OnPlayerUseItem","is",playerid,gItemList))ShowInventory(playerid);
	else SetPVarInt(playerid,"PUSINGDIALOG",0);
	return 1;
}

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
    
    //HUNGER STUFF
    
    SetTimer("ProgressBar", 90000, 1);
	SetTimer("update", 1000, 1);
    
    for(new playerid; playerid < MAX_PLAYERS; playerid++)
    {
        new Float:health;
		GetPlayerHealth(playerid, health);
        new HungryTime = SetPlayerHealth(playerid, health-5);
		if(GetProgressBarValue(hungry[playerid]) <= 0)
		{
	    	SetTimer("HungryTime", 30000, 1);
	    	SendClientMessage(playerid, COLOR_BLUE, "You Are Hungry Now, Go To The Restaurant To Eat Some Food");
	    	SendClientMessage(playerid, COLOR_BLUE, "If You're Not Going To Eat, You Will Lose Your Health Every 30 Seconds");
		}
		if(GetProgressBarValue(hungry[playerid]) <= 0)
		{
		    SetProgressBarValue(hungry[playerid], 0);
		}
		if(GetProgressBarValue(hungry[playerid]) > 0)
		{
		    KillTimer(HungryTime);
		}
	}

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

OnePlayAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, freeze, time)
{
	ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, freeze, time, 1);
	return;
}

LoopingAnim(playerid,animlib[],animname[], Float:Speed, looping, lockx, locky, freeze, time)
{
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, Speed, looping, lockx, locky, freeze, time, 1);
    TextDrawShowForPlayer(playerid,txtAnimHelper);
    return;
}

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

public ProgressBar()
{
    for(new playerid; playerid < MAX_PLAYERS; playerid++)
    {
		SetProgressBarValue(hungry[playerid], GetProgressBarValue(hungry[playerid])-2);
	}
	return 1;
}

public update()
{
	for(new playerid; playerid < MAX_PLAYERS; playerid++)
	{
	    UpdateProgressBar(hungry[playerid], playerid);
	}
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
RANKS_connect(playerid);
TogglePlayerClock(playerid, false);
if(fexist(UserPath(playerid)))
{
    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_WHITE"Welcome back to SAHeaven RP.\n\nType your password below to login.","Login","Quit");
}
else
{
    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,""COL_WHITE"Registering...",""COL_WHITE"Welcome to SAHeaven RP.\n\nYou don't appear to have registered yet.\n\nTo make a new account, type your password below.","Register","Quit");
}

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
    SendClientMessage(playerid,0xDEEE20FF, " ");
    
    ExitAnim[playerid] = 0;
    ChosenStyle[playerid] = 0;
    Offer[playerid] = -1;
    gPlayerUsingLoopingAnim[playerid] = 0;
	gPlayerAnimLibsPreloaded[playerid] = 0;
	TextDrawHideForPlayer(playerid,txtAnimHelper);

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
INI_WriteFloat(File,"Hunger",Float:GetProgressBarValue(hungry[playerid]));
INI_WriteFloat(File,"X",PlayerInfo[playerid][pPosx]);
INI_WriteFloat(File,"Y",PlayerInfo[playerid][pPosy]);
INI_WriteFloat(File,"Z",PlayerInfo[playerid][pPosz]);
INI_WriteInt(File,"Int",GetPlayerInterior(playerid));
INI_WriteInt(File,"Vw",GetPlayerVirtualWorld(playerid));
INI_WriteInt(File,"Faction",GetPlayerFaction(playerid));
INI_WriteInt(File,"Rank",GetPlayerRank(playerid));
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
    SetPlayerRank(playerid, PlayerInfo[playerid][pFac], PlayerInfo[playerid][pRank]);
    }
    else{
    }
    PlayerInfo[playerid][pLoggedin] = 1;
    TextDrawHideForPlayer(playerid, welcometitle);
    TextDrawHideForPlayer(playerid, welcomeversion);
    TextDrawHideForPlayer(playerid, welcomeweb);
    hungry[playerid] = CreateProgressBar(548.50, 47.00, 55.50, 4.00, COLOR_GREEN, 100.000000);
	ShowProgressBarForPlayer(playerid, hungry[playerid]);
	SetProgressBarValue(hungry[playerid], Float:PlayerInfo[playerid][pHunger]);
    TogglePlayerClock(playerid, 0);
    
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

/* ** SIMPLE KILL/DEATH STUFF ON PLAYER DEATH ** */

public OnPlayerDeath(playerid, killerid, reason)
{
PlayerInfo[killerid][pKills]++;
PlayerInfo[playerid][pDeaths]++;
SetProgressBarValue(hungry[playerid], 100);

	if(gPlayerUsingLoopingAnim[playerid])
	{
	    ExitAnim[playerid] = 0;
        gPlayerUsingLoopingAnim[playerid] = 0;
        TextDrawHideForPlayer(playerid,txtAnimHelper);
	}
    
    return 1;
}

public OnPlayerUseItem(playerid,ItemName[])
{
  if(!strcmp(ItemName,"Desert Eagle",true))
  {
    if(GetPlayerWeapon(playerid) != 24){
    new message[128];
    ResetPlayerWeapons(playerid);
    GivePlayerWeapon(playerid, 24, 5);
    format(message, sizeof(message), "%s takes out their %s.", GetName(playerid), ItemName);
    ProxDetector(30.0, playerid, message, COLOR_PURPLE);
    return SendClientMessage(playerid,0xFFFFFFFF,"You have taken out your Desert Eagle.");
    }
    if(GetPlayerWeapon(playerid) == 24)
    {
    new message[128];
    ResetPlayerWeapons(playerid);
    format(message, sizeof(message), "%s puts away their %s.", GetName(playerid), ItemName);
    ProxDetector(30.0, playerid, message, COLOR_PURPLE);
    return SendClientMessage(playerid,0xFFFFFFFF,"You have put away your Desert Eagle.");
    }
  }
  if(!strcmp(ItemName,"Burger",true))
  {
    new message[128];
    OnePlayAnim(playerid,"FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0);
    SetProgressBarValue(hungry[playerid], GetProgressBarValue(hungry[playerid])+30);
    new Float:health;
	GetPlayerHealth(playerid, health);
    SetPlayerHealth(playerid, health+30);
    RemoveItem(playerid,ItemName,1);
    format(message, sizeof(message), "%s tucks into their Burger.", GetName(playerid));
    ProxDetector(30.0, playerid, message, COLOR_PURPLE);
    return SendClientMessage(playerid,0xFFFFFFFF,"You have eaten a burger, +30 Hunger.");
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
	if(!gPlayerUsingLoopingAnim[playerid]) return 1;

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
                INI_WriteFloat(File,"Hunger",0);
                INI_Close(File);
                TogglePlayerSpectating(playerid, 0);
                PlayerInfo[playerid][pHunger] = 100;
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

CMD:animhelp(playerid) return cmd_animlist(playerid);
CMD:animlist(playerid)
{
	new amain[800];
	new string[200];
	format(amain, sizeof(amain), "{FFFFFF}You type all animations like this: {7CFC00}'/AN [Name]'.\n{FFFFFF}The only exception is for {7CFC00}'/Kiss [playerid/PartOfName]' {FFFFFF}and {7CFC00}'/Greet [playerid/PartOfName]'{FFFFFF}.\n\nHere is a list of all animations:\n");
	format(string, sizeof(string),"{9ACD32}Cellin - Cellout - Hitch - Scratch - Sit - Lay - Smoke - Bomb - Laugh - Robman - Lookout - Crossarms - Hide - Vomit - Wave\n");
	strcat(amain, string);
	format(string, sizeof(string),"Slapass - Blowjob - Deal - Idle - Pay - Crack - Chat - Fucku - Taichi - Dance - Injured - Shadowbox - Piss - Wank - Sleep\n");
	strcat(amain, string);
	format(string, sizeof(string),"Point - Shout - Look - Aim - CPR - Fixcar - Flag - Bat - Lean - Gang - Wallshoot - What - Insult");
    strcat(amain, string);
	ShowPlayerDialog(playerid, 110, DIALOG_STYLE_MSGBOX, "{00BFFF}Available animations",amain, "Done", "");
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
	            format(string, sizeof(string), "* %s wants to greet you. Type '/Kiss' to accept.", GetName(playerid));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            format(string, sizeof(string), "* You offered %s a greeting.", GetName(playa));
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
	            format(string, sizeof(string), "* %s wants to greet you. Type '/Greet' to accept.", GetName(playerid));
	            SendClientMessage(playa, COLOR_LIGHTBLUE, string);
	            format(string, sizeof(string), "* You offered %s a greeting.", GetName(playa));
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

CMD:gun(playerid, params[])
{
AddItem(playerid,"Desert Eagle",1);
return 1;
}

CMD:eat(playerid, params[])
{
AddItem(playerid,"Burger",1);
return 1;
}

CMD:i(playerid, params[])
{
ShowInventory(playerid);
return 1;
}
CMD:inventory(playerid, params[]) return cmd_i(playerid, params);
CMD:inv(playerid, params[]) return cmd_i(playerid, params);

CMD:setfaction(playerid, params[])
    {
        
            new PID; //define the playerid we wanna kick
            new faction; //the reason, put into a string
            new str[128]; //a new message string
            new Playername[MAX_PLAYER_NAME], Adminname[MAX_PLAYER_NAME]; //defines the function with the playername we wanna get
            GetPlayerName(playerid, Adminname, sizeof(Adminname)); //defines the function with the adminname we wanna get
            GetPlayerName(PID, Playername, sizeof(Playername));
            if(sscanf(params, "us[64]", PID, faction)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: /setfaction [playerid] [factionid]"); //tell sscanf if the parameters/the syntax is written wrong to return a message (PID and the reason used here)

            if(!IsPlayerConnected(PID)) // if the ID is wrong or not connected, return a message! (PID used here)
                return SendClientMessage(playerid, COLOR_GREY, "Player is not connected!");
            SetPlayerRank(PID, faction, 0); //kick the playerid we've defined
            format(str, sizeof(str), "%s has been added to %s by %s.", Playername, faction, Adminname); //format the string we've defined to send the message, playername and adminname are used to receive the information about the names
        SendClientMessage(playerid, COLOR_RED, str); //send that message to all
        

        return 1;
    }