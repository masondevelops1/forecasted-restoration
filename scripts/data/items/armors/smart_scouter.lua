local item, super = Class(Item, "smart_scouter")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Depth Glasses"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "They're with\nyou in the dark."
    -- Menu description
    self.description = "An orange tinted lens and two halves of a frame.\nIt's white and purple."

    -- Default shop price (sell price is halved)
    self.price = 1000
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
        defense = 22,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Alertness"
    self.bonus_icon = "ui/menu/icon/exclamation"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        susie = true,
        kris = true,
        noelle = true,
    }

    -- Character reactions
    self.reactions = {
        berdly = "Not my style, Kris.",
        susie = "Maybe Noelle would like these, too!",
        ralsei = "Oh! Orange!",
        noelle = "(Reminds me of Susie...)",
    }
end

function item:convertToLightEquip(chara)
    return "light/bandage"
end

return item