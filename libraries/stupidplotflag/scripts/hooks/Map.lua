---@class Map : Map
local Map, super = HookSystem.hookScript(Map)

---@param a number
---@param b number
---@param mode "gt"|"lt"
---@param inclusive boolean
local function compare(a, b, mode, inclusive)
    if mode == "gt" then
        a, b = b, a
    end
    if inclusive then
        return a <= b
    end
    return a < b
end

function Map:shouldLoadObject(data, layer)
    if not super.shouldLoadObject(self, data, layer) then return false end
    local plotmin, plotmax = -math.huge, math.huge
    local inclmin, inclmax = false, false
    local curplot = Game:getFlag("plot", 0)
    if data.properties.plotmin then
        local plotminstr
        inclmin, plotminstr = Utils.startsWith(data.properties.plotmin, "*")
        inclmin = not inclmin
        plotmin = PLOT[plotminstr] or tonumber(plotminstr) or plotmin
    end
    if data.properties.plotmax then
        local plotmaxstr
        inclmax, plotmaxstr = Utils.startsWith(data.properties.plotmax, "*")
        inclmax = not inclmax
        plotmax = PLOT[plotmaxstr] or tonumber(plotmaxstr) or plotmax
    end
    if not compare(curplot, plotmin, "gt", inclmin) then
        return false
    end
    if not compare(curplot, plotmax, "lt", inclmax) then
        return false
    end
    return true
end

return Map