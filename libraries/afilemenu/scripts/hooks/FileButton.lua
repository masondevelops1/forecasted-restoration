local FileButton, super = Class(FileButton)

function FileButton:getDrawColor()
    local copy = self.color[3] < 0.7 -- TODO: detect better
    local delete = Utils.equal(self.color, {1, 0, 0})
    if delete then
        return Utils.unpackColor{1,0,0}
    end
    if copy then return PALETTE["filemenu_copy"] end
    if self.selected then
        return PALETTE["filemenu_selected"]
    end
    return PALETTE["filemenu_deselected"]
    -- return Utils.unpackColor{ 0, 0.5, 0 }
    -- return super.super.getDrawColor(self)
end

function FileButton:drawCoolRectangle(x, y, w, h)
    if Game.world.map.menustyle == "DEVICE" then
        love.graphics.setLineWidth(1)
        love.graphics.setLineStyle("rough")
        -- Set the color
        Draw.setColor(self:getDrawColor())
        love.graphics.rectangle("line", x, y, w, h)
    else
        super.drawCoolRectangle(self, x, y, w, h)
    end
end

function FileButton:draw()
    -- Draw the transparent background
    Draw.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)

    -- Draw the rectangle outline
    self:drawCoolRectangle(0, 0, self.width, self.height)

    -- Draw text inside the button rectangle
    Draw.pushScissor()
    Draw.scissor(0, 0, self.width, self.height)

    if not self.prompt then
        -- Draw the name shadow
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.name, 50 + 2, 10 + 2)
        -- Draw the name
        Draw.setColor(self:getDrawColor())
        love.graphics.print(self.name, 50, 10)

        -- Draw the time shadow
        local time_x = self.width-64-self.font:getWidth(self.time) + 2
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.time, time_x + 2, 10 + 2)
        -- Draw the time
        Draw.setColor(self:getDrawColor())
        love.graphics.print(self.time, time_x, 10)
    else
        -- Draw the prompt shadow
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.prompt, 50 + 2, 10 + 2)
        -- Draw the prompt
        Draw.setColor(self:getDrawColor())
        love.graphics.print(self.prompt, 50, 10)
    end

    if not self.choices then
        -- Draw the area shadow
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.area, 50 + 2, 44 + 2)
        -- Draw the area
        Draw.setColor(self:getDrawColor())
        love.graphics.print(self.area, 50, 44)
    else
        -- Draw the shadow for choice 1
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.choices[1], 70+2, 44+2)
        -- Draw choice 1
        if self.selected_choice == 1 then
            Draw.setColor(PALETTE["filemenu_selected"])
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
        love.graphics.print(self.choices[1], 70, 44)

        -- Draw the shadow for choice 2
        Draw.setColor(0, 0, 0)
        love.graphics.print(self.choices[2], 250+2, 44+2)
        -- Draw choice 2
        if self.selected_choice == 2 then
            Draw.setColor(PALETTE["filemenu_selected"])
        else
            Draw.setColor(PALETTE["filemenu_deselected"])
        end
        love.graphics.print(self.choices[2], 250, 44)
    end

    Draw.popScissor()
end

return FileButton