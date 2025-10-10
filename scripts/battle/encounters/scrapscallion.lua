local Scrapscallion, super = Class(Encounter)

function Scrapscallion:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* A Scrapscallion scraps through!"

    -- Battle music ("battle" is rude buster)
    self.music = "crude buster"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the Scrapscallion enemy to the encounter
    self:addEnemy("scrapscallion", 510, 210)

    --- Uncomment this line to add another!
    --self:addEnemy("scrapscallion")
end

return Scrapscallion