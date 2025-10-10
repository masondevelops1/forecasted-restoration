local item, super = Class(Item, "shoppinglist")

function item:init()
    super.init(self)

    -- Display name
    self.name = "ShoppingList"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "key"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = " "

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

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
    ---@diagnostic disable-next-line param-type-mismatch
    Game.world:startCutscene(function(cutscene)
        local my_sprite_object = Sprite("objects/shoppinglist")
        Game.world:spawnObject(my_sprite_object)
        my_sprite_object:setScale(2)
        my_sprite_object:setLayer(WORLD_LAYERS["top"])
        my_sprite_object:setParallax(0)
        my_sprite_object.x = 210
        my_sprite_object.y = 100
        Assets.playSound("listopen")
        cutscene:wait(function() return Input.pressed("cancel") end)
        my_sprite_object:remove()
        Assets.playSound("listclose")
    end)
end

return item