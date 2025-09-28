---@class UIBox : Object
---@field skin UISkin
---@overload fun(...) : UIBox
local UIBox, super = Class(Object)

function UIBox:init(x, y, width, height, skin)
    super.init(self, x, y, width, height)
    self:setSkin(skin or Kristal.callEvent(KRISTAL_EVENT.getUISkin) or (Game:isLight() and "light" or "dark"))
    self.fill_color = {0,0,0}
end

function UIBox:setSkin(skin)
    self.skin = skin
    if type(self.skin) == "string" then
        self.skin = UISkinLib:createSkin(self.skin)
    end
    self.skin.parent = self
end

function UIBox:getBorder()
    return self.skin:getBorder()
end

function UIBox:getDebugRectangle()
    if not self.debug_rect then
        local bw, bh = self:getBorder()
        return {-bw, -bh, self.width + bw*2, self.height + bh*2}
    end
    return super.getDebugRectangle(self)
end

function UIBox:draw()
    self.skin:draw(self.width, self.height, {self:getDrawColor()}, self.fill_color)
end

return UIBox