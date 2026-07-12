local item, super = Class(LightEquipItem, "voidcure")

function item:init()
    super.init(self)

    -- Display name
    self.name = "First-Aid Kit"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "It has cartoon characters on it."

    self.shop = "Heals 20HP.\nFor emergency\nuse only."
    -- Light world check text
    self.check = "Heals 20 HP\n* Use for emergencies only."
    
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    self.price = 20
    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
end

function item:onWorldUse()
    -- Heal 1 HP
    Game.world:heal(Game.party[1], 20, "* You applied first-aid to yourself.")
    --[[for i=1,#Game.party do
        Game.party[i]:heal(20)
    end]]
    
    -- Consume
    return true
end

--[[function item:onWorldUse()
    Game.world:showText("* You stared at the First-Aid Kit's manual.[wait:5] It seems it can only be used in battles.")
    return false
end]]

function item:onToss()
    Game.world:showText("* You tossed the First-Aid Kit on the ground.")
    return true
end

return item