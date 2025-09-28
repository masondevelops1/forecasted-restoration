---@class Event.rain : Object
local event, super = Class(Object, "rain")


---@class Event.rain.particle
---@field x number
---@field y number
---@field time number


function event:init(data)
    super.init(self)
    local properties = data and data.properties or {}
    self:setColor(Utils.hexToRgb("#ff00aa"))
    self.alpha = properties.alpha or 0.2
    self.timer = self:addChild(Timer())
    self.timer:script(function (wait)
        while true do
            wait(4)
            if Mod.shared_gonerbg and Mod.shared_gonerbg.parent then
                Mod.shared_gonerbg:flash()
                wait(0.2)
                Mod.shared_gonerbg:flash()
            end
            wait(6)
            if Game.stage:getObjects(PongMinigame or {}) then
                wait(30)
            end
        end
    end)
    -- self:setParallax(0) -- Made redundant by custom applyTransformTo

    ---@type Event.rain.particle[]
    self.rain_particles = {}
    self.rain_spawn_timer = 0
    -- Wouldn't want the rain to throw off your RNG manip!
    self.random = love.math.newRandomGenerator()
    self.density = properties.density or 8
    for i=0,1,DT do
        self:update()
    end
end

function event:update()
    super.update(self)
    self.rain_spawn_timer = self.rain_spawn_timer - (DTMULT*self.density)
    while self.rain_spawn_timer < 0 do
        self.rain_spawn_timer = self.rain_spawn_timer + (1/8)
        table.insert(self.rain_particles, {
            x = Utils.floor(self.random:random(-SCREEN_WIDTH, SCREEN_WIDTH), 1),
            y = 0,
            time = 0,
        })
    end
    local rain_to_remove = {}
    for _, rain in ipairs(self.rain_particles) do
        rain.time = rain.time + DTMULT
        if rain.time > 60 then
            table.insert(rain_to_remove, rain)
        end
    end
    for _, remove in ipairs(rain_to_remove) do
        Utils.removeFromTable(self.rain_particles, remove)
    end
end

function event:draw()
    super.draw(self)
    for _, rain in ipairs(self.rain_particles) do
        local x, y = rain.x, Utils.round(rain.y, 20)
        x = x + Utils.floor(rain.time * 20, 20)
        y = y + Utils.floor(rain.time * 20, 20)
        Draw.setColor(self:getDrawColor())
        love.graphics.line(x,y,x-20,y-20)
    end
end

function event:applyTransformTo(transform)
    transform:reset()
    super.applyTransformTo(self, transform)
end

return event