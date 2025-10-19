local goner1, super = Class(Encounter)

function goner1:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* That can't be good, can it?"

    -- Battle music ("battle" is rude buster)
    self.music = "enemy"
    -- Enables the purple grid battle background
    self.background = true
    
    -- Add the dummy enemy to the encounter
    self:addEnemy("goner1", 300, 210)
    --- Uncomment this line to add another!
    
end

-- yknow its a miracle lua allows you to do this
-- Utils.hook(Battle, "init", function(orig, self, ...)
--     orig(self,...)
--     self.background = GonerBackground2();
--     self:addChild(self.background)
--     self.background:setLayer(BATTLE_LAYERS["bottom"])
-- end)


function goner1:getPartyPosition(index)
    if index == 1 then
            return 320, 999
    else
            return 320, 999
    end
end

function goner1:onBattleEnd()
    Game:setBorder("shelter", 3)  
end


return goner1