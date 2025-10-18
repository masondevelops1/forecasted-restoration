local Warstalker, super = Class(EnemyBattler)

function Warstalker:init()
    super.init(self)

    -- Enemy name
    self.name = "???"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/Warstalker.lua)
    self:setActor("warstalker")


    self:setAnimation("talk")

    -- Enemy health
    self.max_health = 0
    self.health = 1500
    -- Enemy attack (determines bullet damage)
    self.attack = 7
    -- Enemy defense (usually 0)
    self.defense = -10
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = -20

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "dual_movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "[shake:20]gateway must be protected\n",
        "[shake:20]tomorrow means the\n                    surface",
        "[shake:20]is something wrong?",
        "[shake:20]finding nearest power line...\naccess denied.\naccess denied.\naccess denied."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT?? DF?? \n* You couldn't find the enemy."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* ??? is shattering.",
        "* Nothing is wrong but everything is wrong but nothing is wrong but everything is wrong but but nothing is wrong but everything is wrong but nothing is wrong but everything is wrong but",
        "* Smells like [MISSING SMELL.GSF]",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* ??? is about\n    s     &    )321gs\n            cat."

    -- Register act called "Smile"
    self:registerAct("Hit")
	if Game:getFlag("something_mercy_begs", 0) >= 3 then
		self:registerAct("Run", "", "all")
		self:registerAct("DoNothing")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    --self:registerAct("Tell Story", "", {"ralsei"})
end
function Warstalker:isXActionShort(battler)
    return true
end

function Warstalker:onShortAct(battler, name)
	if name == "Standard" then --X-Action
        if battler.chara.id == "susie" then
			local hp_check = 0
			for _,battler2 in ipairs(Game.battle.party) do
				if battler2.id ~= "susie" and battler2.chara:getHealth() < 1 then
					hp_check = hp_check + 1
				end
			end
			local text = "* Susie looks around."
			local chance = love.math.random(0,#Game.party)
			if chance >= 1 then
				if Game:hasPartyMember("kris") and Game:getPartyIndex("kris") == chance then
					text = "** Susie looks at Kris."
				end
				if Game:hasPartyMember("noelle") and Game:getPartyIndex("kris") == chance then
					text = "* Susie looks at Noelle."
				end
			end
            return text
        else
			local hp_check = 0
			for _,battler2 in ipairs(Game.battle.party) do
				if battler2.chara.id ~= battler.chara.id and battler2.chara:getHealth() < 1 then
					hp_check = hp_check + 1
				end
			end
			return "* "..battler.chara:getName().." looks around the room."
		end
	end
end

function Warstalker:onAct(battler, name)
    if name == "Hit" then
		Game:setFlag("something_mercy_begs", Game:getFlag("something_mercy_begs", 0) + 1)
		if Game:getFlag("something_mercy_begs", 0) == 1 then
            self.rage = 1
			return {
				"* You hit the ???\n* ... the ??? was only \nfilled with RAGE.",
			}
		elseif Game:getFlag("something_mercy_begs", 0) == 2 then
            self.rage = 5
			return {
				"* You hit the ???...\n* ... the ??? got extremely angry!",
			}
		elseif Game:getFlag("something_mercy_begs", 0) >= 3 then
            self.rage = 3
            self:registerAct("Run", "", "all")
		    self:registerAct("DoNothing")
			return "* You hit the ???...\n* You thought of different ACTs to use."
		end
	elseif name == "Run" then
        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.text = {
                "* The experiment seems to be at ease."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT ?? DF 0 \n* It's ready to be put to rest."
        end
        return "* You ran from the ???...\n* It remembered who it once was."
    elseif name == "DoNothing" then
        return "* You did nothing... it wasn't the best choice."
    elseif name == "Standard" then
        return self:onShortAct(battler, name)
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end
end

return Warstalker