local TeevieMarquee, super = Class(Event)

function TeevieMarquee:init(data)
    super.init(self, data)
	
	properties = data.properties or nil
    self.text = properties["text"] or ""
	self.xpos = 0
	self.inc = 2
	self.rate = 1
	self.looppause = 0
	self.timer = 0
	self.font = Assets.getFont("marquee")
	self.deactivated = false
	local can_kill = Game:getFlag("can_kill", false)
    if Game.world.map.id:find("floortv/") and can_kill == true then
		self.deactivated = true
	end
end

function TeevieMarquee:update()
    super.update(self)
	if not self.deactivated then
		self.timer = self.timer + DTMULT
		if self.timer >= self.rate then
			self.xpos = self.xpos + self.inc
			self.timer = 0
		end
		
		if self.xpos >= self.font:getWidth(self.text) * 2 + self.looppause then
			self.xpos = -self.width
		end
	end
end

function TeevieMarquee:draw()
    super.draw(self)
	
	Draw.setColor(0,0,0,1)
	Draw.rectangle("fill", 0, 0, self.width, 14)
	Draw.setColor(1,1,1,1)
	if not self.deactivated then
		Draw.pushScissor()
		Draw.scissor(0, 0, self.width, 14)
		love.graphics.setFont(self.font)
		love.graphics.print(self.text, -Utils.round(self.xpos / 2) * 2, 2, 0, 2, 2)
		Draw.popScissor()
	end
end

return TeevieMarquee