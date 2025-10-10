local Omnice, super = Class(EnemyBattler)

function Omnice:init()
    super.init(self)

    -- Enemy name
    self.name = "sans"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("sans")

    -- Enemy health
    self.max_health = 6666666666
    self.health = 6666666666
    -- Enemy attack (determines bullet damage)
    self.attack = 20
    -- Enemy defense (usually 0)
    self.defense = 6666666666
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    self.hidden_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "aiming_tomorrow"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "tomorrow."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 2 DF MORROW,[wait:5] Tomorrow.[wait:5] Tomorrow.[wait:5] Tomorrow."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Tomorrow",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* It seems scared."

    -- Register act called "Smile"
    self:registerAct("Tomorrow")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("TomorrowX", "", {"susie"})
end

function Omnice:onAct(battler, name)
    if name == "Tomorrow" then
        self:addMercy(-10)
        return {
            "* Tomorrow.",
        }

    elseif name == "TomorrowX" then
        self:addMercy(-10)
        Game.battle:startActCutscene("sans", "tomorrow")
        return
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Omnice:update()
    super.update(self)
end

return Omnice