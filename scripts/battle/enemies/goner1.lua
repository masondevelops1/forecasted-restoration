local goner1, super = Class(EnemyBattler)

function goner1:init()
    super.init(self)

    -- Enemy name
    self.name = "Guard Model 1"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("goner1")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 5
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "thestars/starcircle",
        "thestars/starfade",
        "thestars/starsides"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "..."
    }
    --very hidden indeed
    self.hidden_mercy = 0

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 6 DF 0\n* You're not sure why, but...\n* It's radiating something."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* It appears to be in pain.",
        "* Is that a gash on it's face?",
        "* It's cold in here.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The Guard looks like it's\nglitching out."

    -- Register act called "Smile"
    self:registerAct("Cry")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Comfort", "", {"noelle", "susie"})
end

function goner1:onAct(battler, name)
    if name == "Cry" then
        -- Loop through all enemies
        if self.hidden_mercy < 1 then
            Game.battle:startActCutscene("goner1", "cry")
        else
            return "* You,[wait:5] Noelle,[wait:5] and Susie attempt to comfort the Guard.\n[wait:10]* The Guard seems unaffected."
        end
        return
    elseif name == "Comfort" then
        -- Loop through all enemies
        if self.hidden_mercy >= 1 then
            Game.battle:startActCutscene("goner1", "comfort")
        else
            return "* You,[wait:5] Noelle,[wait:5] and Susie attempt to comfort the Guard.\n[wait:10]* The Guard seems unaffected."
        end
    elseif name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The Guard spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            return "* Susie stared at the Gateway Guard."
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." stared at the\nGateway Guard."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function goner1:update()
    super.update(self)
end
return goner1