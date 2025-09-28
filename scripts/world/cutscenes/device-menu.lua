---@type table<string, fun(cutscene:(WorldCutscene|{option:fun(self,txt,...):number, funnytextbox:Textbox}))>
local devicemenu = {}
local function getSignalStatus()
    if love.math.random() > 0.95 then
        return "New Signal Star new Star New Star City Signal City"
    end
    return (GCSN and "Connected to Gaster's Cool Social Network" or "No Signal...")
end
devicemenu.init = function(cutscene)
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
    cutscene:gotoCutscene("device-menu", "main")
end

devicemenu.main = function(cutscene, reason)
    devicemenu.init(cutscene)
    -- Nobody will find this easter egg.
    local choice = cutscene:option([[
%s

===========================
DEVICE:\\DeviceUser1
===========================

[1:] Scene Browser
[2:] Credits
[3:] MISSING
[0:] Power Off

===========================
Type in a number to make a
selection.
> _
]], reason == "invalid" and "Invalid selection." or getSignalStatus())
    if choice == 0 then
        love.audio.newSource(Assets.getMusicPath"DEVICE_OFF","static"):play()
        cutscene.funnytextbox:setText("[style:none][voice:none]Shutting down...")
        cutscene:wait(1)
        Kristal.returnToMenu()
        return coroutine.yield()
    elseif choice == 1 then
        return cutscene:gotoCutscene("device-menu", "scenes")
    elseif choice == 2 then
        return cutscene:gotoCutscene("device-menu", "credits")
    end

    return devicemenu.main(cutscene, "invalid")
end

function devicemenu.scenes(cutscene)
    devicemenu.init(cutscene)
    local choice = cutscene:option([[
[color:red]Warning: Everything is unfinished.[color:reset]

===========================
DEVICE:\\DeviceUser1\\Scenes
===========================

[1:] Song of the Sea
[2:] Hometown Night
[3:] The Beginning?
[4:] The Voyage
[5:] The Gateway
[0:] Return to menu

===========================
Type in a number to make a
selection.
> _
]])
    if choice == 0 then return devicemenu.main(cutscene) end
    local function startRoom(room, cutscene_id, party)
        cutscene.funnytextbox:setText("[style:none][voice:none]Preparing scene...")
        Game.state = "EXIT"
        Game.fader:fadeOut(function()
            local orig_map = Mod.info.map
            Mod.info.map = "basket"
            Game:load(nil,nil,true)
            if party then
                Game:setPartyMembers(unpack(party))
            end
            Game.world:loadMap(room)
            if cutscene_id then Game.world:startCutscene(cutscene_id) end
            Mod.info.map = orig_map
            coroutine.yield()
        end)
    end
    if choice == 1 then return startRoom("depthsRaft", nil, {"kris"}) end
    if choice == 2 then return startRoom("hometown/torielhouse/kris_room", "nightCutscenes.susie", {"kris"}) end
    if choice == 3 then return startRoom("hometown/school/school_lobby", nil, {"kris"}) end
    if choice == 4 then return startRoom("bumperzone") end
    if choice == 5 then
        Mod.post_bumper_room = "gateway/hallway"
        return startRoom("bumperzone", nil, {"kris", "susie", "noelle"})
    end

    return devicemenu.scenes(cutscene)
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
]];
}
function devicemenu.credits(cutscene, pagenum)
    pagenum = pagenum or 1
    local text = (getSignalStatus())..([[


===========================
DEVICE:\\DeviceUser1\\Credits\\Page%dof%d
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
        return devicemenu.credits(cutscene, math.max(pagenum - 1, 1))
    elseif choice == 1 then
        return devicemenu.credits(cutscene, math.min(pagenum + 1, #credits_pages))
    end
    return devicemenu.main(cutscene)
end

return devicemenu