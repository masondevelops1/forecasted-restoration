---@class SpeechBubble : SpeechBubble
local SpeechBubble, super = (Utils.hookScript or Class)(SpeechBubble)

if not Utils.hookScript then
    Kristal.Console:warn("Bro's Kristal is ANCIENT :skull:")
    Kristal.Console:warn("Bro doesn't have Utils.hookScript :jellycruel:")
    Kristal.Console:warn("Bro installed Kristal before Earthbound released :sobbing:")
end

function SpeechBubble:setText(text, callback, line_callback)
    if self.bubble_data["dark"] then
        text = "[color:white]"..text
    end
    return super.setText(self, text, callback, line_callback)
end

function SpeechBubble:draw()
    -- Use default behavior if 
    if not self.bubble_data["uniform"] then
        return super.draw(self)
    end
    if not self.auto then
        Draw.draw(self:getSprite(), 0, 0)
    else
        local inner_left = -self.padding["left"]
        local inner_top = -self.padding["top"]
        local inner_right = self.text_width + self.padding["right"]
        local inner_bottom = self.text_height + self.padding["bottom"]

        local inner_width = self.padding["left"] + inner_right
        local inner_height = self.padding["top"] + inner_bottom

        local offset = 0
        if self.right then
            local left_width, _ = self:getSpriteSize("left")
            offset = self:getTailWidth() + self.padding["left"] + left_width + 1
        end


        local sprite_fill = self:getSprite("fill")
        local sprite_tail = self:getSprite("tail")

        local sprite_left   = self:getSprite("left"  )
        local sprite_top    = self:getSprite("top"   )
        local sprite_right  = self:getSprite("right" )
        local sprite_bottom = self:getSprite("bottom")

        local sprite_top_left     = self:getSprite("top_left"    )
        local sprite_top_right    = self:getSprite("top_right"   )
        local sprite_bottom_left  = self:getSprite("bottom_left" )
        local sprite_bottom_right = self:getSprite("bottom_right")


        if sprite_fill then Draw.draw(sprite_fill, offset + inner_left, inner_top, 0, inner_width / sprite_fill:getWidth(), inner_height / sprite_fill:getHeight()) end

        if sprite_left   then Draw.draw(sprite_left,   offset + inner_left - sprite_left:getWidth(), inner_top,                          0, 1,                                      inner_height / sprite_left:getHeight())  end
        if sprite_top    then Draw.draw(sprite_top,    offset + inner_left,                          inner_top - sprite_top:getHeight(), 0, inner_width / sprite_top:getWidth(),    1)                                       end
        if sprite_right  then Draw.draw(sprite_right,  offset + inner_right,                         inner_top,                          0, 1,                                      inner_height / sprite_right:getHeight()) end
        if sprite_bottom then Draw.draw(sprite_bottom, offset + inner_left,                          inner_bottom,                       0, inner_width / sprite_bottom:getWidth(), 1)                                       end

        if sprite_top_left     then Draw.draw(sprite_top_left,     offset + inner_left - sprite_top_left:getWidth(),    inner_top - sprite_top_left:getHeight())  end
        if sprite_top_right    then Draw.draw(sprite_top_right,    offset + inner_right,                                inner_top - sprite_top_right:getHeight()) end
        if sprite_bottom_left  then Draw.draw(sprite_bottom_left,  offset + inner_left - sprite_bottom_left:getWidth(), inner_bottom)                             end
        if sprite_bottom_right then Draw.draw(sprite_bottom_right, offset + inner_right,                                inner_bottom)                             end

        local scale = 1

        if sprite_tail then
            if not self.right then
                local right, _ = self:getSpriteSize("right")
                Draw.draw(sprite_tail, inner_right + right, Utils.floor((self.text_height / 2 - 1 - (sprite_tail:getHeight() / 2)) * scale), 0, 1, 1)
            else
                local left, _ = self:getSpriteSize("left")
                Draw.draw(sprite_tail, offset + inner_left - left, (self.text_height / 2 - 1 - (sprite_tail:getHeight() / 2)) * scale, 0, -1, 1)
            end
        end
    end

    self:drawChildren()
end

return SpeechBubble