---@type table<string, fun(cutscene:(WorldCutscene|{option:fun(self,txt,...):number, funnytextbox:Textbox}))>
local devicegateway = {}
local function getSignalStatus()
    return (GCSN and "Connected to Gaster's Cool Social Network" or "No Signal...")
end
devicegateway.init = function(cutscene)
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
    cutscene:gotoCutscene("devicegateway", "main")
end

devicegateway.main = function(cutscene, reason)
    devicegateway.init(cutscene)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

===========================
DEVICE:\\DeviceUser1
===========================

[1:] Access_Platform
[2:] [color:red]CORRUPTED[color:reset]
[3:] [color:red]CORRUPTED[color:reset]
[0:] Power Off

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or reason == "nodrive" and "Access denied. Insert access drive." or getSignalStatus())
    if choice == 0 then
        love.audio.newSource(Assets.getMusicPath"DEVICE_OFF","static"):play()
        cutscene.funnytextbox:setText("[style:none][voice:none]Shutting down...")
        cutscene:wait(1)
        cutscene.funnytextbox:remove()
        return
    elseif choice == 1 then
        if Game.inventory:hasItem("flashdrive") then
            if Plot:isBefore("transferenabled") then
                return cutscene:gotoCutscene("devicegateway", "scenes")
            else
                return devicegateway.main(cutscene, "invalid")
            end
        else
            return devicegateway.main(cutscene, "nodrive")
        end

    return devicegateway.main(cutscene, "invalid")
end
end;

function devicegateway.scenes(cutscene)
    devicegateway.init(cutscene)
    local choice = cutscene:option([[
[color:red]Warning: Drive data may get corrupted...[color:reset]

===========================
DEVICE:\\DeviceUser1\\Access_Platform
===========================

Accessing data......
....................
....................
....................
Manual Confirmation Required.

===========================
Press any button to confirm 
access.
> _
]])
    return devicegateway.confirmation(cutscene) 
end

function devicegateway.confirmation(cutscene)
    devicegateway.init(cutscene)
    local choice = cutscene:option([[
[color:red]Warning: Drive data may get corrupted..[color:reset]

===========================
DEVICE:\\DeviceUser1\\Access_Platform
===========================

Confirmation Successful.
Activating Bridge: A....
........................
........................
........................
........................

===========================
Complete. Press any button to 
return to menu.
> _
]])
    --if choice == 0 then 
        --SetPlot("transferenabled")
        --return devicegateway.main(cutscene) 
        --end
    --@param plot PLOT|PLOT.key?
    SetPlot("transferenabled")
    return devicegateway.main(cutscene)
--end
end
local credits_pages = {
[[
Programming
  Fizz
  Hyperboid
  TheSkerch
]];
[[
Music
  Oftome
  Toby Fox
  Fizz
]];
[[
Sprite art
  melodots
  Fizz
  Hyperboid
]];
[[
Sprite art
  Oftome
  Godlikk
]];
[[
Kristal Libraries
  Arlee: Hometown
  Vitellary: Darkness
  DiamondBor/undertaled: Berdly
]];
[[
Other help
  skarph: Original device menu
  SylviBlossom: harbinger of silly mode
]];
[[
PLEASE tell me if I missed anyone.
- Hyperboid

Oh, and you, the player, I guess.
]];
}
function devicegateway.credits(cutscene, pagenum)
    pagenum = pagenum or 1
    local text = (getSignalStatus())..([[


===========================
DEVICE:\\DeviceUser1\\Staff_List\\Page%dof%d
===========================

]]):format(pagenum, #credits_pages)
    text = text .. credits_pages[pagenum]
    if pagenum < #credits_pages then
        text = text .."\n[1:] Next page"
    end
    if pagenum > 1 then
        text = text .."\n[2:] Previous page"
    end
    local choice = cutscene:option(text..[[

[0:] Return to menu

===========================
Type in a number to make a
selection.
> _
]])
    if choice == 2 then
        return devicegateway.credits(cutscene, math.max(pagenum - 1, 1))
    elseif choice == 1 then
        return devicegateway.credits(cutscene, math.min(pagenum + 1, #credits_pages))
    end
    return devicegateway.main(cutscene)
end

return devicegateway