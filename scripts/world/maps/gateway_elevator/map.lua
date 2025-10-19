local Elevator, super = Class(Map)

function Elevator:onEnter()
    Game.world.timer:after(1/30, function()
    local elevator = Game.world.map:getEvent("elevator")
    if ELEVATOR_TRANSITION -- We've have information for moving the elevator between mods
    and Game.world.player.y <= 360 then -- We did NOT spawn in from the door. Ideally I'd check which marker we spawned in from, but I dunno how to do that.

        Game.fader:fadeOut(nil, {speed = 0})


        Game.world:startCutscene(function(cutscene)            
            -- Manually restart the elevator movement. I've tried doing it with elevator:moveTo, but something always broke when I did.
            if (elevator.movecon == 0) then
                elevator.movecon = 1
            end
            elevator.con = 101
            Game.world.music:play("elevator", 0, 0.5)

            elevator.pitchcount = 0.5
            elevator.volcount = 0
            elevator.pitchtimer = 0
            elevator.continuetimer = 0
            -- Infinite, so that it won't end until we've fully faded back in.
            elevator.infinite = true

            cutscene:wait(1)
            cutscene:detachFollowers()

            -- Copy data from ELEVATOR_TRANSITION to the elevator.

            if not ELEVATOR_TRANSITION["target_floor"] then -- Floor number wasn't set! Let's see if we can find it.
                -- First, check for a floor name.
                if elevator:getFloorByName(ELEVATOR_TRANSITION["target_name"]) then
                    elevator.target_floor = elevator:getFloorByName(ELEVATOR_TRANSITION["target_name"])
                -- If that doesn't work, check for a destination map.
                elseif elevator:getFloorByDestination(ELEVATOR_TRANSITION["target_dest"]) then
                    elevator.target_floor = elevator:getFloorByDest(ELEVATOR_TRANSITION["target_dest"])
                -- If THAT doesn't work, then, uh. We're kinda fucked.
                else
                    error("ELEVATOR_TRANSITION did not contain a target floor")
                end

            else
                elevator.target_floor =    ELEVATOR_TRANSITION["target_floor"]
            end

            elevator.dir =             ELEVATOR_TRANSITION["target_dir"] or 1
            Game.world.player.x =      ELEVATOR_TRANSITION.party_data[1].x or 320
            Game.world.player.y =      ELEVATOR_TRANSITION.party_data[1].y or 320
            Game.world.player:setFacing(ELEVATOR_TRANSITION.party_data[1].facing or "down")
            for i, chara in ipairs(Game.world.followers) do
                chara.x =       ELEVATOR_TRANSITION.party_data[i+1].x or 320
                chara.y =       ELEVATOR_TRANSITION.party_data[i+1].y or 320
                chara:setFacing(ELEVATOR_TRANSITION.party_data[i+1].facing or "down")
            end

            Game.world.timer:tween(3, elevator, {volcount = 0.7}, "linear")
            Game.fader:fadeIn(nil, {speed = 3})
            cutscene:wait(4)
            elevator.charadjustcon = 0
            elevator.infinite = false

            cutscene:interpolateFollowers()
            cutscene:attachFollowers()

            ELEVATOR_TRANSITION = nil



        end)
        
            
            
            
        
        else ELEVATOR_TRANSITION = nil
        end
    end)
end

return Elevator