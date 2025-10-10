---@class PongMinigame: Object
---@overload fun(): PongMinigame
local PongMinigame, super = Class(Object)

function PongMinigame:init()
    super.init(self, 0,0,SCREEN_WIDTH, SCREEN_HEIGHT - 90)
    self.timer = self:addChild(Timer())
    self.bounds_collider = ColliderGroup(self, {
        LineCollider(nil, 0, 0, self.width, 0),
        LineCollider(nil, 0, self.height, self.width, self.height),
    })
    self.bounds_collider = Hitbox(self,0,0,self:getSize())
    self.bounds_collider.invert = true
    self.bounds_collider.inside = true -- Collider inside me

    Music:stop()
    Game.world.music:play("pingpong")
    self.left_paddle = self:addChild(PongPaddle("objects/pongMinigame/opponentHit", 0, 160))
    self.left_paddle:setHitbox(0,0,self.left_paddle:getSize())
    self.left_paddle.sprite.y = self.left_paddle.height * -0.25
    self.right_paddle = self:addChild(PongPaddle("objects/pongMinigame/playerHit", 0, 160))
    self.right_paddle:setHitbox(0,0,self.right_paddle:getSize())
    self.right_paddle.sprite.x = -self.right_paddle.width
    self.ball = self:addChild(PongBall())
    self.ball:setHitbox(0,0,self.ball:getSize())
    self.ball:setScale(2) -- TODO: Change this when we have sprites
    self.left_paddle:setScale(2)
    self.right_paddle:setScale(2)
    self.left_paddle.bounce_collider = LineCollider(self.left_paddle, self.left_paddle.width, 0, self.left_paddle.width, self.left_paddle.height)

    self.left_paddle.x = 4
    self.right_paddle.x = (self.width - self.right_paddle:getScaledWidth()) - 4
    self.ball:setOrigin(0.5)
    self.left_paddle.speed = 3.2
    
    self.ui = PongMinigameUI(self)
    self:addChild(self.ui)
    self:finishRound()
end

---@return boolean done
---@return boolean victory
function PongMinigame:isDone()
    return self.victory ~= nil, self.victory or false
end


-- Makes a cutscene wait until this minigame is done.
---@param cutscene Cutscene
---@async
---@return boolean victory Whether the player won.
function PongMinigame:await(cutscene)
    return cutscene:wait(function () return self:isDone() end)
end

function PongMinigame:draw()
    super.draw(self)
    if DEBUG_RENDER then
        self.ball.collider:drawFor(self)
        local done, won = self:isDone()
        if done then
            love.graphics.print("DONE!" .. (won and " WON!" or " ...loser."))
        end
    end
end

---@overload fun(func:fun(cutscene:PongCutscene))
function PongMinigame:startCutscene(group, id, ...)
    if self.cutscene and not self.cutscene.ended then
        local cutscene_name = ""
        if type(group) == "string" then
            cutscene_name = group
            if type(id) == "string" then
                cutscene_name = group.."."..id
            end
        elseif type(group) == "function" then
            cutscene_name = "<function>"
        end
        if self.cutscene.interruptable then
            self:stopCutscene()
        else
            error("Attempt to start a cutscene "..cutscene_name.." while already in cutscene "..self.cutscene.id)
        end
    end
    self.cutscene = PongCutscene(self, group, id, ...)
    return self.cutscene
end

-- Starts a cutscene if the current one is interruptable
function PongMinigame:tryStartCutscene(group, id, ...)
    if self.cutscene then
        if not self.cutscene.interruptable then return end
        self:stopCutscene()
    end
    self:startCutscene(group, id, ...)
end

-- Starts a cutscene even if there's already one
function PongMinigame:forceStartCutscene(group, id, ...)
    if self.cutscene then
        self:stopCutscene()
    end
    self:startCutscene(group, id, ...)
end

function PongMinigame:stopCutscene()
    if not self.cutscene then
        error("Attempt to stop a cutscene while none are active.")
    end
    self.ui:clearTextbox()
    self.cutscene:onEnd()
    if coroutine.status(self.cutscene.coroutine) == "running" then
        coroutine.yield(self.cutscene)
    end
    self.cutscene = nil
end

function PongMinigame:update()
    if self.cutscene then
        if not self.cutscene.ended then
            self.cutscene:update()
        end
        if self.cutscene.ended then
            self.cutscene = nil
        end
    end
    super.update(self)
    self:checkInput()
    Object.startCache()
    self:checkCollision()
    Object.endCache()
end

function PongMinigame:checkCollision()
    local direction_count = 32
    if self.ball:collidesWith(self.right_paddle.bounce_collider) then
        local px, py = self.right_paddle.x, (self.right_paddle.y + (self.right_paddle:getScaledHeight()/2))
        self.ball.physics.direction = Utils.round(Utils.angle(px+20, py, self.ball:getPosition()), math.pi/(direction_count/2))
        Assets.playSound("bump",5,1)
        self.right_paddle:onBounce(self.ball)
    end
    if self.ball:collidesWith(self.left_paddle.bounce_collider) then
        local px, py = self.left_paddle.x, (self.left_paddle.y + (self.left_paddle:getScaledHeight()/2))
        self.ball.physics.direction = Utils.round(Utils.angle(px-20, py, self.ball:getPosition()), math.pi/(direction_count/2))
        Assets.playSound("bump",5,1)
        self.left_paddle:onBounce(self.ball)
    end
end

function PongMinigame:checkInput()
    if self.locked then return end
    if Input.down("up") then
        self.right_paddle:processInput("up")
    end
    if Input.down("down") then
        self.right_paddle:processInput("down")
    end
    
    local ai_dir = self:getAIDirection(self.left_paddle)
    if ai_dir then
        self.left_paddle:processInput(ai_dir)
    end

    self.left_paddle.y = Utils.clamp(self.left_paddle.y, 0, self.height - self.left_paddle:getScaledHeight())
    self.right_paddle.y = Utils.clamp(self.right_paddle.y, 0, self.height - self.right_paddle:getScaledHeight())
end

---@param paddle PongPaddle
---@return "up"|"down"?
function PongMinigame:getAIDirection(paddle)
    if (paddle.y + (paddle:getScaledHeight()/2)) - 20 > self.ball.y then
        return "up"
    end
    if (paddle.y + (paddle:getScaledHeight()/2)) + 20 < self.ball.y then
        return "down"
    end
end

---@param paddle PongPaddle
function PongMinigame:hurtPaddle(paddle)
    paddle:hurt()
    self:finishRound(paddle)
end

---@param losing_paddle PongPaddle?
function PongMinigame:finishRound(losing_paddle)
    self.ball.visible = false
    self.ball.collidable = false
    self.ball.active = false
    self.timer:script(function (wait)
        if self.left_paddle.health <= 0 then
            self:doEnding(wait, self.left_paddle)
        elseif self.right_paddle.health <= 0 then
            self:doEnding(wait, self.right_paddle)
        else
            wait(.5)
            self.timer:after(0, function ()
                self:tryStartCutscene("pirates.preroundstart", losing_paddle)
            end)
            wait(.5)
            self:doRoundIntro(wait)
        end
    end)
end

---@param wait fun(n)
---@param loser PongPaddle
function PongMinigame:doEnding(wait, loser)
    self.left_paddle:slideTo(self.left_paddle.x, 160, 1, "out-quad")
    self.right_paddle:slideTo(self.right_paddle.x, 160, 1, "out-quad")
    self.locked = true
    Game.world.music:stop()
    --[[local handle = self.timer:every(1, function ()
        loser:explode(Utils.random(-20, 20), Utils.random(-40, 40))
    end)]]
    wait(2.5)

    self.old_x = self.left_paddle.x
    self.old_y = self.left_paddle.y

    local shake = self.timer:every(1/30, function ()
        self.left_paddle.x = self.old_x + love.math.random(-2, 2)
        self.left_paddle.y = self.old_y + love.math.random(-2, 2)
    end)

    self:startCutscene("pirates.victory", loser):after(function ()
        self.timer:cancel(shake)
        loser:fadeTo(0, 2)
        self.timer:tween(2, loser.sprite, {scale_x = 0, scale_y = 0}, "in-quad")
        self.timer:after(2, function ()
            loser.sprite:explode()
            self.timer:after(2, function ()
                if self.left_paddle == loser then
                    self.victory = true
                else
                    self.victory = false
                end
            end)
        end)
    end)
end

---@param wait fun(n)
function PongMinigame:doRoundIntro(wait)
    local resume
    resume = coroutine.wrap(function ()
        local sprites = {"three","two","one"}
        self.ui.countdown:setAnimation({"appear", 0.1, callback = resume})
        coroutine.yield()
        for i=1,3 do
            self.ui.countdown:setAnimation({sprites[i], 0.1, callback = resume})
            coroutine.yield()
            Assets.playSound("bell", 1, .5 + ((i-1)/4))
            self.timer:after(0.8, resume)
            coroutine.yield()
        end
        self.ui.countdown:setAnimation({"retreat", 0.1})
        self.left_paddle.sprite.x = self.left_paddle.sprite.x - 2
        
        self.left_paddle.sprite:setAnimation({"opponentShoot", 0.1, callback = resume})
        coroutine.yield()
        self.left_paddle.sprite.x = self.left_paddle.sprite.x + 2
        Assets.playSound("cannonball", 1)
        self.left_paddle.sprite:setAnimation({"opponentShootRetract", 0.1, callback = function ()
            self.left_paddle.sprite:setSprite("opponentHit")
            resume()
        end})
        coroutine.yield()
        self:startRound()
        end)
    resume()
end

function PongMinigame:startRound()
    self.ball:setPosition(self.width/2, self.height/2)
    self.ball.physics.speed = 8
    self.ball.physics.direction = 0
    self.ball.x = self.left_paddle.x + self.left_paddle:getScaledWidth() + 10
    self.ball.y = self.left_paddle.y + (self.left_paddle:getScaledHeight()/2)
    self.ball:setParent(self)
    self.ball.active = true
    self.ball.visible = true
    self.ball.collidable = true
end

---@param obj Object
function PongMinigame:checkSolidCollision(obj)
    Object.startCache()
    if obj:collidesWith(self.bounds_collider) then
        Object.endCache()
        return true
    end
    if obj.last_x+(obj:getScaledWidth()/2) < (self.left_paddle.x + (self.left_paddle:getScaledWidth())) then
        if obj:collidesWith(self.left_paddle) then
            if obj == self.ball then
                self:hurtPaddle(self.left_paddle)
            end
            Object.endCache()
            return true
        end
    end
    if obj.last_x-(obj:getScaledWidth()/2) > (self.right_paddle.x) then
        if obj:collidesWith(self.right_paddle) then
            if obj == self.ball then
                self:hurtPaddle(self.right_paddle)
            end
            Object.endCache()
            return true
        end
    end
    -- TODO: When implementing obstacles, check for collision here.
    Object.endCache()
    return false
end

return PongMinigame