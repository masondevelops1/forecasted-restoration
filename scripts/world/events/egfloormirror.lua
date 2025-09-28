---@class EGFloorMirror : FloorMirror
local EGFloorMirror, super = Class("floormirror")

function EGFloorMirror:transformActorPath(chara)
    local pathdirs = Utils.split(chara.actor.path, "/")
    local pathend = table.remove(pathdirs, #pathdirs)
    pathend = ({dark = "light", light = "dark", dusk = "light"})[pathend] or pathend
    table.insert(pathdirs, pathend)
    return table.concat(pathdirs, "/")
end

return EGFloorMirror