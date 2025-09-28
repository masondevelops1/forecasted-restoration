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
end

}