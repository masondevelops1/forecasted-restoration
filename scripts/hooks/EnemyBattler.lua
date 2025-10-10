---@class EnemyBattler : EnemyBattler
local EnemyBattler, super = Utils.hookScript(EnemyBattler)

function EnemyBattler:init(...)
    super.init(self,...)
    self.acts[1].description = "Useless\nanalysis"
end

return EnemyBattler