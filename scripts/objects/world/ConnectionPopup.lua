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
    self.text:addFX(OutlineFX(Utils.hexToRgb("#8b331e"), {thickness = 1}))
    -- TODO: Fix this showing up way too brightly
    self.text:addFX(OutlineFX(Utils.hexToRgb("#45190e"), {thickness = 1}))
    self:setParallax(0)
    self:setOrigin(0,0)
    self.sprite = Sprite()
    self.sprite.layer = -100
    self.sound = Assets.newSound("sonar")
    self.state = state or "CONNECTED"
    if self.state == "CONNECTED" then
        self.text:setText("[spacing:1] CONNECTED ")
        self.sprite:setSprite("objects/connection/connected")
    end
    self:addChild(self.sprite)
    self.timer:script(function (wait)
        self.sprite:play(70/1000, true)
        self.timer:tween(0.5, self, {origin_y = 1}, "out-quad")
        wait(0.5)
        self.sound:play()
        wait(7)
        self.timer:tween(0.5, self, {origin_y = 0}, "out-quad")
        wait(0.5)
        self:remove()
    end)
end

function ConnectionPopup:onRemoveFromStage(parent)
    self.sound:stop()
    super.onRemoveFromStage(self, parent)
end

return ConnectionPopup