local item, super = Class(Item, "flashdrive")

function item:init()
    super.init(self)

    -- Display name
    self.name = "AccessDrive"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "key"
    -- Item icon (for equipment)
    self.icon = nil
    -- Determines if it's a light world item.
    self.light = true
    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A tool used to store data.\nA [color:yellow]device[color:reset] could write data onto it..."
    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false
    -- Light world check text
    self.check = "A tool used to access data. A [color:yellow]device[color:reset] could use it..."
    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "world"
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
    self.reactions = {}

    
end

function item:onWorldUse()
    Game.world:startCutscene(function(cutscene)
        cutscene:text("* You looked at the FlashDrive in admiration.")      
    end)
end

function item:getDescription()
    local keycount = 1 -- Not 0 because room 105 doesn't have a corresponding flag
    for key, value in pairs(self.flags) do
        if value then
            keycount = keycount + 1
        end
    end
    return self.description:format(keycount)
end

return item