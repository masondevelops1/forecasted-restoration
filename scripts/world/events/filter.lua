---@class Event.filter : Event
local event, super = Class(Event, "filter")

function event:init()
    super.init(self)
end

function event:onLoad()
    super.onLoad(self)
    
    local s1 = Sprite("backgrounds/sunoverlay1")
    s1.wrap_texture_x = true
    s1.wrap_texture_y = true
    s1.alpha = 0.5

    local s2 = Sprite("backgrounds/sunoverlay2")
    s2:setScale(2)
    s2.wrap_texture_x = true
    s2.wrap_texture_y = true
    s2.parallax_x = 0.9
    s2.parallax_y = 0.9
    s2.alpha = 0.55

    Game.world:addChild(s1)
    Game.world:addChild(s2)

    s1.layer = WORLD_LAYERS["below_ui"]
    s2.layer = WORLD_LAYERS["below_ui"]
end

function event:update()
    super.update(self)
end

return event
