
local GonerNumpad, super = Class(GonerKeyboard, "GonerNumpad")

--call this instead of constructor
---@STATIC
function GonerNumpad.keypadInput(cutscene, count, callback)
    count = count or 1
    --setup the keypad
    local keypad =  GonerNumpad(1, 
    {
            x      = 500,
            y      = 388,
            step_x = 60,
            step_y = 60,
            name_y = (SCREEN_WIDTH / 2),
            name_x = (SCREEN_WIDTH / 2),
            name_align = "center",
            keyboard = {
                {"1", "2", "3"},
                {"4", "5", "6"},
                {"7", "8", "9"},
                {"^^", "0", "^^"}
            }
    },
    nil, nil
    )
    --keypad.choicer.soul.inherit_color = false
    keypad.choicer.soul:setColor(101/255, 1, 183/255, 1)
    --keypad.choicer.soul:addFX(RecolorFX(1.0,0.0,1.0,1.0))
    keypad.layer = WORLD_LAYERS.top
    
    --keypad.choicer.soul.alpha = 1
    --keypad:addFX(RecolorFX(0.5,1,0,1))
    Game.world:addChild(keypad)

    keypad.active = true
    keypad.visible = true
    keypad.limit = -1

    keypad.key_callback = function(key, x,y, keypad) --this callback is called whenever a number is pressed, use it to get input
        print("key",x,y, count, #keypad.text, keypad.limit > #keypad.text, key, x,y, keypad)
        local done = false
        if((#keypad.text + 1) >= count ) then
            done = true
            keypad.choicer.done = true
            keypad.choicer:finish(keypad.callback)
            keypad:finish()
        end

        if(callback) then callback(key, x,y, keypad, done) end
    end

    cutscene:wait(
        function()
            return keypad.done
        end
    )

    keypad.active = false
    keypad.visible = false
    keypad:remove()
    return tonumber(keypad.text)
end

--do not invoke, will not have numpad
function GonerNumpad:init(limit, mode, callback, key_callback)
    super.init(self, limit, mode, callback, key_callback)
    self.select_color = {0.0,0.4,0.25,1}
    self.text_color = {0.5,1,0,1}
    self.name_color = {0.5,1,0,1}
    self.name_select_color = {0.5,1,0,1}
    -- yknow its a miracle lua allows you to do this
    function self.choicer.draw(choicer)
        Object.draw(choicer) --> GonerChoice.super.draw(self)

        love.graphics.setFont(choicer.font)
        for y, row in ipairs(choicer.choices) do
            for x, choice in ipairs(row) do
                local text = choicer:getChoiceText(choice, x, y)

                local tx = (choice[2] or 0)
                local ty = (choice[3] or 0)

                if not choicer:isHidden(choice, x, y) then
                    if choicer.selected_x == x and choicer.selected_y == y then
                        Draw.setColor(self:getSelectColor())
                        love.graphics.print(text, tx, ty)
                    else
                        Draw.setColor(self:getTextColor())
                        love.graphics.print(text, tx, ty)
                    end
                end
            end
        end
    end
    --that being said never do this

end

function GonerNumpad:draw()
    Object.draw(self) --> GonerKeyboard.super.draw(self)

    love.graphics.setFont(self.font)

    --im very tired. why are there so many options here. it's all gonna be green anyways!
    if self.limit >= 0 and #self.text >= self.limit then
        Draw.setColor(self:getNameSelectColor())
    else
        Draw.setColor(self:getNameColor())
    end

    local ox
    if(self.mode.name_align == "left") then
        ox = 0
    elseif(self.mode.name_align == "right") then
        ox = - self.font:getWidth(self.text)
    else --center
        ox = - self.font:getWidth(self.text) / 2
    end

    love.graphics.print(self.text, self.mode.name_x + ox, self.mode.name_y)
end

function GonerNumpad:setSelectColor(r,g,b,a)
    if type(r) == "table" then
        r, g, b, a = unpack(r)
    end
    self.text_color = { r, g, b, a or self.text_color[4]}
end

function GonerNumpad:setTextColor(r,g,b,a)
    if type(r) == "table" then
        r, g, b, a = unpack(r)
    end
    self.text_color = { r, g, b, a or self.text_color[4]}
end

function GonerNumpad:setNameColor(r,g,b,a)
    if type(r) == "table" then
        r, g, b, a = unpack(r)
    end
    self.name_color = { r, g, b, a or self.name_color[4]}
end

function GonerNumpad:setNameSelectColor(r,g,b,a)
    if type(r) == "table" then
        r, g, b, a = unpack(r)
    end
    self.name_select_color = { r, g, b, a or self.name_select_color[4]}
end

--dont use these either, get'd color != set'd color
function GonerNumpad:getSelectColor()
    local r,g,b,a = self:getDrawColor()
    return r*self.select_color[1], g*self.select_color[2], b*self.select_color[3], a*self.select_color[4]
end

function GonerNumpad:getTextColor()
    local r,g,b,a = self:getDrawColor()
    return r*self.text_color[1], g*self.text_color[2], b*self.text_color[3], a*self.text_color[4]
end

function GonerNumpad:getNameColor()
    local r,g,b,a = self:getDrawColor()
    return r*self.name_color[1], g*self.name_color[2], b*self.name_color[3], a*self.name_color[4]
end

function GonerNumpad:getNameSelectColor()
    local r,g,b,a = self:getDrawColor()
    return r*self.name_select_color[1], g*self.name_select_color[2], b*self.name_select_color[3], a*self.name_select_color[4]
end

return GonerNumpad;

