local item, super = Class(HealItem, "voidcure")

function item:init()
    super.init(self)

    -- Display name
    self.name = "First-Aid Kit"
    -- Name displayed when used in battle (optional)
    self.use_name = "First-Aid Kit"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil
    -- Determines if it's a light world item.
    self.light = true
    -- Battle description
    self.effect = "Heals\n20HP\nto Team."
    -- Shop description
    self.shop = "Cures you\ninstantly."
    -- Menu description
    self.description = "A cure to your pain. +20HP to Team"
    -- Light world check text
    self.check = "Used for Gateway emergencies.[wait:5] +20HP to Team."
    -- Amount healed (HealItem variable)
    self.heal_amount = 20
    -- Amount this item heals for specific characters

    -- Default shop price (sell price is halved)
    self.price = 1000
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "battle"
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
        susie = "Awfully suspicious, Kris...",
        ralsei = ". . . this is a light world item.",
        noelle = "I feel more fresh, thanks Kris."
    }

end;
function item:onWorldUse()
    Game.world:showText("* You stared at the First-Aid Kit's manual.[wait:5] It seems it can only be used in battles.")
    return false
end

function item:onToss()
    Game.world:showText("* You tossed the First-Aid Kit on the ground.")
    return true
end
return item