local dummy, super = Class(EnemyBattler)

function dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Guard Model 2"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("realdummy")

    -- Enemy health
    self.max_health = 450
    self.health = 450
    -- Enemy attack (determines bullet damage)
    self.attack = 6
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- some things that tell me if it's ready to do the next cutscene
    self.hidden_mercy = 0
    self.hidden_mercy2 = 0

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "I only w-want to\nheeeeeelp...",
        "Waaaaaant tto\nj-j-o-o-oin our\nt-team?",
        "T-tomorrow means\nt-the s-surface...\nB-but when will it\nc-c-co-ome?",
        "M-Must...\nf-follow a-all\ninstructions...",
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 0\n* The second generation of Gateway Guards. It only wants to help."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The smell of home is in the air.",
        "* The fluff is leaking onto the floor.",
        "* The guard cannot help itself.\n* It must only help you.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The guard looks like it's\nabout to fall over."

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Help", "", {"noelle"})
end

function dummy:onAct(battler, name)
    if name == "Smile" then
        -- Act text (since it's a list, multiple textboxes)
        if self.hidden_mercy < 1 then
            Game.battle:startActCutscene("realdummy", "smile")
        else
            Game.battle:startActCutscene("realdummy", "smile2")
        end

    elseif name == "Help" then
        -- Loop through all enemies
        if self.hidden_mercy2 < 1 then
            Game.battle:startActCutscene("realdummy", "fluff")
        else
            Game.battle:startActCutscene("realdummy", "fluff2")
        end
        return
    elseif name == "Comfort" then
        -- Loop through all enemies
        if self.hidden_mercy >= 1 then
            Game.battle:startActCutscene("realdummy", "comfort")
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

function dummy:update()
    super.update(self)
end

return dummy