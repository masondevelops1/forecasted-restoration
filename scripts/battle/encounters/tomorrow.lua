local Fomnis, super = Class(Encounter)

function Fomnis:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Tomorrow."

    self.music = "crude buster"

    -- Battle music ("battle" is rude buster)
    -- Enables the purple grid battle background

    -- Add the dummy enemy to the encounter
    self:addEnemy("sans")
    --- Uncomment this line to add another!
    --self:addEnemy("dummy")

    self.background = true
end

function Fomnis:update()
    super.update(self)
end

return Fomnis