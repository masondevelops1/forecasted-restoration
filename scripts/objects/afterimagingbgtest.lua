local AFT1, super = Class(Object)

function AFT1:init()
    super:init(self)

    

    local bg = Sprite("backgrounds/starsbig", 0, 0)
    bg:setScale(1)
    bg.alpha = 1
    bg.wrap_texture_x = true
    bg.wrap_texture_y = true
    bg.layer = BATTLE_LAYERS["bottom"]
    bg.physics.speed_x = -4
    --bg.physics.speed_y = -0.7
    self.layer = BATTLE_LAYERS["bottom"]
    --Game.world:addChild(AfterImage(bg, 1, 0.1))
    

    

    self.afim1 = Game.world.timer:every(0.5, function()
        Game.world:addChild(AfterImage(bg, 1, 0.1))
        --safim.graphics.grow = 0.10
    
    end)

    
    --self:addChild(self.background1)
    
    self:addChild(bg)
    

    self.layer = WORLD_LAYERS["above_events"] - 200


end

return AFT1