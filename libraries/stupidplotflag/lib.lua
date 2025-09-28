local lib = {}
Registry.registerGlobal("Plot", lib)
Plot = lib

---@param plot PLOT.key|PLOT
function Plot:isAfter(plot)
    local comp_plot = PLOT[plot] or plot
    return comp_plot < Game:getFlag("plot", 0)
end

---@param plot PLOT.key|PLOT
function Plot:isBefore(plot)
    local comp_plot = PLOT[plot] or plot
    return comp_plot > Game:getFlag("plot", 0)
end

---@return PLOT
---@return PLOT.key?
function Plot:get()
    if not Game.flags then return 0 end
    local plot = Game:getFlag("plot", 0)
    return plot, Utils.getKey(PLOT, plot)
end

function Plot:postDraw()
    if DEBUG_RENDER then
        self:drawDebug()
    end
end

function Plot:format()
    
    local plot, plotname = self:get()
    local plotstr = tostring(plot)
    if plotname and plotname ~= "initial" then
        plotstr = plotstr .. " ("..plotname..")"
    end
    return plotstr
end

function Plot:drawDebug()
    love.graphics.setFont(Assets.getFont("main_mono"))
    Draw.setColor(COLORS.red)
    love.graphics.print(self:format())
    Draw.setColor(COLORS.white)
end

---@param plot integer|PLOT.key|PLOT
function Plot:set(plot)
    local comp_plot = PLOT[plot] or plot
    Game:setFlag("plot", comp_plot)
end

---@param debug DebugSystem
function Plot:registerDebugOptions(debug)
    debug:registerMenu("plot", "Plot points")
    local plot_by_number = {}
    for key, value in pairs(PLOT) do
        plot_by_number[value] = key
    end
    for number, name in Utils.orderedPairs(plot_by_number) do
        debug:registerOption("plot",
            function()
                local str = ("%."..(Kristal.getLibConfig("qdplot", "digits") or 3).."d"):format(number)
                str = str .. ". "
                str = str .. name
                str = str .. (self:get() == number and " *" or "")
                return str
                
            end,
        "Set plot to "..number..".", function () self:set(number) end)
    end
    debug:registerOption("plot", "Back", "Go back to the previous menu.", function () debug:returnMenu() end)
    debug:registerOption("main", "Plot", function ()
        return "Set the story progress. (" .. self:get() .. ")"
    end, function ()
        debug:enterMenu("plot", 1)
    end)
end


---@param min number|PLOT|PLOT.key
---@param max number|PLOT|PLOT.key
---@param include_min boolean? Whether or not to return true if the plot is exactly at the minimum. Defaults to true.
---@param include_max boolean? Whether or not to return true if the plot is exactly at the maximum. Defaults to false.
function Plot:between(min, max, include_min, include_max)
    ---@cast a number|PLOT
    min = PLOT[min] or min
    ---@cast b number|PLOT
    max = PLOT[max] or max

    include_min = include_min ~= false

    local cur = self:get()

    if include_min and not (min <= cur) then
        return false
    end
    if not include_min and not (min < cur) then
        return false
    end
    if include_max and not (max >= cur) then
        return false
    end
    if not include_max and not (max > cur) then
        return false
    end
    return true
end


return lib
