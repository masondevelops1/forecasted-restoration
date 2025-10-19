return {

sword = function(cutscene, event)
    local swordE = cutscene:getCharacter("sword")

    cutscene:text("* It's my Creator's valuable weaponry.")
    cutscene:text("* Should I take his sword?")
    local choice = cutscene:choicer({"Yes", "No"})
    
    if choice == 1 then
        cutscene:text("* I will make him proud.[wait:10] \n* That's what counts,[wait:5] right?")
        swordE:remove()
        Assets.playSound("item")
        cutscene:wait(1)
        cutscene:text("* The blade's opulent colors inspire me.")
        event:setFlag("dont_load", true)

    elseif choice == 2 then 
        cutscene:text("* Maybe I shouldn't touch his valuable weaponry.")
        Cutscene:endCutscene()
    end
end;

smasheddoor = function(cutscene, event)
    cutscene:text("* It's a door.[wait:5] It seems like it's been smashed out of pure anger.")
end;

lockeddoor = function(cutscene, event)
    cutscene:text("* It's a door.[wait:5] You'd go inside if it wasn't locked.")
end;

boxes = function(cutscene, event)
    cutscene:text("* There's many boxes here.[wait:5] The one on top seems to be addressed to \"The Omnis\".")
end;

computer = function(cutscene, event)
    cutscene:text("* It's a computer,[wait:5] but it's not the Hometown brand you're used to.[wait:5] It's stuck on a black screen.")
end;
lockdown = function(cutscene, event)
    cutscene:text("* The path forward is blocked by a device-controlled LOCKDOWN door.")
    cutscene:setSpeaker("susie")
    cutscene:text("* It'd probably be a good idea to check out that \"device.\"", "sad")
end;
shopinterest = function(cutscene, event)
    cutscene:setSpeaker("susie")
    cutscene:text("* Hey Kris,[wait:5] we could probably get some good stuff in that shop.", "sad")
end;
documents = function(cutscene, event)
    cutscene:text("* There's a document here.[wait:5] It's mostly scratched out,[wait:5] but there's writing on the bottom of the blacked out bits.")
    cutscene:text("* It reads,[wait:5] \"DOCUMENTED ON MAIN DEVICE.[wait:5] OLDER DOCUMENTATION WILL BE SHREDDED AT A LATER DATE.\"")
    cutscene:setSpeaker("susie")
    cutscene:text("* It'd probably be a good idea to check out that \"device.\"", "sad")
end;
gatewayEnter = function(cutscene, event)
    if Plot:isBefore("gateway_enter") then
        local kris = assert(cutscene:getCharacter("kris"))
        local susie = cutscene:getCharacter("susie") or kris
        local noelle = cutscene:getCharacter("noelle") or susie
        Kristal.Console:log("device_used")   
        cutscene:setSpeaker(susie)
        cutscene:text("* So...[wait:5] this is the Gateway...", "neutral_side")
        cutscene:text("* Man,[wait:5] it really feels like we're about to step into something big,[wait:5] huh?", "nervous")
        cutscene:text("* Earthquakes...[wait:5] creepy shelter...[wait:5] stupid doctor...", "neutral")
        cutscene:text("* Can't believe it all leads up to this...", "neutral_side")
        cutscene:text("* Alright,[wait:5] let's not waste another second!", "smile") 
        SetPlot("gateway_enter")
    end;
end;
firstTerminal = function(cutscene)
    if Plot:isBefore("gateway_terminal1") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
		cutscene:setSpeaker(susie)
		cutscene:text("* So...[wait:5] guess we should turn this on,[wait:5] shouldn't we?", "nervous")
        cutscene:text("* Alright then,[wait:5] Kris,[wait:5] press that big red button!", "smile") 
        cutscene:setSpeaker()
        Assets.playSound("item")
        cutscene:text("* You pressed the big red button.\n[wait:5]* 1/2 Terminals have been activated!")
		SetPlot("gateway_terminal1")
    end
end,
finalTerminal = function(cutscene)
    if Plot:isBefore("gateway_lockdown_off") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
		cutscene:setSpeaker(susie)
		cutscene:text("* So...[wait:5] guess this disables the lockdown.", "nervous")
        cutscene:text("* Alright then,[wait:5] Kris,[wait:5] one more press of that big red button!", "smile") 
        cutscene:setSpeaker()
        Assets.playSound("item")
        cutscene:text("* You pressed the big red button.\n[wait:5]* 2/2 Terminals have been activated!")
        cutscene:text("[color:#ff00ff]* Deactivating Gateway Lockdown...")
        cutscene:text("* You heard a big metal door slowly open...")
        cutscene:text("[color:#ff00ff]* Complete![wait:5] [color:#ff4444]WARNING: Gateway Sector:[wait:5] B needs immediate maintenance.")
        cutscene:text("[color:#ff00ff]* Security Guards will be immediately deactivated when Floor B2 is exited.")
        SetPlot("gateway_lockdown_off")
    end
end,
getHeal = function(cutscene)
    if Plot:isBefore("gateway_lockdown_off") then
        local kris = assert(cutscene:getCharacter("kris"))
		local susie = cutscene:getCharacter("susie") or kris
		local noelle = cutscene:getCharacter("noelle") or susie
		Kristal.Console:log("device_used")   
        Assets.playSound("item")
        cutscene:text("You got the WingDing![wait:5] It wasn't added anywhere.")
        cutscene:text("This is OBVIOUSLY Test fucking DIALOGUE!")
    end
end;
}