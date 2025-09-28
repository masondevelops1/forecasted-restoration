---@class Encounter.omnis_boss : Encounter
local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The royal scientist's boyfriend."

    -- Battle music ("battle" is rude buster)
    self.music = "omnis battle theme"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("omnis_boss", 551, 268)

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")

    if Game.world.map.id ~= "uhh whatever the id of the omnis fight room is (PLEASE CHANGE THIS AND NOT THE MAP ITSELF IN FACT HERE'S SOME SPECIAL CHARACTERS SO YOU LITERALLY HAVE TO \\ \" ><;: )" then
        local bg = Sprite("objects/omnis_battle_bg_firetomb_route",0,-80)
        bg:setScale(2)
        bg.layer = BATTLE_LAYERS["bottom"] + 1
        bg.debug_select = false
        Game.battle:addChild(bg)
    end
    self.no_end_message = true
end

--[[function Dummy:createSoul(x, y)
    return bleed_soul(x, y)
end]]--

function Dummy:getPartyPosition(index)
    local x, y = 0, 0
    if index == 1 then
        x, y = 100, 215
    elseif index == 2 then
        x, y = 133, 263
    elseif index == 3 then
        x, y = 102, 320
    end
    y = y - 30

    return x, y


end

return Dummy