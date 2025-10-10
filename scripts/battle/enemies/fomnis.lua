local Omnice, super = Class(EnemyBattler)

function Omnice:init()
    super.init(self)

    -- Enemy name
    self.name = "???"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("fomnis")

    -- Enemy health
    self.max_health = 6666666666
    self.health = 6666666666
    -- Enemy attack (determines bullet damage)
    self.attack = 20
    -- Enemy defense (usually 0)
    self.defense = 6666666666
    -- Enemy reward
    self.money = 0

    self.dialogue_bubble = "blank"

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    self.hidden_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "everyhead_throw"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        ""
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT DF \n* It has no mouth and it must smile."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* ???",
        "* Something stands in your way..?",
        "* Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong Nothing is wrong ",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* It seems scared."

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Talk", "", {"susie"})
    self:registerAct("Comfort", "", {"ralsei"})
end

function Omnice:onAct(battler, name)
    if name == "Smile" then
        -- Act text (since it's a list, multiple textboxes)
        if self.hidden_mercy >= 2 then
            return {
                "* You smile.[wait:5]\n* It smiles back.",
            }
        else
            return {
                "* You smile.[wait:5]\n* It doesn't.",
            }
        end

    elseif name == "Talk" then
        -- Loop through all enemies
        if self.hidden_mercy < 1 then
            Game.battle:startActCutscene("everyman", "talk")
        else
            Game.battle:startActCutscene("everyman", "cry")
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
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
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