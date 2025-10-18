local Watercooler, super = Class(EnemyBattler)

function Watercooler:init()
    super.init(self)

    -- Enemy name
    self.name = "Watercooler"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("watercooler")

    -- Enemy health
    self.max_health = 1879
    self.health = 1879
    -- Enemy attack (determines bullet damage)
    self.attack = 8
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 200

    self.experience = 10

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 8

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "The water was confirmed to be \n[color:blue]cool[color:reset]."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The watercooler shows no mercy.",
        "* The watercooler doesn't do \nanything in particular.",
        "* The watercooler leaves an icy \nsilence.",
		"* The watercooler cools water, \ncoolly.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The watercooler looks like it needs a refill."
	self.tired_text = "* The watercooler's bubbles rest on the surface."
	self.spareable_text = "* The watercooler's water blushes \na cranberry pink."
	
    -- Register act called "Smile"
    self:registerAct("BegForMercy")
	if Game:getFlag("watercooler_mercy_begs", 0) >= 1 then
		self:registerAct("ActCool", "", "all")
		self:registerAct("Flirt")
	end

    self.killable = true
	
	self.last_text = "* A strong aura emanates from the Watercooler."
end

function Watercooler:isXActionShort(battler)
    return true
end

function Watercooler:onShortAct(battler, name)
	if name == "Standard" then --X-Action
        if battler.chara.id == "ralsei" then
			local hp_check = 0
			for _,battler2 in ipairs(Game.battle.party) do
				if battler2.chara.id ~= "ralsei" and battler2.chara:getHealth() < 1 then
					hp_check = hp_check + 1
				end
			end
			if hp_check >= #Game.battle.party then
				self:addMercy(10)
			else
				self:addMercy(6)
			end
			local text = "* Ralsei absorbs trace calcium!"
			local chance = love.math.random(1,3)
			if chance == 2 then
				if Game:hasPartyMember("susie") then
					text = "* Ralsei cleans Susie's spill!!"
				else
					chance = Utils.pick({1,3})
				end
			end
			if chance == 3 then
				if #Game.party > 1 then
					text = "* Ralsei labels everyone's cups!!"
				else
					text = "* Ralsei labels his cup!!"
				end
			end
            return text
        elseif battler.chara.id == "susie" then
			local hp_check = 0
			for _,battler2 in ipairs(Game.battle.party) do
				if battler2.id ~= "susie" and battler2.chara:getHealth() < 1 then
					hp_check = hp_check + 1
				end
			end
			if hp_check >= #Game.battle.party then
				self:addMercy(10)
			else
				self:addMercy(6)
			end
			local text = "* Susie face-crushes a cup!!"
			local chance = love.math.random(0,#Game.party)
			if chance >= 1 then
				if Game:hasPartyMember("kris") and Game:getPartyIndex("kris") == chance then
					text = "** Susie puts cups on Kris's eyes!"
				end
				if Game:hasPartyMember("ralsei") and Game:getPartyIndex("kris") == chance then
					text = "* Susie puts cups on Ralsei!"
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
			if hp_check >= #Game.battle.party then
				self:addMercy(10)
			else
				self:addMercy(6)
			end
			return "* "..battler.chara:getName().." grabs a cup of water!!"
		end
	end
end

function Watercooler:onAct(battler, name)
	if name == "Check" then
		self:onCheck(battler)
		return "* You CHECKed the watercooler...\n* The water was confirmed to be \n[color:blue]cool[color:reset]."
    elseif name == "BegForMercy" then
		Game:setFlag("watercooler_mercy_begs", Game:getFlag("watercooler_mercy_begs", 0) + 1)
		if Game:getFlag("watercooler_mercy_begs", 0) == 1 then
			self:registerAct("ActCool", "", "all")
			self:registerAct("Flirt")
			return {
				"* You begged for mercy...\n* ... but the watercooler showed \nnone.",
				"* You thought of some better, \ndifferent ACTs to try next, \ninstead."
			}
		elseif Game:getFlag("watercooler_mercy_begs", 0) == 2 then
			return {
				"* You begged for mercy...\n* ... but the watercooler showed \nnone.",
				"* This is probably because your \nNAME isn't YELLOW."
			}
		elseif Game:getFlag("watercooler_mercy_begs", 0) >= 3 then
			return "* You begged for mercy...\n* This doesn't do anything."
		end
	elseif name == "ActCool" then
		Game.battle:startActCutscene("watercooler", "actcool")
    elseif name == "Flirt" then
		Game:setFlag("watercooler_flirted", true)
		Game.battle:startActCutscene("watercooler", "flirt")
    elseif name == "Standard" then
        return self:onShortAct(battler, name)
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Watercooler:getEnemyDialogue()
	if love.math.random(1,2) == 1 then
		return "Buble"
	else
		return "B"..Utils.pick({"a", "e", "i", "o", "u", "u", "oo"}).."b"..Utils.pick({"i", "l"}).."e"
	end
end

function Watercooler:getNextWaves()
	if Game.battle.turn_count > 1 and Game.battle.turn_count % 2 == 0 then
		return {"watercooler/rain_harder_even"}
	elseif Game.battle.turn_count > 1 then
		return {"watercooler/rain_harder_odd"}
	else
		return {"watercooler/rain"}
	end
end

function Watercooler:getEncounterText()
    if self.low_health_text and self.health <= (self.max_health * self.low_health_percentage) then
        return self.low_health_text

    elseif self.tired_text and self.tired then
        return self.tired_text

    elseif self.spareable_text and self:canSpare() then
        return self.spareable_text
    end
	if love.math.random(0, 100) < 3 then
		return "* Smells like the faucet."
	else
		if love.math.random(0, 4) == 4 then
			return self.last_text
		else
			local text = super.getEncounterText(self)
			self.last_text = text
			return text
		end
	end
end

return Watercooler