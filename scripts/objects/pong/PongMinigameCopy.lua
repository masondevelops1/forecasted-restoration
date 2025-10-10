---@class PongMinigameCopy: Object
---@overload fun(): PongMinigameCopy
local PongMinigameCopy, super = Class(Object)

function PongMinigameCopy:init()
    super.init(self, 0,0,SCREEN_WIDTH, SCREEN_HEIGHT)
    self.bounds_collider = ColliderGroup(self, {
        LineCollider(nil, 0, 0, self.width, 0),
        LineCollider(nil, 0, self.height, self.width, self.height),
    })
    
    Music:stop()
    Game.world.music:play("pingpong")
    self.left_paddle = self:addChild(PongPaddle("objects/pongMinigame/opponentHit_1"))
    self.left_paddle:setHitbox(0,0,self.left_paddle:getSize())
    self.right_paddle = self:addChild(PongPaddle("objects/pongMinigame/playerHit_1"))
    self.right_paddle:setHitbox(0,0,self.right_paddle:getSize())
    self.ball = self:addChild(PongBall())
    self.ball:setHitbox(0,0,self.ball:getSize())
    self.ball:setScale(1) -- TODO: Change this when we have sprites
    self.left_paddle:setScale(2)
    self.right_paddle:setScale(2)
    self.left_paddle.bounce_collider = LineCollider(self.left_paddle, self.left_paddle.width, 0, self.left_paddle.width, self.left_paddle.height)

    self.left_paddle.x = 4
    self.right_paddle.x = (self.width - self.right_paddle:getScaledWidth()) - 4
    self.ball:setOrigin(0.5)
    self.ball:setPosition(self.width/2, self.height/2)
    self.ball.physics.speed = 7
    self.left_paddle.speed = 1
end

---@return boolean done
---@return boolean victory
function PongMinigameCopy:isDone()
    if self.ball.x < (-self.ball:getScaledWidth()/2) then
        return true, true
    end
    if self.ball.x > (self.width + (self.ball:getScaledWidth()/2)) then
        return true, false
    end
    return false, false
end


-- Makes a cutscene wait until this minigame is done.
---@param cutscene Cutscene
---@async
---@return boolean victory Whether the player won.
function PongMinigameCopy:await(cutscene)
    cutscene:fadeOut(4)
    return cutscene:wait(function () return self:isDone() end)
end

function PongMinigameCopy:draw()
    super.draw(self)
    if DEBUG_RENDER then
        self.ball.collider:drawFor(self)
        local done, won = self:isDone()
        if done then
            love.graphics.print("DONE!" .. (won and " WON!" or " ...loser."))
        end
    end
end

function PongMinigameCopy:update()
    super.update(self)
    self:checkInput()
    Object.startCache()
    self:checkCollision()
    Object.endCache()
end

function PongMinigameCopy:checkCollision()
    if self.ball:collidesWith(self.right_paddle.bounce_collider) then
        local px, py = self.right_paddle.x, (self.right_paddle.y + (self.right_paddle:getScaledHeight()/2))
        self.ball.physics.direction = Utils.angle(px, py, self.ball:getPosition())
        Assets.playSound("bump",5,1)
    end
    if self.ball:collidesWith(self.left_paddle.bounce_collider) then
        local px, py = self.left_paddle.x, (self.left_paddle.y + (self.left_paddle:getScaledHeight()/2))
        self.ball.physics.direction = Utils.angle(px, py, self.ball:getPosition())
        Assets.playSound("bump",5,1)
    end
end

function PongMinigameCopy:checkInput()
    if Input.down("up") then
        self.right_paddle:processInput("up")
    end
    if Input.down("down") then
        self.right_paddle:processInput("down")
    end
    if (self.left_paddle.y + (self.left_paddle:getScaledHeight()/2)) - 20 > self.ball.y then
        self.left_paddle:processInput("up")
    end
    if (self.left_paddle.y + (self.left_paddle:getScaledHeight()/2)) + 20 < self.ball.y then
        self.left_paddle:processInput("down")
    end

    self.left_paddle.y = Utils.clamp(self.left_paddle.y, 0, self.height - self.left_paddle:getScaledHeight())
    self.right_paddle.y = Utils.clamp(self.right_paddle.y, 0, self.height - self.right_paddle:getScaledHeight())
end

---@param obj Object
function PongMinigameCopy:checkSolidCollision(obj)
    Object.startCache()
    if obj:collidesWith(self.bounds_collider) then
        Object.endCache()
        return true
    end
    if obj.last_x+(obj:getScaledWidth()/2) < (self.left_paddle.x + (self.left_paddle:getScaledWidth())) then
        if obj:collidesWith(self.left_paddle) then
            Object.endCache()
            return true
        end
    end
    if obj.last_x-(obj:getScaledWidth()/2) > (self.right_paddle.x) then
        if obj:collidesWith(self.right_paddle) then
            Object.endCache()
            return true
        end
    end
    -- TODO: When implementing obstacles, check for collision here.
    Object.endCache()
    return false
end

return PongMinigameCopy