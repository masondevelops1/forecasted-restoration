local item, super = Class(HealItem, "flowercandy")

function item:init()
    super.init(self)

    -- Display name
    self.name = "FlowerCandy"
    -- Name displayed when used in battle (optional)
    self.use_name = "Flower Candy"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heals\nvaries"
    -- Shop description
    self.shop = "Tastes like\nsugar dirt."
    -- Menu description
    self.description = "A golden flower with\nsugar sprinkled on top. +250HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 250
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
        susie = "Looks like dirt, tastes like dirt.",
        ralsei = "It's the thought that counts...?",
        noelle = "Umm, is this sugar or dirt?"
    }

end;

return item