local actor, super = Class(Actor, "goner1_lw")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Goner"

    -- Width and height for this actor, used to determine its center
    self.width = 18
    self.height = 28

    -- Color for this actor used in outline areas (optional, defaults to red)
    

    -- Whether this actor flips horizontally (optional, values are "right" or "left", indicating the flip direction)
    self.flip = nil

    -- Path to this actor's sprites (defaults to "")
    self.path = "enemies/goner1"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "goner1"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of talk sprites and their talk speeds (default 0.25)
    self.talk_sprites = {}

    -- Table of sprite animations
    self.animations = {
        -- Looping animation with 0.25 seconds between each frame
        -- (even though there's only 1 idle frame)
        ["idle"] = {"idle", 0.25, true},
        ["battle/idle"] = {"battle/idle1", 0.25, true},
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Since the width and height is the idle sprite size, the offset is 0,0
        ["battle/idle"] = {0, 0},
        
    }
end

return actor