local actor, super = Class("boatnpcs/screenguy_neutral")

function actor:init()
    super.init(self)
    -- This actor inherits from screenguy_sad. This means that properties and methods not specified here will fallback to screenguy_sad's.
    -- Display name (optional)
    self.name = "Screenguy (Angry)"

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0, 0}

    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "angry"
end

return actor