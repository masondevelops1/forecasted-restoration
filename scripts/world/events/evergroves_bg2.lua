local EvergrovesBG, super = Class(Event)

function EvergrovesBG:init(data)
    super.init(self, data)
    
    self.parts = {
        ["castle"] = Game.world:spawnObject(Sprite("backgrounds/mangroves", 134, 0), 0.01),
        ["housesbackground"] = Game.world:spawnObject(Sprite("backgrounds/housesbackground", 134, -300), 0.01),
        ["treesbackground"] = Game.world:spawnObject(Sprite("backgrounds/treesbackground", 40, -300), 0.02),
        ["housesmidground"] = Game.world:spawnObject(Sprite("backgrounds/housesmidground", 258, -200), 0.03),
        ["treesmidground"] = Game.world:spawnObject(Sprite("backgrounds/treesmidground", 1310, -200), 0.04),
        ["housesforeground"] = Game.world:spawnObject(Sprite("backgrounds/housesforeground", 74, -100), 0.05),
        ["treesforeground"] = Game.world:spawnObject(Sprite("backgrounds/treesforeground", 148, -100), 0.06),
    }

    self.parts["castle"]:setParallax(1.11, 0.05)
    self.parts["castle"].wrap_texture_x = true

    self.parts["housesbackground"]:setParallax(1.11, 0.1)
    self.parts["housesbackground"].wrap_texture_x = true

    self.parts["treesbackground"]:setParallax(1.11, 0.1)
    self.parts["treesbackground"].wrap_texture_x = true

    self.parts["housesmidground"]:setParallax(1.09, 0.2)
    self.parts["housesmidground"].wrap_texture_x = true

    self.parts["treesmidground"]:setParallax(1.07, 0.2)
    self.parts["treesmidground"].wrap_texture_x = true

    self.parts["housesforeground"]:setParallax(1.05, 0.3)
    self.parts["housesforeground"].wrap_texture_x = true

    self.parts["treesforeground"]:setParallax(1.01, 0.3)
    self.parts["treesforeground"].wrap_texture_x = true
end

return EvergrovesBG
