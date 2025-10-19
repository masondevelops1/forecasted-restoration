local Fomnis, super = Class(Encounter)

function Fomnis:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Something stands in your way..?"

    -- Battle music ("battle" is rude buster)
    self.music = "mus_prebattle2"
    -- Enables the purple grid battle background
    self.background = false

    -- Add the dummy enemy to the encounter
    self:addEnemy("fomnis")
    self:addEnemy("fomnis")
    --- Uncomment this line to add another!
    --self:addEnemy("dummy")

    local bg = GonerBackground()

    bg:setLayer(BATTLE_LAYERS["bottom"])

    Game.battle:addChild(bg)

    self.transition_timer = 0
end

function Fomnis:update()
    super.update(self)
    Game.battle.money = 0

    self.transition_timer = self.transition_timer + DTMULT

    if self.transition_timer >= 30 then
        self.transition_timer = 30
    end
end

function Fomnis:onBattleEnd()
    Game.battle.money = 0
end

function Fomnis:drawBackground(fade)

    Draw.setColor(0, 0, 0, self.transition_timer/30)
    love.graphics.rectangle("fill", -8, -8, SCREEN_WIDTH+16, SCREEN_HEIGHT+16)
end

return Fomnis