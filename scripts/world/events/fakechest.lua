--- A Treasure Chest that can contain either an Item or some money. \
--- `FakeChest` is an [`Event`](lua://Event.init) - naming an object `chest` on an `objects` layer in a map creates this object. \
--- See this object's Fields for the configurable properties on this object.
---
---@class FakeChest : Event
---
---@field sprite    Sprite
---@field solid     boolean
---
---@overload fun(...) : FakeChest
local FakeChest, super = Class(Event, "fakechest")

function FakeChest:init(x, y, properties)
    super.init(self, x, y)

    properties = properties or {}

    self:setOrigin(0.5, 0.5)
    self:setScale(2)

    self.sprite = Sprite("world/events/treasure_chest")
    self:addChild(self.sprite)

    self:setSize(self.sprite:getSize())
    self:setHitbox(0, 8, 20, 12)

    self.solid = true

    self.type = 2 --properties["type"] or 2
end

--- Handles making the chest remain appearing open when re-entering the room
function FakeChest:onAdd(parent)
    super.onAdd(self, parent)

    if self:getFlag("opened") then
        self.sprite:setFrame(2)
    end
end

--- Handles opening the chest and giving the player their items
function FakeChest:onInteract(player, dir)
    if self:getFlag("opened") then
        self.world:showText("* (The chest is empty.)")
    else
        Assets.playSound("locker")
        self.sprite:setFrame(2)
        self:setFlag("opened", true)

        --I'll add more variants to this later. - J.A.R.U.

        if self.type == 2 then -- watercooler variant
            Game.world:startCutscene(function(c)
                c:text("* (You opened the treasure chest...)")

                local watercooler = c:spawnNPC("watercooler", self.x + 8, self.y + 4)
                self:setLayer(watercooler.layer - 0.1)

                Assets.playSound("alert", nil, 0.8)
                watercooler.alert_icon = Sprite("effects/alert", watercooler.sprite.width/2 - 3, -2)
                watercooler.alert_icon:setOrigin(0.5, 1)
                watercooler.alert_icon.layer = 100
                watercooler:addChild(watercooler.alert_icon)
                Game.world.timer:after(20/30, function()
                    watercooler.alert_icon:remove()
                end)

                c:text("* (Inside the treasure chest,[wait:5] there was a [color:blue]WATERCOOLER[color:reset]!)")

                Assets.playSound("tensionhorn", 1, 1)
                c:wait(8/30)
                Assets.playSound("tensionhorn", 1, 1.1)
                c:wait(1)

                self:setLayer(self.layer)
                Game:encounter("watercooler", true, {watercooler})

                c:after(function()
                    watercooler:remove()
                end)
            end)
        end
    end

    return true
end

return FakeChest