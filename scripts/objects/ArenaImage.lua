local ArenaImage, super = Class(Object)

function ArenaImage:init()
    super.init(self)
    local image_sprite = Sprite("objects/arena_image")
    self.left_side = AfterImage(image_sprite, 1, 0.1)
    self.right_side = AfterImage(image_sprite, 1, 0.1)
    self.bottom_side = AfterImage(image_sprite, 1, 0.1)
    self.top_side = AfterImage(image_sprite, 1, 0.1)
    self.left_side.x, self.left_side.y = 246, 170
    self.right_side.x, self.right_side.y = 390, 170
    self.bottom_side.x, self.bottom_side.y = 320, 240
    self.top_side.x, self.top_side.y = 320, 100
    self.left_side.rotation = math.rad(180)
    self.right_side.rotation = math.rad(0)
    self.bottom_side.rotation = math.rad(270)
    self.top_side.rotation = math.rad(90)
    self.left_side.physics.direction = self.left_side.rotation
    self.right_side.physics.direction = self.right_side.rotation
    self.bottom_side.physics.direction = self.bottom_side.rotation
    self.top_side.physics.direction = self.top_side.rotation
    self.left_side:setOrigin(0.5)
    self.right_side:setOrigin(0.5)
    self.bottom_side:setOrigin(0.5)
    self.top_side:setOrigin(0.5)
    self.left_side.physics.speed = 5
    self.right_side.physics.speed = 5
    self.bottom_side.physics.speed = 5
    self.top_side.physics.speed = 5
    self:addChild(self.left_side)
    self:addChild(self.right_side)
    self:addChild(self.bottom_side)
    self:addChild(self.top_side)

    Game.battle.waves[1].timer:every(2, function ()
        self.left_side.sprite = image_sprite
        self.right_side.sprite = image_sprite
        self.bottom_side.sprite = image_sprite
        self.top_side.sprite = image_sprite
        self:addChild(self.left_side)
        self:addChild(self.right_side)
        self:addChild(self.bottom_side)
        self:addChild(self.top_side)
    end)
end

return ArenaImage