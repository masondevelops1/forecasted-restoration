---@class ConnectionPopup: Object
local ConnectionPopup, super = Class(Object)

---@param state "CONNECTED"|"FAULTY"
function ConnectionPopup:init(state)
    super.init(self, 0, SCREEN_HEIGHT, 97, 125)
    self:setScale(2)
    self:setLayer(WORLD_LAYERS["below_ui"])
    self.timer = self:addChild(Timer())
    self.text = Text(nil, 9, 98)
    self.text.font_size = 16
    self:addChild(self.text)
    self.text:setColor(Utils.hexToRgb("#ffa546"))
    self.text:addFX(OutlineFX(Utils.hexToRgb("#8b331e7f"), {thickness = 1}))
    -- TODO: Fix this showing up way too brightly
    self.text:addFX(OutlineFX(Utils.hexToRgb("#45190e7f"), {thickness = 1}))
    self:setParallax(0)
    self:setOrigin(0,0)
    self.sprite = Sprite()
    self.sprite.layer = -100
    self.sound = Assets.newSound("sonar")
    self.sound2 = Assets.newSound("electric")
    self.state = state or "FAULTY"
    if self.state == "CONNECTED" then
        self.text:setText("[spacing:1] CONNECTED ")
        self.sprite:setSprite("objects/connection/connected")
    else
        self.text:setText("[spacing:4.3] FAULTY ")
        self.sprite:setSprite("objects/connection/faulty")
    end
    self:addChild(self.sprite)
    if self.state == "CONNECTED" then
        self.timer:script(function (wait)
            self.sprite:play(105/1000, true)
            self.timer:tween(0.5, self, {origin_y = 1}, "out-quad")
            wait(0.5)
            self.sound:play()
            wait(15)
            self.timer:tween(0.5, self, {origin_y = 0}, "out-quad")
            wait(0.5)
            self:remove()
        end)
    else
        self.timer:script(function (wait)
            self.timer:tween(0.5, self, {origin_y = 1}, "out-quad")
            wait(0.5)
            self.sound2:play()
            wait(5)
            self.timer:tween(0.5, self, {origin_y = 0}, "out-quad")
            wait(0.5)
            self:remove()
        end)
    end
end

function ConnectionPopup:onRemoveFromStage(parent)
    self.sound:stop()
    super.onRemoveFromStage(self, parent)
end

return ConnectionPopup