local item, super = Class(Item, "gilded_halberd")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Gilded Halberd"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/halberd"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A gilded halberd fabricated in the depths\nof EARTH."

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
        attack = 0,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        berdly = true,
    }

    -- Character reactions
    self.reactions = {
        berdly = "Oh, going classy, are we, Kristopher? So be it!",
        susie = "THAT thing? Hell if I do.",
        ralsei = "Ummm... it's too heavy...",
        noelle = "(Why does this smell like fried chicken???)",
    }
end

return item