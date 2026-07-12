---@class DrawingMinigame: Object
local DrawingMinigame, super = Class(Object)

function DrawingMinigame:init(sprite, savename, new_only)
    self.savename = savename
    local base_texture = Assets.getTexture(sprite)
	self.reset_texture = base_texture
    local ok, old_texture = pcall(love.graphics.newImage, "saves/"..savename.."_"..Game.save_id..".png")
    if ok and not new_only then base_texture = old_texture end
    super.init(self,0,0, base_texture:getWidth(), base_texture:getHeight())
    self.canvas = love.graphics.newCanvas(self:getSize())
    Draw.pushCanvas(self.canvas)
    Draw.draw(base_texture)
    Draw.popCanvas()
    self:setScale(2)
    self:setParallax(0)
    self:setOrigin(.5,0)
    self:setPosition(SCREEN_WIDTH/2, 30)
    self.cursor = self:addChild(Sprite("id_minigame/crayon_cursor"))
    self.cursor.layer = 5
    self.cursor:setHitbox(0,0,1,1)
    self.cursor:setOrigin(0,0)
    self.current_color = {62/255, 55/255, 207/255}
	self.current_crayon = 3
    self.crayon_indicator = self:addChild(Sprite("id_minigame/size_crayon_"..self.current_crayon))
	self.crayon_indicator:setPosition(45-56,194-15)
    self.crayon_indicator:setOriginExact(45,35)
    self.crayons = self:addChild(DrawingMinigameCrayonBox())
    self.minigameui = self:addChild(DrawingMinigameUI())
    self.size = 2
	self.alpha = 0
	self.active_fake = false
    --self:addChild(Text(Input.getText("menu")..": Finish",200,210)):setScale(.5)
end

function DrawingMinigame:draw()
	Draw.setColor(0,0,0,self.alpha*0.75)
    love.graphics.rectangle("fill", -56, -15, SCREEN_WIDTH, SCREEN_HEIGHT)
	Draw.setColor(1,1,1,self.alpha)
    Draw.draw(self.canvas)
    super.draw(self)
end

function DrawingMinigame:changeCrayonSize()
	if self.size == 2 then
		self.size = 5
	else
		self.size = 2
	end
end

function DrawingMinigame:reset()
	if self.active_fake then
		Assets.playSound("mail_unpin")
		Draw.pushCanvas(self.canvas)
		love.graphics.clear()
		Draw.draw(self.reset_texture)
		Draw.popCanvas()
	end
end

function DrawingMinigame:finish()
	if self.active_fake then
		self.canvas:newImageData():encode("png", "saves/"..self.savename.."_"..Game.save_id..".png")
		self.done = true
		self.active_fake = false
	end
end

function DrawingMinigame:update()
    local prev_cur_x, prev_cur_y = self.cursor.x, self.cursor.y
    if Input.usingGamepad() then
        if Utils.dist(0,0,Input.gamepad_left_x, Input.gamepad_left_y) > 0.3 then
            self.cursor:move(Input.gamepad_left_x, Input.gamepad_left_y, DT * 150)
        end
    else
        self.cursor:setScreenPos(Input.getMousePosition())
    end
    super.update(self)
	if self.size == 5 then
		self.crayon_indicator.rotation = Utils.lerp(self.crayon_indicator.rotation, math.rad(180), 0.25*DTMULT)
	else
		self.crayon_indicator.rotation = Utils.lerp(self.crayon_indicator.rotation, math.rad(0), 0.25*DTMULT)
	end
	self.crayon_indicator.alpha = self.alpha
	if not self.active_fake then
		return
	end
    Draw.pushCanvas(self.canvas)
    if Input.mouseDown(1) or Input.down("confirm") then
        local x,y = Input.getMousePosition()
        Draw.setColor(self.current_color)
        for i=0, 1, 1/math.floor(Utils.dist(self.cursor.x, self.cursor.y,prev_cur_x,prev_cur_y)+1) do
            --(self.cursor.x, self.cursor.y,prev_cur_x,prev_cur_y
            local x = Utils.lerp(self.cursor.x, prev_cur_x, i)
            local y = Utils.lerp(self.cursor.y, prev_cur_y, i)
            love.graphics.rectangle("fill", x-(self.size/2), y-(self.size/2), self.size, self.size)
        end
    end
    Draw.popCanvas()
    --[[if Input.pressed("menu") and not Input.ctrl() then
        self.canvas:newImageData():encode("png", "saves/"..self.savename.."_"..Game.save_id..".png")
        self.done = true
    end]]
end

return DrawingMinigame