Stupid plot flag with stupid bells and whistles. Basically just make a scripts/globals/PLOT.lua with content like this:
```lua
---@enum PLOT
---@enum (key)PLOT.key
local PLOT = {
    initial = 0;
    night_met_susie = 10;
    holidayhouse_enter = 20;
    apartment_enter = 40;
    shelter_enter = 60;
    shelter_read_documents = 70;
    shelter_doctor_duo_yuri_scene = 71; -- 100% forecasted canon trust me
}

return PLOT
```

I don't feel like writing the rest of the tutorial right now sorry
