---@type table<string, fun(cutscene:(WorldCutscene|{option:fun(self,txt,...):number, funnytextbox:Textbox}))>
local deviceshelter = {}
local function getSignalStatus()
    return (GCSN and "Connected to Gaster's Cool Social Network" or "No Signal...")
end
deviceshelter.init = function(cutscene)
    cutscene:fadeIn(1.5)
    if cutscene.funnytextbox then return end
    cutscene.funnytextbox = Textbox(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
    cutscene.funnytextbox:setParallax(0)

    --other fonts in assets/fonts
    cutscene.funnytextbox:setFont("main_mono", 32)
    cutscene.funnytextbox.text.line_offset = -3
    --if we just use :setTextColor(), we get this weird gloss to the text. you can see for yourself if you comment out the next line and uncomment the line after
    -- cutscene.funnytextbox:addFX(RecolorFX(0,0.8,0,1))
    cutscene.funnytextbox.text:setTextColor(0,0.8,0,1)

    --double \\ on \\User to escape backslash

    function cutscene:option(txt, ...)
        self.funnytextbox:setText(string.format("[style:none]"..txt, ...))

        --these should be self explanitory, you can see more state options in src/engine/objects/text.lua:105
        self.funnytextbox.text.state.typing_sound = nil
        self.funnytextbox.text.state.speed = 5
        return GonerNumpad.keypadInput(self) 
    end
    cutscene:after(function() cutscene.funnytextbox:remove() end)
    Game.world:addChild(cutscene.funnytextbox)
    cutscene.funnytextbox:setLayer(100)
    love.audio.newSource(Assets.getMusicPath"DEVICE_ON","static"):play()
    cutscene:gotoCutscene("deviceshelter", "main")
end

deviceshelter.main = function(cutscene, reason)
    deviceshelter.init(cutscene)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

===========================
DEVICE:\\DeviceUser1
===========================

[1:] File Explorer
[2:] Internet
[3:] Settings
[0:] Power Off

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied." or reason == "nosig" and "Gateway Signal is currently unavailable." or reason == "corruptfunc" and "[color:red]Internet functionality is currently corrupt.[color:reset]" or reason == "nosave" and "[color:red]ERROR: Shutdown functionality restricted by \"CORRUPT\".[color:reset]" or reason == "nosaverec" and "[color:red]ERROR: Shutdown functionality restricted by \"transmitter.exe\".[color:reset]" or getSignalStatus())
    if choice == 0 then
        if not Plot:isBefore("shelter_heard_log") then
            love.audio.newSource(Assets.getMusicPath"DEVICE_OFF","static"):play()
            cutscene.funnytextbox:setText("[style:none][voice:none]Shutting down...")
            cutscene:wait(1)
            cutscene:fadeOut(1.5, { music = true })
            cutscene:wait(1.6)
            cutscene.funnytextbox:remove()
            return
        else
            if Game:getFlag("recovered") == true then
                return deviceshelter.main(cutscene, "nosaverec") 
            else
                return deviceshelter.main(cutscene, "nosave") 
            end
        end
    elseif choice == 1 then
        if Plot:isBefore("shelter_heard_log") then
            if Game:getFlag("recovered") == true then
                return cutscene:gotoCutscene("deviceshelter", "scenesrec")
            else
                return cutscene:gotoCutscene("deviceshelter", "scenes")
            end
        else
            return deviceshelter.main(cutscene, "nodrive")
        end
    elseif choice == 2 then
        if Game:getFlag("recovered") == true then
            return cutscene:gotoCutscene("deviceshelter", "discoveryrec")
        else
           return deviceshelter.main(cutscene, "corruptfunc")
        end
    elseif choice == 3 then
        return deviceshelter.main(cutscene, "nodrive")
    end
    return deviceshelter.main(cutscene, "invalid")
end

deviceshelter.scenes = function(cutscene, reason)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

==============================
DEVICE:\\DeviceUser1\\Explorer
==============================

[1:] paint.exe
[2:] [color:red]CORRUPT[color:reset]
[3:] [color:red]CORRUPT[color:reset]
[4:] [color:red]CORRUPT[color:reset]
[5:] recovery.exe
[6:] [color:red]CORRUPT[color:reset]
[0:] Exit

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or reason == "unfinished" and "[color:red]File is corrupt. Recover to access.[color:reset]" or reason == "saved" and "Saved to DEVICE Save Path." or getSignalStatus())
    if choice == 0 then return deviceshelter.main(cutscene)
    elseif choice == 1 then
        Kristal.Config["alwaysShowCursor"] = false
        local minigame = Game.world:spawnObject(DrawingMinigame("id_minigame/crayon_id", "stworks_id"), WORLD_LAYERS["ui"])
        minigame.alpha = 0
        cutscene.world.timer:tween(10/30, minigame, {alpha = 1})
        Game.world.music:fade(0, 1/30)
        cutscene:wait(1/30)
        local mus = Music("build_a_bot")
        mus:fade(1, 1/30)
        cutscene:wait(1/30)
        minigame.active_fake = true

        cutscene:wait(function() return minigame.done end)
        mus:fade(0, 1)
        cutscene:wait(1)
        mus:remove()
        minigame:fadeOutAndRemove(10/30)
        Game.world.music:fade(1, 1)
        cutscene:wait(1)
        return deviceshelter.scenes(cutscene, "saved")
    elseif choice == 2 then
        return deviceshelter.scenes(cutscene, "unfinished")
    elseif choice == 3 then
        return deviceshelter.scenes(cutscene, "unfinished")
    elseif choice == 4 then
        return deviceshelter.scenes(cutscene, "unfinished")
    elseif choice == 5 then
        return deviceshelter.recovery(cutscene)
    elseif choice == 6 then
        return deviceshelter.scenes(cutscene, "unfinished")
    end
    return deviceshelter.scenes(cutscene, "invalid")
end

deviceshelter.recovery = function(cutscene, reason)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
[noskip]%s

==================================
DEVICE:\\DeviceUser1\\recovery.exe
==================================

[speed:2]Recovery by Internet not available.
Locally recovering... Please be patient.
(Press any button to restart recovery.)
[[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:01]-[wait:01]-[wait:15]-[wait:25]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:01]-[wait:01]---]
Installing missing files...
[[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:01]-[wait:01]-[wait:15]-[wait:25]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:01]-[wait:01]---]
Recovery Successful.
[speed:5]
===========================
Type in any number to return
to File Explorer.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or reason == "unfinished" and "this is unfinished." or getSignalStatus())
    if cutscene.funnytextbox:isTyping() == false then
        Game:setFlag("recovered", true)
        return deviceshelter.scenesrec(cutscene) 
    else
        return deviceshelter.recovery(cutscene) 
    end
end

deviceshelter.scenesrec = function(cutscene, reason)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

==============================
DEVICE:\\DeviceUser1\\Explorer
==============================

[1:] paint.exe
[2:] [color:red]CORRUPT[color:reset]
[3:] discovery.txt
[4:] transmitter.exe
[5:] recovery.exe
[6:] [color:red]CORRUPT[color:reset]
[0:] Exit

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or reason == "unfinished" and "[color:red]File is locally unrecoverable.[color:reset]" or reason == "saved" and "Saved to DEVICE Save Path." or reason == "recfail" and "[color:red]Cannot recover any more files.[color:reset]" or getSignalStatus())
    if choice == 0 then return deviceshelter.main(cutscene)
    elseif choice == 1 then
        Kristal.Config["alwaysShowCursor"] = false
        local minigame = Game.world:spawnObject(DrawingMinigame("id_minigame/crayon_id", "stworks_id"), WORLD_LAYERS["ui"])
        minigame.alpha = 0
        cutscene.world.timer:tween(10/30, minigame, {alpha = 1})
        Game.world.music:fade(0, 1/30)
        cutscene:wait(1/30)
        local mus = Music("build_a_bot")
        mus:fade(1, 1/30)
        cutscene:wait(1/30)
        minigame.active_fake = true

        cutscene:wait(function() return minigame.done end)
        mus:fade(0, 1)
        cutscene:wait(1)
        mus:remove()
        minigame:fadeOutAndRemove(10/30)
        Game.world.music:fade(1, 1)
        cutscene:wait(1)
        return deviceshelter.scenesrec(cutscene, "saved")
    elseif choice == 2 then
        return deviceshelter.scenesrec(cutscene, "unfinished")
    elseif choice == 3 then
        return deviceshelter.credits(cutscene)
    elseif choice == 5 then
        return deviceshelter.scenesrec(cutscene, "recfail")
    elseif choice == 4 then
        --cutscene.funnytextbox:setText("[style:none][voice:none]Transmission incoming...")
        --cutscene:wait(1)
        --love.audio.newSource(Assets.getMusicPath"DEVICE_OFF","static"):play()
        --cutscene.funnytextbox:setText("[style:none][voice:none]Accepting transmission...")
        --cutscene:wait(1)
        --cutscene.funnytextbox:remove()
        --cutscene:fadeOut(0)
        if Plot:isBefore("shelter_heard_log") then
            return deviceshelter.transmitter(cutscene)
        else
            return deviceshelter.transmitteroff(cutscene)
        end
    elseif choice == 6 then
        return deviceshelter.scenesrec(cutscene, "unfinished")
    end
    return deviceshelter.scenesrec(cutscene, "invalid")
end

deviceshelter.transmitter = function(cutscene, reason)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

==================================
DEVICE:\\DeviceUser1\\transmitter.exe
==================================

Transmitting Shelter Security Data...
- 12:21 AM: Movement detected outside of shelter.
- 12:37 AM: [color:red]!Unauthorized persons detected inside of shelter![color:reset]
[0:] Exit to File Explorer
[1:] Stop Transmitting

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or reason == "unfinished" and "this is unfinished." or getSignalStatus())
    if choice == 0 then
        return deviceshelter.scenesrec(cutscene) 
    elseif choice == 1 then
        SetPlot("shelter_heard_log")
        return deviceshelter.scenesrec(cutscene) 
    end
    return deviceshelter.transmitter(cutscene, "invalid") 
end

deviceshelter.transmitteroff = function(cutscene, reason)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

==================================
DEVICE:\\DeviceUser1\\transmitter.exe
==================================

Transmitter offline. To power on 
the transmitter, insert the 
ShelterAccessDrive.

===========================
Type in any number to make a
return to File Explorer.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or reason == "unfinished" and "this is unfinished." or getSignalStatus())
    return deviceshelter.scenesrec(cutscene) 
end

function deviceshelter.discovery(cutscene)
    deviceshelter.init(cutscene)
    local choice = cutscene:option([[
[color:red]Warning: Some lines are corrupted...[color:reset]

===================================
DEVICE:\\DeviceUser1\\discovery.txt
===================================

The Gateway: Experiment Logs
"DISCOVERY" Date: UNKNOWN
- A DISCOVERY HAS BEEN MADE. 
- ONE THAT MAY BRING US A GREATER HAND 
IN OUR EFFORTS.
- DARKNESS... A SUBSTANCE THAT BRINGS LIFE 
TO OBJECTS OTHERWISE CONSIDERED LIFELESS.
- THAT IS KNOWN, BUT IT MAY NOT BE AS SIMPLE 
AS IT SEEMS.
- DARKNESS IS NOT CREATED. DARKNESS IS PRESENT EVERYWHERE, ALWAYS.
- SIMILAR TO OUR WORLD. A DISCOVERY HAS PROVEN, ANOTHER PLANE EXISTS.
- A WORLD OF PURE DARKNESS, ACCESSIBLE WITH THE CORRECT TECHNIQUE.
- I HAVE NAMED IT "THE ...

===========================
All other lines are locally unrecoverable.
Press any button to return.
> _
]])
    --if choice == 0 then 
        --SetPlot("transferenabled")
        --return deviceshelter.main(cutscene) 
        --end
    --@param plot PLOT|PLOT.key?
    return deviceshelter.scenesrec(cutscene)
--end
end

function deviceshelter.confirmation(cutscene)
    deviceshelter.init(cutscene)
    local choice = cutscene:option([[
[noskip][color:red]Warning: Drive data may get corrupted..[color:reset]

===========================
DEVICE:\\DeviceUser1\\Management
===========================

Confirmation Successful.
Deactivating lockdown...
........................
........................
........................
........................

===========================
Complete. Press any button to 
complete procedure.
> _
]])
    --if choice == 0 then 
        --SetPlot("transferenabled")
        --return deviceshelter.main(cutscene) 
        --end
    --@param plot PLOT|PLOT.key?
    SetPlot("gateway_lockdown_off")
    love.audio.newSource(Assets.getMusicPath"DEVICE_OFF","static"):play()
    cutscene.funnytextbox:setText("[style:none][voice:none]Completing...")
    cutscene:wait(1)
    cutscene.funnytextbox:remove()
    cutscene:wait(Game.world:mapTransition(Game.world.map.id, Game.world.player.x, Game.world.player.y))
    Game:getQuest("gateway"):complete()
    return
--end
end
local credits_pages = {
[[
The Gateway: Experiment Logs
--------------------------
"DISCOVERY" Date: UNKNOWN
--------------------------
]];
[[
- A DISCOVERY HAS BEEN MADE. 
- ONE THAT MAY BRING US A GREATER HAND 
IN OUR EFFORTS.
]];
[[
- DARKNESS... A SUBSTANCE THAT BRINGS 
LIFE TO OBJECTS OTHERWISE CONSIDERED 
LIFELESS...
]];
[[
- THAT IS KNOWN, BUT IT MAY NOT BE 
AS SIMPLE AS IT SEEMS.
]];
[[
- DARKNESS IS NOT CREATED. 
- DARKNESS IS PRESENT EVERYWHERE. 
- ALWAYS.
]];
[[
- A WORLD OF PURE DARKNESS, ACCESSIBLE 
WITH THE CORRECT TECHNIQUE.
- I HAVE NAMED IT "THE ...
]];
[[
13 lines of data have been corrupted. 
7 were restored.
]];
}
function deviceshelter.credits(cutscene, pagenum)
    pagenum = pagenum or 1
    local text = (getSignalStatus())..([[


=========================================
DEVICE:\\DeviceUser1\\discovery.txt\\Page %d
=========================================

]]):format(pagenum, #credits_pages)
    text = text .. credits_pages[pagenum]
    if pagenum < #credits_pages then
        text = text .."\n[1:] Next page"
    end
    if pagenum > 1 then
        text = text .."\n[2:] Previous page"
    end
    local choice = cutscene:option(text..[[

[0:] Return to explorer.

===========================
Type in a number to make a
selection.
> _
]])
    if choice == 2 then
        return deviceshelter.credits(cutscene, math.max(pagenum - 1, 1))
    elseif choice == 1 then
        return deviceshelter.credits(cutscene, math.min(pagenum + 1, #credits_pages))
    end
    return deviceshelter.scenesrec(cutscene)
end

local credits_pages2 = {
[[
The Gateway: Experiment Logs
--------------------------
"Log_Archive_Classified"
--------------------------
]];
[[
- I HAVE NAMED IT "THE DEPTHS"
- A FASCINATING REALM, THAT EXISTS 
ALONGSIDE OUR OWN.
]];
[[
- CREATURES OF DREAMS ROAM FREE, 
THEIR HOME, "THE EVERGROVES."
]];
[[
- EXTENSIVE RESEARCH HAS CONCLUDED 
THAT THIS REALM SERVES AS A WEAK 
POINT BETWEEN WORLDS.
]];
[[
- MORE TESTS ARE REQUIRED, BUT WHAT
WAS ONCE A DREAM...
- MAY NOW BE POSSIBLE.
- CONTACTING DISTANT UNIVERSES...
]];
[[
- BUT . . .
- THERE HAVE BEEN, UNFORESEEN 
CONSEQUENCES TO MY ACTIONS...
]];
[[
- BOTH DARK AND LIGHT, SERVE AS FORCES 
OF NATURE.
- MY RESEARCH, IT HAS DISTURBED THEIR 
BALANCE.
]];
[[
- I HAVE BROKEN THE BARRIER BETWEEN WORLDS...
- AND THERE IS NO GOING BACK.
]];
[[
13 lines of data have been successfully
restored by internet archive.
]];
}

function deviceshelter.discoveryrec(cutscene, pagenum)
    pagenum = pagenum or 1
    local text = (getSignalStatus())..([[


=========================================
DEVICE:\\DeviceUser1\\archive.txt\\Page %d
=========================================

]]):format(pagenum, #credits_pages2)
    text = text .. credits_pages2[pagenum]
    if pagenum < #credits_pages2 then
        text = text .."\n[1:] Next page"
    end
    if pagenum > 1 then
        text = text .."\n[2:] Previous page"
    end
    local choice = cutscene:option(text..[[

[0:] Return to Device home.

===========================
Type in a number to make a
selection.
> _
]])
    if choice == 2 then
        return deviceshelter.discoveryrec(cutscene, math.max(pagenum - 1, 1))
    elseif choice == 1 then
        return deviceshelter.discoveryrec(cutscene, math.min(pagenum + 1, #credits_pages2))
    end
    return deviceshelter.main(cutscene)
end

return deviceshelter