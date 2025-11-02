local dummy, super = Class(Encounter)

function dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Guard Model 2, ready for your serviceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceiceice"

    -- Battle music ("battle" is rude buster)
    self.music = "enemy"
    -- Enables the purple grid battle background
    self.background = true
    
    -- Add the dummy enemy to the encounter
    self:addEnemy("dummy", 300, 210)
    --- Uncomment this line to add another!
    
end

-- yknow its a miracle lua allows you to do this
-- Utils.hook(Battle, "init", function(orig, self, ...)
--     orig(self,...)
--     self.background = GonerBackground2();
--     self:addChild(self.background)
--     self.background:setLayer(BATTLE_LAYERS["bottom"])
-- end)


function dummy:getPartyPosition(index)
    if index == 1 then
            return 320, 999
    else
            return 320, 999
    end
end


return dummy