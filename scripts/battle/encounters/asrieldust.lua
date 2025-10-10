local AsrielDust, super = Class(Encounter)

function AsrielDust:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Smells like cinnamon. And maybe also sexy dragons."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("asrieldust")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
end

return AsrielDust