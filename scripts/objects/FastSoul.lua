local FastSoul, super = Class(Soul)

function FastSoul:init(x, y)
	super.init(self, x, y)
    self:setColor(101/255, 255/255, 183/255)
	

end


function FastSoul:doMovement()
    local speed = self.speed

    -- Do speed calculations here if required.A

    if self.allow_focus then
        if Input.down("cancel") then speed = speed / 2 end -- Focus mode.
    end


    if Game:getTension() >= 1 and Input.down("confirm") then 
        speed = speed * 6.5
        Game:removeTension(0.5)
    end

    local move_x, move_y = 0, 0

    local r,g,b,a = self:getDrawColor()

    --Drawing Mode


    -- Keyboard input:
    if Input.down("left")  then move_x = move_x - 0.7 end
    if Input.down("right") then move_x = move_x + 0.7 end
    if Input.down("up")    then move_y = move_y - 0.7 end
    if Input.down("down")  then move_y = move_y + 0.7 end
    

    self.moving_x = move_x
    self.moving_y = move_y

    if move_x ~= 0 or move_y ~= 0 then
        if not self:move(move_x, move_y, speed * DTMULT) then
            self.moving_x = 0
            self.moving_y = 0
        end
    end
end
return FastSoul