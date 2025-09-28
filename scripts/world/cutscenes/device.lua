

local textbox = nil
return {
device = function(cutscene, event)

   

	textbox = Textbox(Game.world.camera:getRect())

	--other fonts in assets/fonts
	textbox:setFont("main", 24)
	--if we just use :setTextColor(), we get this weird gloss to the text. you can see for yourself if you comment out the next line and uncomment the line after
	textbox:addFX(RecolorFX(0,0.8,0,1))
	--textbox.text:setTextColor(0,0.8,0,1)
	local signalStatus = ("No Signal...")
	--double \\ on \\User to escape backslash
	
	textbox:setText(string.format([[
		
	%s

	========================================
	DEVICE:\\DeviceUser1
	========================================
	
	[1:] File Explorer
	[2:] Internet
	[3:] Settings
	[0:] Power Off
	
	========================================
	Type in a number to make a selection
	> _
	]], signalStatus))

	
	--these should be self explanitory, you can see more state options in src/engine/objects/text.lua:105
	textbox.text.state.typing_sound = nil
	textbox.text.state.speed = 5
	textbox.text.state.offset_x = 8
	textbox.text.state.offset_y = 8
	Game.world:addChild(textbox)
	textbox:setLayer(100)
    GonerNumpad.keypadInput(cutscene)
end,	

	--this has to happen last
    
    ["test"] = function(cutscene)
        local num1 = GonerNumpad.keypadInput(cutscene)
        --make a textbox that will ignore our input and that will not wait for our input
        local _, textbox = cutscene:text("number inputed: "..num1.."\nnow give a 3 digit number. ill stay here unti you're done.",nil,nil,{wait = false})
        textbox:setText(textbox.text.text, function() end)
    
        cutscene:wait(1)
        local num2 = GonerNumpad.keypadInput(cutscene, 3,
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