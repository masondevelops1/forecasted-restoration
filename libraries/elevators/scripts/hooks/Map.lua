local Map, super = Class(Map)

function Map:onExit()
    --Mod.lastMap = self.id
    Game:setFlag("lastMap", self.id)
end

return Map