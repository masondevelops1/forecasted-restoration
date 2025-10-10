---@class Bullet.mechpress : Bullet
local mechpress, super = Class(Bullet)

function mechpress:init(x,y)
    super.init(self, x, y, "bullets/scrapscallion/mechpress")
    self:setHitbox(0,0,self.width,self.height-4)
    self.destroy_on_hit = false
    self:setOrigin(0.5, 1)
end

return mechpress