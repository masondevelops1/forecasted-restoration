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
	DEVICE:\\User
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
	
	textbox:setLayer(100)
	
	--this has to happen last
	Game.world:addChild(textbox)

	cutscene:wait(5)

	local choice = cutscene:choicer({"1", "2", "3", "0"})


	if choice == 3 then
		signalStatus = ("Connected:")
		textbox:setText(string.format([[
			%s
		
			========================================
			DEVICE:\\User
			========================================
			
			[1:] File Explorer
			[2:] Internet
			[3:] Settings
			[0:] Power Off
			
			========================================
			Type in a number to make a selection
			> _
			]], signalStatus))
	end

	if choice == 4 then
		textbox:setText([[
		
		Shutting down...
		]])
		cutscene:wait(2)
		textbox:setText([[
		
		Unsaved data was found. Would you like to save?
		]])
		cutscene:wait(1)
		local choice = cutscene:choicer({"Save Data", "Cancel"})
		if choice == 1 then
			cutscene:wait(1)
			textbox:setText([[
		
			Saving Data. Please be patient.
			-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]-[wait:10]
			]])
			cutscene:wait(5)
			Kristal.saveGame()
			
			

		end
		cutscene:wait(2)
		textbox:setText([[
		
		Data saved. Shutting down.[wait:10].[wait:10].[wait:10]
		]])
		cutscene:wait(2)
		textbox:remove()
		cutscene:endCutscene()

	end		
end

}