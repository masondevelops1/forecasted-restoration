---@class AdvancedGonerBackground: Object
---@overload fun(x: number?, y: number?) : AdvancedGonerBackground
local AdvancedGonerBackground, super = Class(Object)

function AdvancedGonerBackground:init(x, y)
    super.init(self,
        x or SCREEN_WIDTH/2, y or SCREEN_HEIGHT/2,
        -- specifically, LW dimensions
        SCREEN_WIDTH/2, SCREEN_HEIGHT/2
    )
    self:setScale(2)
    self:setOrigin(0, 0)
    self:setParallax(0, 0)

    self.piece_depth = 0

    self.debug_select = false
    self.container = self:addChild(Object())
    self.container.inherit_color = true
    self.timer = Timer()
    self.flash_timer = 0
    self.hue = 0
    self.saturation = 0
    self.stretch_speed = 0.005
    self.sprite = Assets.getTexture("IMAGE_DEPTH")
    self.timer:every(40/30, function()
        self.piece_depth = self.piece_depth - 0.001
        ---@type GonerBackgroundPiece
        local piece = self.container:addChild(GonerBackgroundPiece(self.sprite))
        piece:setColor(Utils.hsvToRgb(self.hue, self.saturation, 3))
        piece.alpha = 0.2 + self.saturation
        piece.debug_select = false
        piece.layer = self.piece_depth
        piece.stretch_speed = self.stretch_speed
    end)
    self.afterimage_timer = -math.huge
    self.container:addChild(self.timer)
    self.img_speed_y = 0
end

function AdvancedGonerBackground:onAdd(parent)
    super.onAdd(self, parent)
    if self.initialized then return end
    local old_dt = DT
    local old_dtmult = DTMULT
    DT = 20/30
    DTMULT = DT * 30
    for i=1, 10 do
        self:update()
    end
    DTMULT = old_dtmult
    DT = old_dt
    self.initialized = true
end

function AdvancedGonerBackground:onRemove(...)
    super.onRemove(self, ...)
end

-- It's like some king of... Hue cycles
function AdvancedGonerBackground:update()
    self.hue = (self.hue + (DT*self.container.timescale*.05))%1
    self.afterimage_timer = self.afterimage_timer + DT
    if self.afterimage_timer > 0.1 then
        self.afterimage_timer = 0
        if Game.world.player and self.saturation > 0 then
            ---@type AfterImage
            for _, chara in ipairs(Utils.merge({Game.world.player}, Game.world.followers)) do
                ---@cast chara Character
                local alpha = 1
                if chara:getFX("battle_alpha") then alpha = chara:getFX("battle_alpha")--[[@as AlphaFX]].alpha end
                local img = Game.world:spawnObject(AbsoluteAfterImage(chara, .5*alpha, 0.04*alpha))
                img.debug_select = false
                img.physics.speed_y = self.img_speed_y
                img:addFX(ColorMaskFX({Utils.hsvToRgb((self.hue+.5)%1, self.saturation, 1)}))
            end
        end
    end
    self.flash_timer = self.flash_timer - DT
    super.update(self)
end

function AdvancedGonerBackground:draw()
    local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.graphics.translate(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
    super.draw(self)
    Draw.popCanvas()
    Draw.setColor(self:getDrawColor())
    love.graphics.translate(-SCREEN_WIDTH/2, -SCREEN_HEIGHT/2)
    Draw.draw(canvas)
    if self.flash_timer > 0 then
        Draw.setColor(COLORS.white, self.flash_timer/.25)
        love.graphics.rectangle("fill", 0,0, SCREEN_WIDTH,SCREEN_HEIGHT)
        ---@type DarknessOverlay
        local dark = self.stage:getObjects(DarknessOverlay or {})[1]
        if dark then
            Draw.pushCanvas(dark.canvas, {keep_transform = true})
            love.graphics.rectangle("fill", 0,0, SCREEN_WIDTH,SCREEN_HEIGHT)
            Draw.popCanvas()
        end
    end
end

function AdvancedGonerBackground:applyProperties(properties)
    properties = properties or (self["data"] and self["data"].properties) or {}
    if properties.sprite then
        self.sprite = assert(Assets.getTexture(properties.sprite), "Missing sprite: "..properties.sprite)
    elseif properties.adaptive_mode then
        if properties.adaptive_mode == "boat" then
            local act = 3
            if Plot:isBefore("boat_act2_mapswitch") then
                act = 1
            elseif Plot:isBefore("boat_act3_mapswitch") then
                act = 2
            end
            if act <= 1 then
                self.sprite = Assets.getTexture("backgrounds/IMAGE_DEPTH_2")
            elseif act == 2 then
                self.sprite = Assets.getTexture("backgrounds/IMAGE_DEPTH_3")
            elseif act >= 3 then
                self.sprite = Assets.getTexture("backgrounds/IMAGE_DEPTH_4")
            end
        end
    end
end

function AdvancedGonerBackground:applyTransformTo(transform, ...)
    if self.no_reset_transform then
        return super.applyTransformTo(self, transform, ...)
    end
    transform:reset()
    transform:translate(SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
    transform:scale(2)
end

function AdvancedGonerBackground:flash()
    self.flash_timer = .25
end

return AdvancedGonerBackground