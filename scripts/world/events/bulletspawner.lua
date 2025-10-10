---@class Event.bulletspawner : Event
local event, super = Class(Event)

---@param data table
function event:init(data)
    super.init(self, data)
    self:setSize(0)
    self.properties = data.properties or {}
    if self.properties.sprite then
        self.sprite = Sprite(self.properties.sprite)
        self.sprite:setOrigin(0.5)
        self.sprite.alpha = 0
        self.sprite:setScale(2)
        self:addChild(self.sprite)
    end
    self.timer = Timer()
    self:addChild(self.timer)
    self.custom_formations = {}
end

function event:getOption(key, default)
    if self.properties[key] ~= nil then return self.properties[key] end
    if self.world and self.world.map.data.properties["bulletspawner_"..key] ~= nil then return self.world.map.data.properties["bulletspawner_"..key] end
    return default
end

function event:onAdd(parent)
    super.onAdd(self,parent)
    if self:getOption("delay") then
        self.timer:after(self:getOption("delay"), function ()
            self:startPattern(self:getOption("formation", "straight"))
        end)
    else
        self:startPattern(self:getOption("formation", "straight"))
    end
end

function event:startPattern(formation)
    if self.custom_formations[formation] then
        self.custom_formations[formation](self)
        return
    elseif formation == "straight" then
        self.timer:every(self:getOption("freq") or 0.4, function ()
            local bullet = self:spawnBullet(self:getPosition())
            bullet.physics.direction = math.rad(self:getOption("direction", 0))
            bullet.physics.speed = self:getOption("speed", 10)
        end)
    -- You know, those alarm sounds in the song aren't for the meltdown.
    -- It's actually trying to say "Warning! Bad Game Design!"
    elseif formation == "random" then
        self.random_angle = Utils.random(math.pi*2)
        self.timer:every(self:getOption("freq") or 0.4, function ()
            local bullet = self:spawnBullet(self:getPosition())
            local bx, by = bullet:getPosition()
            local sx, sy = Game.world.soul:getPosition()
            self.random_angle = self.random_angle + Utils.random(math.pi/2, math.pi)
            bullet.physics.direction = self.random_angle
            bullet.physics.speed = self:getOption("speed", 10)
        end)
    elseif formation == "spiral" then
        self.spiral_count = 0
        self.timer:every(self:getOption("freq") or 0.4, function ()
            self:fireMultishot(self.spiral_count*.2, self:getOption("multi_count", 4))
            self.spiral_count = self.spiral_count + 1
        end)
    elseif formation == "bursts" then
        self.timer:everyInstant(self:getOption("freq", 1), function ()
            self.spiral_count = 0
            self.timer:everyInstant(self:getOption("subfreq", 0.1), function ()
                self:fireMultishot(self.spiral_count*.2, self:getOption("multi_count", 4))
                self.spiral_count = self.spiral_count + 1
            end, self:getOption("count", 4))
        end)
    end
end

function event:fireMultishot(offset, count)
    for i=0,count-1 do
        local bullet = self:spawnBullet(self:getPosition())
        bullet.physics.speed_y = 0
        bullet.physics.speed = self:getOption("speed", 10)
        bullet.physics.direction = ((offset)+(i/2))*math.pi
    end
end

---@overload fun(self: Event.bulletspawner, x:number, y:number): WorldBullet
---@overload fun(self: Event.bulletspawner): WorldBullet
---@return WorldBullet
function event:spawnBullet(...)
    if self.sprite then
        self.sprite.alpha = 1
        self.sprite:fadeTo(0, 0.3)
    end
    if select("#", ...) == 0 then
        return self:spawnBullet(self:getPosition())
    end
    return self.world:spawnBullet(self:getOption("type", "smallbullet"), ...)
end

return event