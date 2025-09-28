---@class Classroom: Map
local Classroom, super = Class("Map")

function Classroom:onEnter()
  local img1 = Game.world.map:getImageLayer("dooropen")
  img1.visible = false
  
end



return Classroom