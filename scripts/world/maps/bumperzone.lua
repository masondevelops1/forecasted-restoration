---@class bumperzone: Map
local bumperzone, super = Class(Map)

function bumperzone:onEnter()
    Game.world.player.visible = false
    for index, value in ipairs(Game.world.followers) do
        value.visible = false
    end
    Game.world:startCutscene("bumper")
end

return bumperzone