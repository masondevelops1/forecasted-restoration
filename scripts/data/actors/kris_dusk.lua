local actor, super = Class("kris", "kris_dusk")

function actor:init()
    super.init(self)
    -- Path to this actor's sprites (defaults to "")
    self.path = "party/kris/dusk"

    
    -- Table of sprite offsets (indexed by sprite name)
    Utils.merge(self.offsets, {
        -- Movement offsets
        ["walk/left"] = {-5, -1},
        ["walk/right"] = {-5, -1},
        ["walk/up"] = {-5, -2},
        ["walk/down"] = {-3, -1},
    })
end

return actor