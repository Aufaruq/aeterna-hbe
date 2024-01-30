//buat manggil fungsi hook
#include <YSI_Coding\y_hooks>

// By aupa
// Hbe Aeterne

//perlu di ketahui, ini adalah SC untuk gm basic yang menggunakan Player Enum yaitu "PlayerData", jika kalian menggunakan LRP ubah "PlayerData" Menjadi "pData" jika inferno "PlayerInfo" tergantung gm yang lu pake

//Perlu di ketahui, ubah bagian pHealth, pArmor, pHunger, pThirst, pStress, sesuai dengan GM kalian, beda gm beda enum

//file ini sudah include menjadi 1 untuk hbe, tinggal jadikan file ini .pwn ( jangan di compile )
//panggil ke gm utama kalian
//#include "module/namafile.pwn"

//body
new PlayerText: AufaHbeAeternaCopas[MAX_PLAYERS][20];
//progress
new PlayerText: DARAHPG[MAX_PLAYERS];
new PlayerText: ARMORPG[MAX_PLAYERS];
new PlayerText: LAPARPG[MAX_PLAYERS];
new PlayerText: HAUSPG[MAX_PLAYERS];
new PlayerText: STRESSPG[MAX_PLAYERS];
//icon
new PlayerText: ICONDARAH[MAX_PLAYERS];
new PlayerText: ICONARMOR[MAX_PLAYERS];
new PlayerText: ICONLAPAR[MAX_PLAYERS];
new PlayerText: ICONHAUS[MAX_PLAYERS];
new PlayerText: ICONSTRESS[MAX_PLAYERS];


//stock show hbe nya
stock ShowHbeaufa(playerid) {
    for(new i = 0; i < 20; i++)
    {
        PlayerTextDrawShow(playerid, AufaHbeAeternaCopas[playerid][i]);
    }
    //progress
    PlayerTextDrawShow(playerid, DARAHPG[playerid]);
    PlayerTextDrawShow(playerid, ARMORPG[playerid]);
    PlayerTextDrawShow(playerid, LAPARPG[playerid]);
    PlayerTextDrawShow(playerid, HAUSPG[playerid]);
    PlayerTextDrawShow(playerid, STRESSPG[playerid]);
    //icon
    PlayerTextDrawShow(playerid, ICONDARAH[playerid]);
    PlayerTextDrawShow(playerid, ICONARMOR[playerid]);
    PlayerTextDrawShow(playerid, ICONLAPAR[playerid]);
    PlayerTextDrawShow(playerid, ICONHAUS[playerid]);
    PlayerTextDrawShow(playerid, ICONSTRESS[playerid]);
}

//stock untuk UpdateHbe nya
stock UpdateHBE(playerid) {
    if (PlayerData[playerid][pSpawned] && !PlayerData[playerid][pTogHud]) {

        new Float:health, Float:armour, Float:aufalapar, Float:aufahaus, Float:stress;

        GetPlayerHealth(playerid, PlayerData[playerid][pHealth]);
        GetPlayerArmour(playerid, PlayerData[playerid][pArmor]);

        health = PlayerData[playerid][pHealth] * -22.0/100;
        PlayerTextDrawTextSize(playerid, DARAHPG[playerid], 20.0, health);
        PlayerTextDrawShow(playerid, DARAHPG[playerid]);

        armour = PlayerData[playerid][pArmor] * -22.0/100;
        PlayerTextDrawTextSize(playerid, ARMORPG[playerid], 20.0, armour);
        PlayerTextDrawShow(playerid, ARMORPG[playerid]);

        aufalapar = PlayerData[playerid][pHunger] * -22.0/100;
        PlayerTextDrawTextSize(playerid, LAPARPG[playerid], 20.0, aufalapar);
        PlayerTextDrawShow(playerid, LAPARPG[playerid]);

        aufahaus = PlayerData[playerid][pThirst] * -22.0/100;
        PlayerTextDrawTextSize(playerid, HAUSPG[playerid], 20.0, aufahaus);
        PlayerTextDrawShow(playerid, HAUSPG[playerid]);

        stress = PlayerData[playerid][pStress] * -22.0/100;
        PlayerTextDrawTextSize(playerid, STRESSPG[playerid], 20.0, stress);
        PlayerTextDrawShow(playerid, STRESSPG[playerid]);
        GetPlayerHealth(playerid, PlayerData[playerid][pHealth]);
        GetPlayerArmour(playerid, PlayerData[playerid][pArmor]);
    }
    return 1;
}

//buat show hbe nya
hook OnPlayerConnect(playerid){
	ShowHbeaufa(playerid);
}

//textdraw
hook OnGameModeInit() {
//hud aufa
    //progress
    DARAHPG[playerid] = CreatePlayerTextDraw(playerid, 244.000, 440.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, DARAHPG[playerid], 20.000, -22.000);
    PlayerTextDrawAlignment(playerid, DARAHPG[playerid], 1);
    PlayerTextDrawColor(playerid, DARAHPG[playerid], 1018393087);
    PlayerTextDrawSetShadow(playerid, DARAHPG[playerid], 0);
    PlayerTextDrawSetOutline(playerid, DARAHPG[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, DARAHPG[playerid], 255);
    PlayerTextDrawFont(playerid, DARAHPG[playerid], 4);
    PlayerTextDrawSetProportional(playerid, DARAHPG[playerid], 1);

    ARMORPG[playerid] = CreatePlayerTextDraw(playerid, 275.000, 440.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, ARMORPG[playerid], 20.000, -22.000);
    PlayerTextDrawAlignment(playerid, ARMORPG[playerid], 1);
    PlayerTextDrawColor(playerid, ARMORPG[playerid], 598385151);
    PlayerTextDrawSetShadow(playerid, ARMORPG[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ARMORPG[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ARMORPG[playerid], 255);
    PlayerTextDrawFont(playerid, ARMORPG[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ARMORPG[playerid], 1);

    LAPARPG[playerid] = CreatePlayerTextDraw(playerid, 306.000, 440.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, LAPARPG[playerid], 20.000, -22.000);
    PlayerTextDrawAlignment(playerid, LAPARPG[playerid], 1);
    PlayerTextDrawColor(playerid, LAPARPG[playerid], -626712321);
    PlayerTextDrawSetShadow(playerid, LAPARPG[playerid], 0);
    PlayerTextDrawSetOutline(playerid, LAPARPG[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, LAPARPG[playerid], 255);
    PlayerTextDrawFont(playerid, LAPARPG[playerid], 4);
    PlayerTextDrawSetProportional(playerid, LAPARPG[playerid], 1);

    HAUSPG[playerid] = CreatePlayerTextDraw(playerid, 337.000, 440.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, HAUSPG[playerid], 20.000, -22.000);
    PlayerTextDrawAlignment(playerid, HAUSPG[playerid], 1);
    PlayerTextDrawColor(playerid, HAUSPG[playerid], 1097458175);
    PlayerTextDrawSetShadow(playerid, HAUSPG[playerid], 0);
    PlayerTextDrawSetOutline(playerid, HAUSPG[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, HAUSPG[playerid], 255);
    PlayerTextDrawFont(playerid, HAUSPG[playerid], 4);
    PlayerTextDrawSetProportional(playerid, HAUSPG[playerid], 1);

    STRESSPG[playerid] = CreatePlayerTextDraw(playerid, 367.000, 440.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, STRESSPG[playerid], 20.000, -22.000);
    PlayerTextDrawAlignment(playerid, STRESSPG[playerid], 1);
    PlayerTextDrawColor(playerid, STRESSPG[playerid], 1979711743);
    PlayerTextDrawSetShadow(playerid, STRESSPG[playerid], 0);
    PlayerTextDrawSetOutline(playerid, STRESSPG[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, STRESSPG[playerid], 255);
    PlayerTextDrawFont(playerid, STRESSPG[playerid], 4);
    PlayerTextDrawSetProportional(playerid, STRESSPG[playerid], 1);

    //icon
    ICONDARAH[playerid] = CreatePlayerTextDraw(playerid, 250.000, 425.000, "HUD:radar_girlfriend");
    PlayerTextDrawTextSize(playerid, ICONDARAH[playerid], 8.000, 7.000);
    PlayerTextDrawAlignment(playerid, ICONDARAH[playerid], 1);
    PlayerTextDrawColor(playerid, ICONDARAH[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ICONDARAH[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ICONDARAH[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ICONDARAH[playerid], 255);
    PlayerTextDrawFont(playerid, ICONDARAH[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ICONDARAH[playerid], 1);

    ICONARMOR[playerid] = CreatePlayerTextDraw(playerid, 280.000, 424.000, "HUD:radar_tshirt");
    PlayerTextDrawTextSize(playerid, ICONARMOR[playerid], 9.000, 9.000);
    PlayerTextDrawAlignment(playerid, ICONARMOR[playerid], 1);
    PlayerTextDrawColor(playerid, ICONARMOR[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ICONARMOR[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ICONARMOR[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ICONARMOR[playerid], 255);
    PlayerTextDrawFont(playerid, ICONARMOR[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ICONARMOR[playerid], 1);

    ICONLAPAR[playerid] = CreatePlayerTextDraw(playerid, 312.000, 425.000, "HUD:radar_pizza");
    PlayerTextDrawTextSize(playerid, ICONLAPAR[playerid], 7.000, 8.000);
    PlayerTextDrawAlignment(playerid, ICONLAPAR[playerid], 1);
    PlayerTextDrawColor(playerid, ICONLAPAR[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ICONLAPAR[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ICONLAPAR[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ICONLAPAR[playerid], 255);
    PlayerTextDrawFont(playerid, ICONLAPAR[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ICONLAPAR[playerid], 1);

    ICONHAUS[playerid] = CreatePlayerTextDraw(playerid, 343.000, 424.000, "HUD:radar_diner");
    PlayerTextDrawTextSize(playerid, ICONHAUS[playerid], 9.000, 9.000);
    PlayerTextDrawAlignment(playerid, ICONHAUS[playerid], 1);
    PlayerTextDrawColor(playerid, ICONHAUS[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ICONHAUS[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ICONHAUS[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ICONHAUS[playerid], 255);
    PlayerTextDrawFont(playerid, ICONHAUS[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ICONHAUS[playerid], 1);

    ICONSTRESS[playerid] = CreatePlayerTextDraw(playerid, 373.000, 424.000, "HUD:radar_waypoint");
    PlayerTextDrawTextSize(playerid, ICONSTRESS[playerid], 9.000, 9.000);
    PlayerTextDrawAlignment(playerid, ICONSTRESS[playerid], 1);
    PlayerTextDrawColor(playerid, ICONSTRESS[playerid], -1);
    PlayerTextDrawSetShadow(playerid, ICONSTRESS[playerid], 0);
    PlayerTextDrawSetOutline(playerid, ICONSTRESS[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, ICONSTRESS[playerid], 255);
    PlayerTextDrawFont(playerid, ICONSTRESS[playerid], 4);
    PlayerTextDrawSetProportional(playerid, ICONSTRESS[playerid], 1);

    //body hbe
    AufaHbeAeternaCopas[playerid][0] = CreatePlayerTextDraw(playerid, 388.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][0], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][0], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][0], 1979711743);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][0], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][0], 1);

    AufaHbeAeternaCopas[playerid][1] = CreatePlayerTextDraw(playerid, 242.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][1], 25.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][1], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][1], 1018393087);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][1], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][1], 1);

    AufaHbeAeternaCopas[playerid][2] = CreatePlayerTextDraw(playerid, 241.000, 441.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][2], 24.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][2], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][2], 1018393087);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][2], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][2], 1);

    AufaHbeAeternaCopas[playerid][3] = CreatePlayerTextDraw(playerid, 265.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][3], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][3], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][3], 1018393087);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][3], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][3], 1);

    AufaHbeAeternaCopas[playerid][4] = CreatePlayerTextDraw(playerid, 241.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][4], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][4], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][4], 1018393087);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][4], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][4], 1);

    AufaHbeAeternaCopas[playerid][5] = CreatePlayerTextDraw(playerid, 273.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][5], 25.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][5], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][5], 598385151);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][5], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][5], 1);

    AufaHbeAeternaCopas[playerid][6] = CreatePlayerTextDraw(playerid, 272.000, 441.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][6], 24.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][6], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][6], 598385151);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][6], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][6], 1);

    AufaHbeAeternaCopas[playerid][7] = CreatePlayerTextDraw(playerid, 296.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][7], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][7], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][7], 598385151);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][7], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][7], 1);

    AufaHbeAeternaCopas[playerid][8] = CreatePlayerTextDraw(playerid, 272.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][8], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][8], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][8], 598385151);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][8], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][8], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][8], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][8], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][8], 1);

    AufaHbeAeternaCopas[playerid][9] = CreatePlayerTextDraw(playerid, 304.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][9], 25.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][9], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][9], -626712321);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][9], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][9], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][9], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][9], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][9], 1);

    AufaHbeAeternaCopas[playerid][10] = CreatePlayerTextDraw(playerid, 303.000, 441.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][10], 24.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][10], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][10], -626712321);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][10], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][10], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][10], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][10], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][10], 1);

    AufaHbeAeternaCopas[playerid][11] = CreatePlayerTextDraw(playerid, 327.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][11], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][11], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][11], -626712321);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][11], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][11], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][11], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][11], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][11], 1);

    AufaHbeAeternaCopas[playerid][12] = CreatePlayerTextDraw(playerid, 303.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][12], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][12], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][12], -626712321);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][12], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][12], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][12], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][12], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][12], 1);

    AufaHbeAeternaCopas[playerid][13] = CreatePlayerTextDraw(playerid, 335.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][13], 25.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][13], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][13], 1097458175);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][13], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][13], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][13], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][13], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][13], 1);

    AufaHbeAeternaCopas[playerid][14] = CreatePlayerTextDraw(playerid, 334.000, 441.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][14], 24.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][14], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][14], 1097458175);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][14], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][14], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][14], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][14], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][14], 1);

    AufaHbeAeternaCopas[playerid][15] = CreatePlayerTextDraw(playerid, 358.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][15], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][15], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][15], 1097458175);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][15], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][15], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][15], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][15], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][15], 1);

    AufaHbeAeternaCopas[playerid][16] = CreatePlayerTextDraw(playerid, 334.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][16], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][16], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][16], 1097458175);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][16], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][16], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][16], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][16], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][16], 1);

    AufaHbeAeternaCopas[playerid][17] = CreatePlayerTextDraw(playerid, 365.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][17], 25.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][17], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][17], 1979711743);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][17], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][17], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][17], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][17], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][17], 1);

    AufaHbeAeternaCopas[playerid][18] = CreatePlayerTextDraw(playerid, 364.000, 441.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][18], 24.000, 2.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][18], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][18], 1979711743);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][18], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][18], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][18], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][18], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][18], 1);

    AufaHbeAeternaCopas[playerid][19] = CreatePlayerTextDraw(playerid, 364.000, 415.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, AufaHbeAeternaCopas[playerid][19], 2.000, 28.000);
    PlayerTextDrawAlignment(playerid, AufaHbeAeternaCopas[playerid][19], 1);
    PlayerTextDrawColor(playerid, AufaHbeAeternaCopas[playerid][19], 1979711743);
    PlayerTextDrawSetShadow(playerid, AufaHbeAeternaCopas[playerid][19], 0);
    PlayerTextDrawSetOutline(playerid, AufaHbeAeternaCopas[playerid][19], 0);
    PlayerTextDrawBackgroundColor(playerid, AufaHbeAeternaCopas[playerid][19], 255);
    PlayerTextDrawFont(playerid, AufaHbeAeternaCopas[playerid][19], 4);
    PlayerTextDrawSetProportional(playerid, AufaHbeAeternaCopas[playerid][19], 1);
}