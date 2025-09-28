local Spark, super = Class(Object)

function Spark:init()
    super.init(self)
    self.sprite = Sprite("objects/bleed_spark", self.x, self.y)
    self.sprite:play(0.5, true)
    self:addChild(self.sprite)
    self.exists = true
    self.sprite.layer = BATTLE_LAYERS["above_arena"]

    self:setSize(self.sprite.width, self.sprite.height)

    self:setOrigin(0.5)

    self.collider = Hitbox(self, 2, 2, self.width-2, self.height-2)
end

function Spark:update()
    super.update(self)

    print(self.collider:collidesWith(Game.battle.soul))

    if self.collider:collidesWith(Game.battle.soul) then
        Assets.playSound("power")
        Game.battle.soul.bleed_time = Game.battle.soul.bleed_time - 1
        self:remove()
        self.sprite:remove()
        Game.battle.waves[1].finished = true
    end
end

return Spark