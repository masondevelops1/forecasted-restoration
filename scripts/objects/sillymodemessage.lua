-- SillyModeMessage and original idea made by SylviBlossom

local SillyModeMessage, super = Class(Object, "SillyModeMessage")

function SillyModeMessage:init()
    super.init(self, x, y)

    self.layer = 1000000

    self.text = Text("SILLY MODE ENABLED", 0, 60, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, {font = "main_mono", style = "dark", align = "center"})
    self.text:setScale(2)
    self.text.layer = -1
    self:addChild(self.text)

    self.confetti = {}
    for i = 1, 30 do
        local confetti = Sprite("player/heart_shard", Utils.random(-40, SCREEN_WIDTH + 40), -40)
        local colors = {{1, 0.5, 0.5}, {0.5, 1, 0.5}, {0.5, 0.5, 1}, {1, 1, 0.5}}
        confetti:setColor(Utils.pick(colors))
        confetti:play(4/30, true)
        confetti:setScale(2)
        confetti.physics.gravity = 0.15
        confetti.physics.speed_y = Utils.random(-0.5, 5)
        confetti.physics.speed_x = Utils.random(-0.5, 0.5)
        self:addChild(confetti)
        table.insert(self.confetti, confetti)
    end

    self.timer = 0
end

function SillyModeMessage:update()
    self.timer = self.timer + DT

    if self.timer >= 3 then
        self.text.alpha = Utils.approach(self.text.alpha, 0, DT)
        for _,confetti in ipairs(self.confetti) do
            confetti.alpha = Utils.approach(confetti.alpha, 0, DT)
        end
    end
    if self.timer >= 4 then
        self:remove()
        return
    end

    super.update(self)
end

return SillyModeMessage