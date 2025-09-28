local Scrapscallion, super = Class(EnemyBattler)

function Scrapscallion:init()
    super.init(self)

    -- Enemy name
    self.name = "Scrapscallion"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/Scrapscallion.lua)
    self:setActor("scrapscallion")

    -- Enemy health
    self.max_health = 1150
    self.health = 1150
    -- Enemy attack (determines bullet damage)
    self.attack = 15
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 20

    -- List of possible wave ids, randomly picked each turn
    print(#Game.battle.enemies)
    self.waves = {
        "scrapscallion/mechpress",
        "scrapscallion/pipeleak",
        "scrapscallion/boiler",
        "scrapscallion/anvil",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "[instant]BZ[stopinstant][wait:3][instant]ZZT![stopinstant]",
        "[instant]SCR[stopinstant][wait:3][instant]AP![stopinstant][wait:5] [instant]SCR[stopinstant][wait:3][instant]AP![stopinstant]\n[instant]BZ[stopinstant][wait:3][instant]ZZT![stopinstant]",
        "[instant]CL[stopinstant][wait:3][instant]INK![stopinstant][wait:5] [instant]CLA[stopinstant][wait:3][instant]NK![stopinstant]"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 15 DF 2\n* Made of a mysterious steel.[wait:5] Not to be confused with the dish."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Smog is filling the air.",
        "* Scrapscallion shifts nervously.",
        "* Smells like an oil spill.",
        "* Neutralizing the enemies...",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Scrapscallion's inner mechanisms don't sound too good."

    -- Register act called "Smile"
    self:registerAct("Tighten", "", nil, 15)
    self:registerAct("X-Tighten", "", {"susie", "kris"}, 35)
end

function Scrapscallion:onAct(battler, name)
    if name == "Tighten" then
        self:addMercy(10)
        self.dialogue_override = "[instant]BZ[stopinstant][wait:3][instant]ZZT![stopinstant]"

        battler:setActSprite("party/kris/dark/kris-act", 0, 0)
        return {
            "* You tighten loose screws on the Scrapscallion!",
            "* It tries to thank you but all you hear is \"[instant]BZ[stopinstant][wait:3][instant]ZZT![stopinstant]\"."
        }

    elseif name == "X-Tighten" then
        for _, enemy in ipairs(Game.battle.enemies) do
            enemy:addMercy(25)
        end
        self.dialogue_override = "... ^^"

        battler:setActSprite("party/kris/dark/kris-act", 0, 0)

        Game.battle:getPartyBattler("susie"):setActSprite("party/susie/dark/susie-act", 0, 0)

        return {
            "* You tighten loose screws on the Scrapscallion!",
            "* It seems the Scrapscallion just needed a quick fix!"
        }
    elseif name == "Standard" then
        if battler.chara.id == "susie" then
            Game.battle:startActCutscene("scrapscallion", "susie_punch")
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Scrapscallion