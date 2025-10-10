local BattleBG, super = Class(Object)

function BattleBG:init()
    super.init(self)
    self.sprite = Sprite("objects/battle_bg", self.x, self.y)
    self.sprite:play(0.05, true)
    self:addChild(self.sprite)
    for _, v in ipairs(Game.battle.party) do
        v.layer = 2
    end

    Game.battle:getEnemyBattler("dummy").layer = 2
    for _, enemy in ipairs(Game.battle.enemies) do
        if enemy.id == "fomnis" then
            enemy.layer = 2
        end
    end

    self.sprite.layer = 1

    self:setOrigin(0.5)
    self.sprite:setOrigin(0.5)
    self.sprite:setScale(2)
end

return BattleBG