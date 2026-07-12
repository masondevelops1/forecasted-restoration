---@class Event.filter : Event
local event, super = Class(Event, "filter")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.fx = self:createFX(properties)
    self.fx.parent = self
    if data.shape ~= "point" then
        self:addFX(MaskFX(self))
    end
end

function event:drawMask()
    if self.collider then
        self.collider:drawFill()
    else
        love.graphics.rectangle("fill", 0,0,self:getSize())
    end
end

function event:update()
    super.update(self)
    if self.fx then
        self.fx:update()
    end
end

--- *Override* Returns an instance of the desired DrawFX, depending on the properties.
---@return DrawFX?
function event:createFX(properties)
    do
        local fx = super.createFX(self, properties)
        if fx then return fx end
    end
    local fxtype = (properties.type or "night"):lower()
    if fxtype == "night" then
        return ShaderFX("thefreakngnightshader")
    end
end

function event:fullDraw(...)
    self.main_canvas = love.graphics.getCanvas() -- Usually SCREEN_CANVAS, but not always.
    super.fullDraw(self)
end

function event:draw()
    if not (self.fx and self.fx:isActive()) then
        return super.draw(self)
    end
    love.graphics.push()
    Draw.pushCanvasLocks()
    love.graphics.origin()
    local c = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    Draw.drawCanvas(self.main_canvas)
    Draw.popCanvas(true)
    love.graphics.clear(0, 0, 0, 1)
    self.fx:draw(c)
    Draw.popCanvasLocks()
    love.graphics.pop()
    super.draw(self)
end

function event:onLoad()
    super.onLoad(self)
    
    --[[local s1 = Sprite("backgrounds/sunoverlay1")
    s1.color = {.5,.5,.5}
    s1.wrap_texture_x = true
    s1.wrap_texture_y = true
    s1.alpha = 0.7]]

    local s2 = Sprite("backgrounds/sunoverlay2")
    s2:setScale(2)
    s2.color = {.5,.5,.5}
    s2.wrap_texture_x = true
    s2.wrap_texture_y = true
    s2.parallax_x = 0.9
    s2.parallax_y = 0.9
    s2.alpha = 0.33

    Game.world:addChild(s2)

    s2.layer = WORLD_LAYERS["below_ui"]
end

return event
