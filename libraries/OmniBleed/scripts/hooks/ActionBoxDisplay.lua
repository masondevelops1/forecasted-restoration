---@class ActionBoxDisplay : ActionBoxDisplay
local ActionBoxDisplay, super = Class("ActionBoxDisplay")

function ActionBoxDisplay:draw()
    super.draw(self)
    local bleed = (self.actbox.battler.bleed / self.actbox.battler.chara:getStat("health")) * 76
    local bleed_dif = bleed - math.floor(bleed)

    local health = (self.actbox.battler.chara:getHealth() / self.actbox.battler.chara:getStat("health")) * 76
    health = math.ceil(health)
    if bleed > 0 then
        Draw.setColor(COLORS.yellow)
        love.graphics.rectangle("fill", 128+health, 22 - self.actbox.data_offset, -math.ceil(bleed), 9)
    end
end

return ActionBoxDisplay
