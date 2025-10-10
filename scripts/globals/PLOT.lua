---@enum PLOT
---@enum (key)PLOT.key
local PLOT = {
    initial = 0;
    night_met_susie = 10;
    holidayhouse_enter = 20;
    apartment_enter = 40;
    apartment_exit = 55;
    shelter_enter = 60;
    shelter_heard_log = 70;
    gateway_enter = 90; -- cutscene in shelter/coreleadup played
    gateway_collapse = 95; -- gateway begins collapsing
    depths_enter = 100; -- gateway collapse finished
    depths_slip = 105; -- kris slipped and died, aw man...
    depths_pirates = 110; -- kris slipped and died, aw man...

    -- TODO: Adjust these numbers to something more sensible once we get to that point
    -- I hate that I can't do that anymore because it'd break save files
    boat_leadup_scrap               =  115;
    boat_act1_start                 =  120;
    boat_act1_mapswitch             = 122;
    boat_act1_paddle                = 124;
    boat_act1_chef_talk             = 126;
    boat_act1_gambler_spoken        = 128;
    boat_act1_end                   = 130;
    boat_act2_mapswitch             = 135;
    boat_act2_scrap                 = 140;
    boat_act3_mapswitch             = 142;
    boat_act3_coat                  = 144;
    boat_act3_start                 = 146;
    boat_act3_scientist_foodgive    = 148;
    boat_act3_room101_confrontation = 150;
    boat_end                        = 160;

    nf_school_init = 5000;
    nf_school_interact1Alph = 5001;
    nf_school_interact2Alph = 5002;
}

return PLOT
