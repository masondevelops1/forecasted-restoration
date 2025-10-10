local lib = {}
Registry.registerGlobal("Forecasted", lib)
Forecasted = lib

function Forecasted:isDepths()
    return Game and Game.world and Game.world.map and Game.world.map.data and Game.world.map.data.properties and Game.world.map.data.properties.depths
end

function Forecasted:isDusk()
    return Game and Game.world and Game.world.map and Game.world.map.data and Game.world.map.data.properties and Game.world.map.data.properties.dusk
end


return lib