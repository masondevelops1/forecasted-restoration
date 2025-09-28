--brings up the green number pad on the right side of the screen.
--cutscene is the current custcene
--count the number of digits you want to read (default 1)
--callback is the per-key input function callback(key, x,y, keypad, done)
---- key is the key input, x,y is the cursor postion, keypad is this keypad, and done is whether or not the last digit has been input
local function keypadInput(cutscene, count, callback)
    count = count or 1
    --setup the keypad
    local keypad =  GonerKeyboard(1, 
    {
            x      = 500,
            y      = 120,
            step_x = 60,
            step_y = 60,
            name_y = 80,
            keyboard = {
                {"1", "2", "3"},
                {"4", "5", "6"},
                {"7", "8", "9"},
                {"^^", "0", "^^"}
            }
    },
    nil, nil
    )
    keypad.layer = WORLD_LAYERS.top
    keypad.choicer.soul.alpha = 1
    keypad:addFX(RecolorFX(0.5,1,0,1))
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

return {
    [1] = function(cutscene)
    local num1 = keypadInput(cutscene)
    --make a textbox that will ignore our input and that will not wait for our input
    local _, textbox = cutscene:text("number inputed: "..num1.."\nnow give a 3 digit number. ill stay here unti you're done.",nil,nil,{wait = false})
    textbox:setText(textbox.text.text, function() end)

    cutscene:wait(1)
    local num2 = keypadInput(cutscene, 3,
        function(key, x,y, keypad, done)
            --close that textbox when we're done inputting our number
            if(done) then
                cutscene:tryResume()
                textbox:remove()
            end
        end
    )
    cutscene:text("number inputed: "..num2.."\nsum is ".. (num1+num2))
end
}