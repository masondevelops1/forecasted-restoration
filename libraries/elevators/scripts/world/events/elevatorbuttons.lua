local ElevatorButtons, super = Class(Event)

function ElevatorButtons:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})
end

function ElevatorButtons:postLoad()
    self.elevator = Game.world.map:getEvent("elevator")
end

function ElevatorButtons:onInteract(chara)
    if #self.elevator.floors == 2 then
        Game.world:startCutscene(function(cutscene)
            cutscene:text("* (Ride the elevator?)")
            local choice = cutscene:choicer({"Ride", "Do not"})
            if choice == 1 then
                local mod = self.elevator.floors[(self.elevator.current_floor == 1 and 2 or 1)].mod
                if self.elevator.current_floor == 1 then
                    if mod and mod ~= Mod.info.id then
                        self:confirmModSwitch(2, mod)
                    else
                        self.elevator:moveTo(2)
                        if self.elevator.floors[2].cutscene then
                            self.elevator.infinite = true
                            Game.world.timer:after(1/30, function() Game.world:startCutscene(self.elevator.floors[2].cutscene, self) end)
                            return
                        end
                    end
                else
                    if mod and mod ~= Mod.info.id then
                        self:confirmModSwitch(1, mod)
                    else
                        self.elevator:moveTo(1)
                        if self.elevator.floors[1].cutscene then
                            self.elevator.infinite = true
                            Game.world.timer:after(1/30, function() Game.world:startCutscene(self.elevator.floors[1].cutscene, self) end)
                            return
                        end
                    end
                end
            end
        end)
    else
        Game.world:startCutscene(function(cutscene)
            cutscene:text("* (Where will you ride the elevator to?)")


            local names = {}
            for i, floor in ipairs(self.elevator.floors) do
                names[i] = floor.name
            end

            local incmenu
            if AbstractMenuComponent then -- If this returns anything, we can use the new UI system!
                incmenu = ElevatorMenu(self.elevator)
            else -- If not, then we're using a Kristal version from before the UI system was added, so we use this old version of the menu.
                incmenu = IncMenu({1, #self.elevator.floors}, self.elevator.current_floor)
            end
            incmenu.elevatormode = true
            Game.world:spawnObject(incmenu, "ui")
            cutscene:wait(function() return incmenu.decision end)
            local decision = incmenu.decision
            incmenu:remove()
            if decision == self.elevator.current_floor then
                if Input.pressed("cancel") or incmenu.cancel then return end
                cutscene:text("* (You're there.)")
                return
            end
            if incmenu.mod and incmenu.mod ~= Mod.info.id then 
                self:confirmModSwitch(incmenu.decision, incmenu.mod)
                return
            end
            self.elevator:moveTo(decision)
            if self.elevator.floors[incmenu.decision].cutscene then
                self.elevator.infinite = true
				cutscene:wait(1/30)
                cutscene:after(function()
				    Game.world:startCutscene(self.elevator.floors[incmenu.decision].cutscene, self) 
                end)
                return
            end
        end)
    end
    return true
end

function ElevatorButtons:confirmModSwitch(floor, mod)
    local floor = floor
    local mod = mod
    local cutscene = Game.world.cutscene
    if Kristal.Mods.data[mod] == nil then
        cutscene:text("* But the elevator remained motionless.")
        cutscene:text(string.format("* (Are you missing the %q DLC?)", mod))
        return
    end


    local has_dess = cutscene:getCharacter("dess") ~= nil
    cutscene:text("* Your "
        .. (has_dess and "desstination" or "destination")
        .." is "
        ..(has_dess and "in another castle" or "infinitely far away")
        ..".\n* Leave this "
        .. (has_dess and "Dark " or "")
        .."Place?")
    local enter = cutscene:choicer({"Yes", "No"})

    if enter == 1 then


        cutscene:after(function(cutscene) 
            Game.world:startCutscene(function (cutscene)

                
                cutscene:wait(4)
                Game.world.timer:tween(3, self.elevator, {volcount = 0}, "linear")
                cutscene:wait(cutscene:fadeOut(3))
                
                -- When moving between mods, we want to keep the party in the same position that they were when leaving the previous mod,
                -- as well as keep the elevator moving in the same direction.
                ELEVATOR_TRANSITION = {
                    party_data = { {}, {}, {} },
                    target_floor = floor,
                    target_name = self.elevator.floors[self.elevator.target_floor].name,
                    target_dest = self.elevator.floors[self.elevator.target_floor].dest,
                    target_dir = self.elevator.dir,
                }
                -- Copy party position to party_data
                ELEVATOR_TRANSITION.party_data[1].x =      Game.world.player.x
                ELEVATOR_TRANSITION.party_data[1].y =      Game.world.player.y
                ELEVATOR_TRANSITION.party_data[1].facing = Game.world.player.facing
                for i, chara in ipairs(Game.world.followers) do
                    
                    ELEVATOR_TRANSITION.party_data[i+1].x =      chara.x
                    ELEVATOR_TRANSITION.party_data[i+1].y =      chara.y
                    ELEVATOR_TRANSITION.party_data[i+1].facing = chara.facing
                    
                end
                
                cutscene:wait(1)
                
                cutscene:after(Game:swapIntoMod(mod, false, self.elevator.floors[floor].dest))

            end)
        end)

        self.elevator:moveTo(floor)
        self.elevator.infinite = true

    else
        cutscene:text("* You elevaten't.")
    end

end

return ElevatorButtons