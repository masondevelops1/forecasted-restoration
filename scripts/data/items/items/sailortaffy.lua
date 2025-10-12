local item, super = Class(HealItem, "sailortaffy")

function item:init()
    super.init(self)

    -- Display name
    self.name = "SailorTaffy"
    -- Name displayed when used in battle (optional)
    self.use_name = "Sailor's Taffy"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Healing\nvaries"
    -- Shop description
    self.shop = "Made by\nCheron and his\nfriends."
    -- Menu description
    self.description = "Hand-crafted with passion\nand darkness. +150HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 150
    -- Amount this item heals for specific characters

    -- Default shop price (sell price is halved)
    self.price = 40
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "Thanks! I was hungry.",
        ralsei = "Aww, thanks, Kris!",
        noelle = "Umm, it's ok, Kris, I'll share..."
    }

    -- Here it is. The peak of humour. It doesn't get any better than this.
    self.notes = {
        {"* \"Shiver me timbers!\" ", "taffy-1"},
        {"* \"Looking like a million dubloons!\" ", "taffy-1"},
        {"* \"Aargh!\" ", "taffy-1"},
        {"* \"Never hornswaggle ye crew...\" ", "taffy-2"},
        {"* \"Let us chantey me hearties!\" ", "taffy-2"},
        {"* \"Yo Ho,[wait:5] Yo Ho!\" ", "taffy-2"},
        {"* \"Me parrot shall sing a song!\" ", "taffy-3"},
        {"* \"Walk the plank,[wait:5] Buccaneer!\" ", "taffy-3"},
        {"* \"No better ship in the seven seas...\" ", "taffy-3"},
        {"* \"Ye is a freshwater sailor!\" ", "taffy-4"},
        {"* \"Barnacles!\" ", "taffy-4"},
        {"* \"The seven seas only gave me this taffy and a pegleg...\" ", "taffy-4"},
        {"* \"Blimey mates!\" ", "taffy-5"},
        {"* \"I've seen it with me own eye...\" ", "taffy-5"},
        {"* \"Ye give me yer loot,[wait:5] or ye swimmin with the fish!\" ", "taffy-5"},
    }
end

function item:selectNote()
    local choice = Utils.pick(self.notes)
    return choice[1], choice[2]
end

function item:onWorldUse(target)
    super.onWorldUse(self, target)
    ---@diagnostic disable-next-line param-type-mismatch
    Game.world:startCutscene(function(cutscene)
        
        local rng = love.math.random(1, 15)
        local message, sound = self:selectNote()

        cutscene:text("* There's a note on the wrapper...")
        local old_volume = Game.world.music.volume
        Game.world.music:setVolume(0.3 * old_volume)
        Assets.playSound(sound)
        cutscene:text(message)
        Game.world.music:setVolume(old_volume)
    end)
end

function item:getBattleText(user, target)
    local message, sound = self:selectNote()
    local old_volume = Game.battle.music.volume
    Game.battle.music:setVolume(0.3 * old_volume)
    local src = Assets.playSound(sound)
    Game.battle.timer:after(src:getDuration("seconds"), function ()
        Game.battle.music:setVolume(old_volume)
        
    end)
    return super.getBattleText(self, user, target) .. "\n" .. message
end

return item