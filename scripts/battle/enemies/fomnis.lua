local Omnice, super = Class(EnemyBattler)

function Omnice:init()
    super.init(self)

    -- Enemy name
    self.name = "Guard Model 3"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("fomnis")
    -- Enemy health
    self.max_health = 999
    self.health = 190
    -- Enemy attack (determines bullet damage)
    self.attack = 7
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    self.hidden_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "everyhead_throw"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "* Tomorrow means the\nsurface.",
        "* The Gateway will\nbe what saves\nus.",
        "* Must protect all\nof the Gateway...",
        "* Error: Shutdown\naccess denied."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT?? DF?? \n* Tomorrow means the surface."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* They're just fulfilling their purpose.",
        "* Their code seems to be glitching out.",
        "* They cannot look any other way. They cannot lie. They must defeat you.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* They cannot look any other way. They cannot lie. They must defeat you."

    -- Register act called "Smile"
    self:registerAct("Directive", "", {"susie"})
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Talk", "", {"susie"})
    self:registerAct("Comfort", "", {"ralsei"})
end

function Omnice:onAct(battler, name)
    if name == "Directive" then
        -- Act text (since it's a list, multiple textboxes)
        if self.hidden_mercy >= 1 then
            Game.battle:startActCutscene("everyman", "directive")
        else
            Game.battle:startActCutscene("everyman", "failed")
        end

    elseif name == "Talk" then
        -- Loop through all enemies
        if self.hidden_mercy < 1 then
            Game.battle:startActCutscene("everyman", "talk")
        else
            Game.battle:startActCutscene("everyman", "talk2")
        end
        return
    elseif name == "Comfort" then
        -- Loop through all enemies
        if self.hidden_mercy >= 1 then
            Game.battle:startActCutscene("everyman", "comfort")
            return
        else
            return "* You and Ralsei attempt to comfort ???\n[wait:10] * It seems ineffective."
        end
    elseif name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
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

function Omnice:update()
    super.update(self)
end

return Omnice