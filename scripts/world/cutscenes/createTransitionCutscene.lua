local function createTransitionCutscene(yval, base_config, map)
    return function(cutscene, config)
        setmetatable(config, {__index = base_config})

        -- Disable things that interfere with most cutscenes
        cutscene:detachCamera()
        cutscene:detachFollowers()
        
        local transition = DarkTransition(yval, config)
        Game.world:addChild(transition)
        
        -- Visual
        transition.layer = 99999
        Game.world.player.visible = false
        if Game.world.followers[1] then
            Game.world.followers[1].visible = false
        end
        -- Visible state gets reset when loading the new map. Looks weird if we don't have this.
        transition.land_callback = function() 
            Game.world.player.visible = false
            if Game.world.followers[1] then
                Game.world.followers[1].visible = false
            end
        end
        
        
        -- Load map when it's time to
        transition.loading_callback = function() Game.world:loadMap(map) end
        -- Wait for transition to complete
        local waiting = true
        transition.end_callback = function() waiting = false end
        local wait_func = function() return not waiting end
        cutscene:wait(wait_func)

        -- Re-enable gameplay features
        cutscene:attachCamera()
        cutscene:attachFollowers()
        -- Re-enable Kris and Susie
        Game.world.player.visible = true
        if Game.world.followers[1] then
            Game.world.followers[1].visible = true
        end
        local kx, ky = transition.character_data[1].sprite_holder:localToScreenPos(transition.character_data[1].sprite_1.width / 2, 0)
        Game.world.player:setScreenPos(kx - 2, transition.final_y - 2)
        Game.world.player.visible = true
        Game.world.player:setFacing("down")
    
        if Game.world.followers[1] then
            local sx, sy = transition.character_data[2].sprite_holder:localToScreenPos(transition.character_data[2].sprite_1.width / 2, 0)
            Game.world.followers[1]:setScreenPos(sx - 2, transition.final_y - 2)
            Game.world.followers[1].visible = true
            Game.world.followers[1]:interpolateHistory()
            Game.world.followers[1]:setFacing("down")
        end
        local kx, ky = transition.character_data[1].sprite_holder:localToScreenPos(transition.character_data[1].sprite_1.width / 2, 0)
        Game.world.player:setScreenPos(kx - 2, transition.final_y - 2)
        Game.world.player.visible = true
        Game.world.player:setFacing("down")

        if Game.world.followers[1] then
            local sx, sy = transition.character_data[2].sprite_holder:localToScreenPos(transition.character_data[2].sprite_1.width / 2, 0)
            Game.world.followers[1]:setScreenPos(sx - 2, transition.final_y - 2)
            Game.world.followers[1].visible = true
            Game.world.followers[1]:interpolateHistory()
            Game.world.followers[1]:setFacing("down")
        end
    end
end
return {
    outskirts = createTransitionCutscene(280, {skiprunback = false}, "outskirts")
}