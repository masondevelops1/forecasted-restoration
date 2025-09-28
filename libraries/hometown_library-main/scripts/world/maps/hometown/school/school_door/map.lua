---@class Classroom: Map
local Classroom, super = Class("Map")

function Classroom:onEnter()
  local img1 = Game.world.map:getEvent("open_dark_door")
  img1.visible = false

  local img2 = Game.world.map:getTileLayer("tile2")
  img2.visible = false

  local img3 = Game.world.map:getTileLayer("tile3")
  img3.visible = false

  local img4 = Game.world.map:getTileLayer("shadow")
  img4.visible = false

  local obj6 = Game.world.map:getTileLayer("wall2")
  obj6.visible = false
end



return Classroom