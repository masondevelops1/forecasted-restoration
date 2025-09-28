---@enum PLOT
---@enum (key)PLOT.key
local PLOT = {
    initial = 0;
    night_met_susie = 10;
    holidayhouse_enter = 20;
    apartment_enter = 40;
    apartment_exit = 55;
    shelter_enter = 60;
    shelter_read_documents = 70;
    shelter_doctor_duo_yuri_scene = 71; -- speedrunners will call this "gayass skip"
    gateway_enter = 90; -- cutscene in shelter/coreleadup played
    gateway_collapse = 98; -- gateway begins collapsing
    depths_enter = 99; -- gateway collapse finished

    -- TODO: Adjust these numbers to something more sensible once we get to that point
    boat_leadup_scrap               =  9998;
    boat_act1_start                 =  9999;
    boat_act1_mapswitch             = 10000;
    boat_act1_paddle                = 10001;
    boat_act1_chef_talk             = 10002;
    boat_act1_gambler_spoken        = 10003;
    boat_act1_end                   = 10050;
    boat_act2_mapswitch             = 20000;
    boat_act2_scrap                 = 20050;
    boat_act3_mapswitch             = 30000;
    boat_act3_coat                  = 30005;
    boat_act3_start                 = 30010;
    boat_act3_scientist_foodgive    = 30500;
    boat_act3_room101_confrontation = 30600;
    boat_end                        = 40000;
}

return PLOT
