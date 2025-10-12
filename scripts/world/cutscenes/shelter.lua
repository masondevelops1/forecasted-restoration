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
}