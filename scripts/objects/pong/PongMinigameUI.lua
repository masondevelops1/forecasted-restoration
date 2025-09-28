---@class PongMinigameUI: Object
---@overload fun(...): PongMinigameUI
local PongMinigameUI, super = Class(Object)

---@param game PongMinigame
function PongMinigameUI:init(game)
    super.init(self,0,(SCREEN_HEIGHT - game.height) + 56)
    self.minigame = game
    self.textbox = Textbox(30, game.height, SCREEN_WIDTH - 30, SCREEN_HEIGHT - game.height, "main_mono", nil, true)
    -- self.textbox:slideTo(self.textbox.x, self.minigame.height, 0.5, "out-cubic")
    self.score_placeholder = Sprite("objects/pongMinigame/ui/pongholder")
    self.score_placeholder:setScale(2)
    self.score_placeholder:setOrigin(0,1)
    self.score_placeholder:setHitbox(0,0,self.score_placeholder:getSize())
    self.score_placeholder.y = game.height
    self:addChild(self.score_placeholder)
    self.countdown = Sprite(nil,game.width/2,game.height - 4)
    self.countdown.path = "objects/pongMinigame/ui/countdown"
    self.countdown:setSprite("appear")
    self.countdown:setScale(4)
    self.countdown:setOrigin(0.5,1)
    self:addChild(self.countdown)
    self:addChild(self.textbox)
    self:slideTo(0, 0, 0.5, "out-cubic")
end

function PongMinigameUI:update()
    super.update(self)
    local overlapped = false
    Object.startCache()
    if self.score_placeholder:collidesWith(self.minigame.ball) then
        overlapped = true
    elseif self.score_placeholder:collidesWith(self.minigame.left_paddle) then
        overlapped = true
    elseif self.score_placeholder:collidesWith(self.minigame.right_paddle) then
        overlapped = true
    end

    Object.endCache()
    if overlapped then
        self.score_placeholder.alpha = Utils.approach(self.score_placeholder.alpha, 0.5, DT*4)
    else
        self.score_placeholder.alpha = Utils.approach(self.score_placeholder.alpha, 1, DT*4)
    end
end

function PongMinigameUI:draw()
    love.graphics.push()
    love.graphics.translate(0,Utils.floor(self.textbox.y,1))
    love.graphics.line(0,0,self.width,0)
    Draw.setColor(COLORS.black)
    love.graphics.rectangle("fill", 0, 0, self.minigame.width,self.minigame.height)
    Draw.setColor(self:getDrawColor())
    love.graphics.pop()
    super.draw(self)
    love.graphics.push()
    for i=1,3 do
        local x,y = 96 - (44 * (i-1)), 348-10
        if self.minigame.left_paddle.health >= i then
            Draw.draw(Assets.getTexture("objects/pongMinigame/ui/enemyhealth_1"), x, y, 0, 2,2)
        else
            Draw.draw(Assets.getTexture("objects/pongMinigame/ui/enemyhealth_2"), x, y, 0, 2,2)
        end
    end
    for i=1,3 do
        local x,y = 486 + (46 * (i-1)), 354-10
        if self.minigame.right_paddle.health >= i then
            Draw.draw(Assets.getTexture("objects/pongMinigame/ui/playerhealth_1"), x, y, 0, 2,2)
        else
            Draw.draw(Assets.getTexture("objects/pongMinigame/ui/playerhealth_2"), x, y, 0, 2,2)
        end
    end
    love.graphics.pop()
end

function PongMinigameUI:clearTextbox()
    self.textbox:setActor(nil)
    self.textbox:setFace(nil)
    self.textbox:setFont()
    self.textbox:setAlign("left")
    self.textbox:setSkippable(true)
    self.textbox:setAdvance(true)
    self.textbox:setAuto(false)
    self.textbox:setText("")
    for k,v in ipairs(self.textbox.minifaces) do
        v:remove()
    end
end

return PongMinigameUI