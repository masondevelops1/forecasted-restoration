local actor, super = Class("boatnpcs/screenguy")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Screenguy (Happy)"
    
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "happy"
end

return actor