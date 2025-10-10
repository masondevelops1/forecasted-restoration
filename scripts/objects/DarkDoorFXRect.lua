---@class DarkDoorFXRect : Rectangle
---@overload fun(...) : DarkDoorFXRect
local DarkDoorFXRect, super = Class(Rectangle)

function DarkDoorFXRect:init(x, y, width, height)
    super.init(self, x, y, width, height)

    self:setColor(0, 0, 0)
    self.shadow_alpha = 0

    self.siner = 0
end

function DarkDoorFXRect:draw()
    local r,g,b,a = self:getDrawColor()

    self.shadow_alpha = Utils.approach(self.shadow_alpha, 1, 1.01 * DTMULT)
    self.siner = self.siner + 1*DTMULT

    --Size of bloom
    local lw_scale = 1
    
    --Bloom Speed
    local amt = math.sin(self.siner / 16) * 0.01
    love.graphics.setLineWidth(1)

    --Darkness intensity
    love.graphics.setColor(0x29/256, 0x29/256, 0x34/256, self.shadow_alpha * (amt + 0.2))

    for i = 1, 5 do
        love.graphics.rectangle("fill", 0, self.height, self.width, self.height * ((3 / i) + amt) * lw_scale)
    end

    --Outer Bloom
    local left_amount = amt * self.width * 38 * lw_scale
    local up_amount = amt * self.height * 36 * lw_scale
    love.graphics.rectangle("fill",
        -left_amount/2, -up_amount,
        self.width + left_amount, self.height + up_amount
    )
    --Inner Bloom
    left_amount = amt * self.width * 26 * lw_scale
    up_amount = amt * self.height * 24 * lw_scale
    love.graphics.rectangle("fill",
        -left_amount/2, -up_amount,
        self.width + left_amount, self.height + up_amount
    )

    love.graphics.setColor(r, g, b, a)
    super.draw(self)
end

return DarkDoorFXRect