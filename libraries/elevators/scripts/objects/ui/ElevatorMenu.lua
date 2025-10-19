local ElevatorMenu, super = Class(Object)

function ElevatorMenu:init(elevator)
    self.elevator = elevator
    self.floor_count = #self.elevator.floors
    self.floor_index = #self.elevator.floors
    self.decision = nil
    super.init(self, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, 36, 40)

    Input.clear("confirm")

    local soul = Game.stage:addChild(EasingSoul(SCREEN_WIDTH/2, SCREEN_HEIGHT/2))
    soul.use_parent = true
    soul.layer = WORLD_LAYERS["above_ui"]

    local box = BoxComponent(FitSizing())
    local menu = EasingSoulMenuComponent(FitSizing(), FixedSizing(160), { hold = true, soul = soul })
    menu:setScrollbar(ScrollbarComponent({gutter = "dotted", margins = {8, 0, 0, 0}, arrows = true}))
    local alignment
    if self.floor_count > 4 then
        alignment = "start"
    else
        alignment = "center"
    end
    menu:setLayout(VerticalLayout({ gap = 0, align = alignment }))
    menu:setOverflow("scroll")
    menu:setScrollType("paged")

    --[[
    for i = self.floor_count, 0 do
        menu:addChild(TextMenuItemComponent(Text(self.elevator.floors[i].name), function ()
            menu:close()
            box:remove()
            soul:remove()
            self.decision = i
        end))
    end
    --]]

    --
    while self.floor_index > 0 do
        local index = self.floor_index
        menu:addChild(TextMenuItemComponent(Text(self.elevator.floors[self.floor_index].name), function (value)
            menu:close()
            box:remove()
            soul:remove()
            self.decision = index
            if self.elevator.floors[index].mod then
                self.mod = self.elevator.floors[index].mod
            end
        end))
        self.floor_index = self.floor_index - 1
    end
    --]]

    --[[
    menu:addChild(TextMenuItemComponent(Text("Placeholder 1"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    menu:addChild(TextMenuItemComponent(Text("Placeholder 2"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    menu:addChild(TextMenuItemComponent(Text("Placeholder 3"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    menu:addChild(TextMenuItemComponent(Text("Placeholder 4"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    menu:addChild(TextMenuItemComponent(Text("Placeholder 5"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    menu:addChild(TextMenuItemComponent(Text("Placeholder 6"), function (value)
        menu:close()
        box:remove()
        soul:remove()
        self.decision = 1
    end))
    --]]

    box:addChild(menu)
    Game.stage:addChild(box)
    box:setOrigin(0.5)
    box.x = SCREEN_WIDTH/2
    box.y = SCREEN_HEIGHT/2
    menu:setFocused()
    menu:setSelected(self.floor_count - (self.elevator.current_floor-1))

    menu:setCancelCallback(function()
        menu:close()
        box:remove()
        soul:remove()
        self.decision = self.elevator.current_floor
        self.cancel = true
    end)
    
end

return ElevatorMenu