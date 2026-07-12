local actor, super = Class(Actor, "shopkeepers/gonerShopActor")

function actor:init()
    super.init(self)

    self.name = "???"

    self.width = 56
    self.height = 49

    self.path = "shopkeepers/gonerShopActor"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", function(sprite, wait)
            while true do
                sprite:setFrame(1)
                wait(3)
                for i=2,12 do
                    sprite:setFrame(i)
                    wait(3/30)
                end
            end
        end}
    }

    self.talk_sprites = {
        ["idle"] = {0, 0},
    }

    self.offsets = {
        ["idle"] = {0, 0},
    }
end

return actor