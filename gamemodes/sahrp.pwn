/*---------------------------------------------------
      San Andreas Heaven Role Play Custom Script.

            Credits - Ben Cherrington
                    - David Engles (Ideas)
----------------------------------------------------*/

#include <a_samp>
#include <core>
#include <float>
#include <YSI\y_ini>

#pragma tabsize 0

#define DIALOG_REGISTER 1
#define DIALOG_LOGIN 2
#define DIALOG_SUCCESS_1 3
#define DIALOG_SUCCESS_2 4
#define DIALOG_QUIZ 5550
#define DIALOG_QUIZ1 5551
#define DIALOG_QUIZ2 5552
#define DIALOG_QUIZ3 5553
#define DIALOG_QUIZ4 5554

// USER FILE LOCATION

#define PATH "/Users/%s.ini"

// COLOURS

#define COL_WHITE "{FFFFFF}"
#define COL_RED "{F81414}"
#define COL_GREEN "{00FF22}"
#define COL_LIGHTBLUE "{00CED1}"

// PLAYER INFO

enum pInfo
{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
    pSkin
}

// PLAYER POSITION

new
    Float: PosX[ MAX_PLAYERS ],
    Float: PosY[ MAX_PLAYERS ],
    Float: PosZ[ MAX_PLAYERS ],
    Float: Angle[ MAX_PLAYERS ],
    Interior[ MAX_PLAYERS ],
    VirtualWorld[ MAX_PLAYERS ]
;

new PlayerInfo[MAX_PLAYERS][pInfo];


// LOAD PLAYER DATA

forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    INI_Float( "PositionX", PosX[ playerid ] );
    INI_Float( "PositionY", PosY[ playerid ] );
    INI_Float( "PositionZ", PosZ[ playerid ] );
    INI_Float( "Angle", Angle[ playerid ] );
    INI_Int( "Interior", Interior[ playerid ] );
    INI_Int( "VirtualWorld", VirtualWorld[ playerid ] );
    return 1;
}

// GRAB PLAYER DATA

stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}

// PASSWORD HASHER FOR USER DATA

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

main()
{
	print("\n----------------------------------");
	print("  SAHeaven RP Script Running...\n");
	print("----------------------------------\n");
}


// SHOW DIALOG ON LOGIN

public OnPlayerConnect(playerid)
{

    if(fexist(UserPath(playerid)))
    {
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
        SetSpawnInfo(playerid, 0, pSkin, PosX[playerid], PosY[playerid], PosZ[playerid], Angle[playerid], Interior[playerid], VirtualWorld[playerid], 0, 0, 0, 0);
    }
    else
    {
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT,""COL_WHITE"Registering...",""COL_WHITE"Type your password below to register a new account.","Register","Quit");
    }
    return 1;
}
// PLAYER LOGIN CHECK (IF EXIST SHOW LOGIN, ELSE SHOW REGISTRATION)
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch( dialogid )
    {
        case DIALOG_REGISTER:
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
                INI_WriteInt(File,"Skin",0);
                INI_SetTag( File, "position" );
                INI_WriteFloat( File, "PositionX", 1958.33);
                INI_WriteFloat( File, "PositionY", 1343.12);
                INI_WriteFloat( File, "PositionZ", 15.36);
                INI_WriteFloat( File, "Angle", 269.15);
                INI_WriteInt( File, "Interior", 0);
                INI_WriteInt( File, "VirtualWorld", 0);
                INI_Close(File);
                SetSpawnInfo(playerid, 0, 0, 1958.33, 1343.12, 15.36, 269.15, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                ShowPlayerDialog(playerid, DIALOG_SUCCESS_1, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"Great! The login system didn't eat itself! Welcome!","Ok","");
            }
            
        }

        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]);

                    SpawnPlayer(playerid);
                    
                    ShowPlayerDialog(playerid, DIALOG_SUCCESS_2, DIALOG_STYLE_MSGBOX,""COL_WHITE"Success!",""COL_GREEN"You have successfully logged in!","Ok","");
                }
                else
                {
                    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                }
                return 1;
            }
        }
    }
    return 1;
}

// SAVE PLAYER DATA ON DISCONNECT

public OnPlayerDisconnect(playerid, reason)
{
    
    GetPlayerPos( playerid, PosX[ playerid ], PosY[ playerid ], PosZ[ playerid ] );
    GetPlayerFacingAngle( playerid, Angle[ playerid ] );
    
    new INI:File = INI_Open(UserPath(playerid));
    INI_SetTag(File,"data");
    INI_WriteInt(File,"Cash",GetPlayerMoney(playerid));
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
    INI_WriteInt(File,"Skin",GetPlayerSkin(playerid));
    
    // STORE PLAYER LOCATION ON DISCONNECT
    INI_SetTag( File, "position" );
    INI_WriteFloat( File, "PositionX", PosX[ playerid ] );
    INI_WriteFloat( File, "PositionY", PosY[ playerid ] );
    INI_WriteFloat( File, "PositionZ", PosZ[ playerid ] );
    INI_WriteFloat( File, "Angle", Angle[ playerid ] );
    INI_WriteInt( File, "Interior", GetPlayerInterior( playerid ) );
    INI_WriteInt( File, "VirtualWorld", GetPlayerVirtualWorld( playerid ) );
    INI_Close( File );
    return 1;
}

// SAVE DEATHS ON DEATH

public OnPlayerDeath(playerid, killerid, reason)
{
    PlayerInfo[killerid][pKills]++;
    PlayerInfo[playerid][pDeaths]++;
    return 1;
}

public OnGameModeInit()
{
	SetGameModeText("SAH:RP");
	ShowPlayerMarkers(1);
	ShowNameTags(1);

	return 1;
}

public OnPlayerSpawn( playerid )
{

    if ( PosX[ playerid ] != 0 && PosY[ playerid ] != 0 && PosZ[ playerid ] != 0 && Angle[ playerid ] != 0 )
    {
        SetPlayerPos( playerid, PosX[ playerid ], PosY[ playerid ], PosZ[ playerid ] );
        SetPlayerFacingAngle( playerid, Angle[ playerid ] );
        SetPlayerInterior( playerid, Interior[ playerid ] );
        SetPlayerVirtualWorld( playerid, VirtualWorld[ playerid ] );
    }
    return ( 1 );
}
