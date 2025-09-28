local actor, super = Class(Actor, "goner1")

function actor:init()
    super.init(self)

    self.name = "Goner"
    self.width = 27
    self.height = 45

    self.hitbox = {18, 28}

    self.flip = nil

    self.path = "enemies/goner1/battle"

    self.default = "idle"


    self.voice = nil
    self.portrait_path = nil
 
    self.portrait_offset = nil

    self.can_blush = false


    self.talk_sprites = {}

    self.animations = {
        ["idle"] = {"idle", 0.25, true},
        ["battle/idle"] = {"battle/idle1", 0.25, true},
        ["hurt"] = {"hurt"}
    }

    self.offsets = {
       
        ["battle/idle"] = {0, 0},
        
    }
end

return actor