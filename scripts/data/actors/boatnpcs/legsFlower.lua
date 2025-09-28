local actor, super = Class("boatnpcs/legsDefault")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Legs (flower)"

    -- Path to this actor's sprites (defaults to "")
    self.path = "npcs/boatnpcs/legsFlower"

    self.offsets = {
        [""] = {0, -8}
    }
end

return actor