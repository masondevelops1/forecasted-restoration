local AttackIndicator, super = Class(Object)

function AttackIndicator:init()
    super.init(self)
    self.sprite = Sprite("objects/attack_indicator", self.x, self.y)
    self.sprite:play(0.05, true)
    self:addChild(self.sprite)
    self.exists = true
    self.sprite.layer = BATTLE_LAYERS["above_arena"]

    self:setOrigin(0, 0.5)
    self.sprite:setOrigin(0, 0.5)

    Game.stage.timer:every(0.16, function ()
        if self.exists then
            Assets.playSound("alert")
        end
    end)

    Game.stage.timer:after(0.3, function ()
        self:remove()
        self.sprite:remove()
        self.exists = false
    end)
end

return AttackIndicator