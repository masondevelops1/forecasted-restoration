local item, super = Class(Item, "gilded_halberd")

function item:init()
    super.init(self)

    -- Display name
    self.name = "GildedAxe"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/axe"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Made by the\nRoyal Family."
    -- Menu description
    self.description = "A gilded axe fabricated in the depths\nof EARTH."

    -- Default shop price (sell price is halved)
    self.price = 120
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 18,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        susie = true,
    }

    -- Character reactions
    self.reactions = {
        berdly = "Too heavy, Kris!",
        susie = "Still burning in my hands, cool!",
        ralsei = "Ummm... it's too heavy...",
        noelle = "(Why does this smell like fried electronics...?)",
    }
end

return item