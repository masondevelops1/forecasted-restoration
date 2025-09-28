---@class bumperzone: Map
local bumperzone, super = Class(Map)

function bumperzone:onEnter()
    Game.world.player.visible = false
    Game.world:startCutscene("bumper")
end

return bumperzone