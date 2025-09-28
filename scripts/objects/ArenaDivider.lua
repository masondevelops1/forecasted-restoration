local ArenaDivider, super = Class(Object)

function ArenaDivider:init()
    super.init(self)

    self.collider = Hitbox(self, 0, 0, 2, 200)
end

return ArenaDivider