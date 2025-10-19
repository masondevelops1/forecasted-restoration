local Map, super = Class(Map)

function Map:onExit()
    Mod.lastMap = self.id
end

return Map