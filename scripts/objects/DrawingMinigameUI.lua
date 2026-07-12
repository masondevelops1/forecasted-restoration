---@class DrawingMinigameCrayon: Sprite
local DrawingMinigameUI, super = Class(Object)

function DrawingMinigameUI:init()
    super.init(self,0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
    self:setParallax(0)
    self:setOrigin(0,0)
    self.done_collider = Hitbox(self,234-56,180-15,64,20)
    self.reset_collider = Hitbox(self,234-56,210-15,64,20)
    self.rotate_collider = Hitbox(self,40-56,173-15,52,52)
	self.done_highlight = false
	self.reset_highlight = false
	self.font = Assets.getFont("main", 16)
    self.rotate_indicator = Assets.getTexture("id_minigame/crayon_rotate_indicator")
	self.alpha = 0
end

function DrawingMinigameUI:update()
    super.update(self)
    local minigame = self.parent
	self.alpha = minigame.alpha
    if self.done_collider:collidesWith(minigame.cursor) then
		if minigame.active_fake then
			if not self.done_highlight then
				Assets.playSound("ui_move")
				self.done_highlight = true
			end
			if (Input.mousePressed(1) or Input.pressed("confirm")) then
				Assets.playSound("ui_select")
				minigame:finish()
			end
		else
			self.done_highlight = false
		end
    else
		self.done_highlight = false
	end
    if self.reset_collider:collidesWith(minigame.cursor) then
		if minigame.active_fake then
			if not self.reset_highlight then
				Assets.playSound("ui_move")
				self.reset_highlight = true
			end
			if (Input.mousePressed(1) or Input.pressed("confirm")) then
				minigame:reset()
			end
		else
			self.reset_highlight = false
		end
    else
		self.reset_highlight = false
	end
    if self.rotate_collider:collidesWith(minigame.cursor) then
		if minigame.active_fake then
			if (Input.mousePressed(1) or Input.pressed("confirm")) then
				minigame:changeCrayonSize()
				if minigame.size == 5 then
					self.rotate_collider = Hitbox(self,40-56,165-15,52,52)
				else
					self.rotate_collider = Hitbox(self,40-56,173-15,52,52)
				end
			end
		end
	end
end

function DrawingMinigameUI:draw()
    local minigame = self.parent
    love.graphics.push()
    super.draw(self)
    love.graphics.translate(-56,-15)
	love.graphics.setFont(self.font)
	Draw.setColor(1,1,1,self.alpha)
	Draw.draw(self.rotate_indicator, 45+35-10,194+5-6)
    if self.done_highlight then
		Draw.setColor(1,1,0,self.alpha)
	end
	love.graphics.rectangle("fill", 234-3, 180-3, 64+6, 20+6)
	Draw.setColor(0,0,0,self.alpha)
	love.graphics.rectangle("fill", 234, 180, 64, 20)
	Draw.setColor(1,1,1,self.alpha)
	love.graphics.printf("DONE", 234+1, 180+1, 64, "center")
    if self.reset_highlight then
		Draw.setColor(1,1,0,self.alpha)
	end
	love.graphics.rectangle("fill", 234-3, 210-3, 64+6, 20+6)
	Draw.setColor(0,0,0,self.alpha)
	love.graphics.rectangle("fill", 234, 210, 64, 20)
	Draw.setColor(1,1,1,self.alpha)
	love.graphics.printf("RESET", 234+1, 210+1, 64, "center")
    love.graphics.pop()
    super.draw(self)
    if DEBUG_RENDER and self.rotate_collider then
        self.rotate_collider:draw()
    end
end

return DrawingMinigameUI