local DrawingMinigameCrayonBox, super = Class(Object)

function DrawingMinigameCrayonBox:init()
    super.init(self,25,125,60,60)
    self.texture_inside = Assets.getFrames("id_minigame/crayon_box_inside")
    self.texture_outside = Assets.getFrames("id_minigame/crayon_box_outside")
    self.texture_crayons = Assets.getFrames("id_minigame/crayon")
    self.box_clock = 0
    self.crayons = {}
    local x,y = 27,17
    for i=1,8 do

        x, y = x + 9, y + 2
        local crayon = self:addChild(DrawingMinigameCrayon(i, x, y+30))
        table.insert(self.crayons, crayon)
    end
	self.slid_crayons = false
	self.alpha = 0
end

function DrawingMinigameCrayonBox:update()
    super.update(self)
    local minigame = self.parent
	self.alpha = minigame.alpha
	if minigame.active_fake then
		self.box_clock = self.box_clock + DT
		local frame = Utils.clamp(math.ceil(self.box_clock * 10), 0-3, 8-3)+1
		if not self.slid_crayons and frame > 5 then
			for index, crayon in ipairs(self.crayons) do
				crayon:slideTo(crayon.x,crayon.y-30,0.4)
			end
			self.slid_crayons = true
		end
	end
end

function DrawingMinigameCrayonBox:draw()
    local frame = Utils.clamp(math.ceil(self.box_clock * 10), 0-3, 8-3)+1
	Draw.setColor(1,1,1,self.alpha)
    if frame >= 4 then Draw.setColor(0.4,0.4,0.4,self.alpha) end
    love.graphics.push()
    -- love.graphics.translate(25, 130)
    self:drawBoxOutside(frame)
    Draw.setColor(1,1,1,self.alpha)
    super.draw(self)
    self:drawBoxInside(frame)
    love.graphics.pop()
end
function DrawingMinigameCrayonBox:drawBoxOutside(frame)
    Draw.draw(self.texture_outside[frame])
end
function DrawingMinigameCrayonBox:drawBoxInside(frame)
    Draw.draw(self.texture_inside[frame])
end

function DrawingMinigameCrayonBox:drawCrayons()
    love.graphics.push()
    love.graphics.translate(28, Utils.clampMap(self.box_clock, 0.5, 1, 30, 0) + 15)
    for index, crayon in ipairs(self.texture_crayons) do
        love.graphics.translate(8, 1.5)
        Draw.draw(crayon)
    end
    love.graphics.pop()
end

return DrawingMinigameCrayonBox