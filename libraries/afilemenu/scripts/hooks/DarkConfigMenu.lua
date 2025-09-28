if not Kristal.getLibConfig("afilemenu", "configMenuOverride") then
    return DarkConfigMenu
end

local DarkConfigMenu, super = Class(DarkConfigMenu)

function DarkConfigMenu:update()
    if self.state == "MAIN" then
        if Input.pressed("confirm") then
            if self.currently_selected == 6 then
                Game.fader:fadeOut(function ()
                    Game:load(nil, nil, true)
                end, {})
                self.fadeout = true
                return
            end
        end
    end
    super.update(self)
end

function DarkConfigMenu:draw()
    if self.fadeout then
        super.super.draw(self)
        return
    end
    super.draw(self)
end

return DarkConfigMenu
