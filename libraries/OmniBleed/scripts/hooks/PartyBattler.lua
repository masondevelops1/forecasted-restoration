---@class PartyBattler : PartyBattler
local PartyBattler, super = Class("PartyBattler")

function PartyBattler:init(chara,x,y)
    super.init(self,chara,x,y)
    self.bleed = 0
    self.bleed_clock = 0
end

function PartyBattler:hurt(amount, exact, color, options)
    options = options or {}
    if self.bleed > 0 then
        if not exact then
            amount = self:calculateDamage(amount)
            if self.defending then
                amount = math.ceil(((options["all"] and 3 or 2) * amount) / (options["all"] and 4 or 3))
            end
            -- we don't have elements right now
            local element = 0
            amount = math.ceil((amount * self:getElementReduction(element)))
        end
        amount = amount + self.bleed
        exact = true
        self.bleed = 0
        local snd = Assets.stopAndPlaySound("impact")
        Game.stage.timer:after(1/10, function ()
            snd:stop()
        end)
    end
    super.hurt(self, amount, exact, color, options)
end

function PartyBattler:update()
    super.update(self)
    self.bleed_clock = self.bleed_clock + DT
    while self.bleed_clock > (1/30) do
        self.bleed_clock = self.bleed_clock - (1/30)
        -- TODO: Actual bleed condition
        if Game.battle:isBleeding() then
            self.bleed = self.bleed + 4
        elseif Game.battle.state == "DEFENDING" then
            self.bleed = self.bleed - 1
        else
            self.bleed = self.bleed - 4
        end
    end
    self.bleed = Utils.clamp(self.bleed, 0, self.chara:getHealth())
end

return PartyBattler