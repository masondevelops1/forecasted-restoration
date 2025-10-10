---@class Map.room1 : Map
local map, super = Class(Map, "room1")

function map:onEnter()
    self:getImageLayer("Image Layer 1").debug_select = false
    ---@type FunnySpriteThing
    local spr = FunnySpriteThing("backgrounds/special/message",226,414)
    self.world:spawnObject(spr,1)
    local resume
    resume = coroutine.wrap(function ()
        self.timer:after(1, resume)
        coroutine.yield()
        spr:slidePath("up", {
            after = resume,
            speed = 20
        })
        spr.physics.move_path.move_func = spr.move
        coroutine.yield()
        spr:slideTo(spr.x, spr.y + 110, 0.2, "in-quad", resume)
        coroutine.yield()
        local x,y = self:getMarker("fountainspawn")
        local pillar = self.world:spawnObject(FMPillar(x,y, spr))
        self.timer:afterCond(function () return pillar:isRemoved() end, resume)
        coroutine.yield()
        self.timer:after(1, resume)
        coroutine.yield()
        Game.state = "EXIT"
        Game.fader:fadeOut(resume)
        coroutine.yield()
        Kristal.loadGame(nil, true)
    end)
    resume()

    local txt = Text()
    txt.align = "center"
    txt:setScale(3,1)
    txt.width = (SCREEN_WIDTH/txt.scale_x)
    txt:setText("[style:dark]so retro")
    self.world:spawnObject(txt,2)
end

return map