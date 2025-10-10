local Test, super = Class(Wave)

function Test:init()
    super.init(self)
    self.arena_2 = Arena(316, 166, {{0, 0}, {142, 0}, {142, 142}, {0, 142}})


    Game.battle:addChild(self.arena_2)

    --self.mask_top = ArenaMask(1, 0, 0, self.half_top) --ArenaMask(layer, x, y, arena)
    --self.mask_bottom = ArenaMask(1, 0, 0, self.half_bottom) --ArenaMask(layer, x, y, arena)
    
    --self:addChild(self.mask_top)
    --self:addChild(self.mask_bottom)

    self:setArenaPosition(500, 170)

    self.time = -1

end

function Test:onStart()

end

function Test:update()
    -- Code here gets called every frame

    super.update(self)
end

return Test