local map, super = Class(Map)

function map:init(world,data)
    super.init(self,world,data)
end

function map:onEnter()
    if Mod.shared_gonerbg then
        Mod.shared_gonerbg:remove()
        Mod.shared_gonerbg = nil
    end
    love.audio.newSource(Assets.getMusicPath"DEVICE_ON", "static"):play()
    self.world:startCutscene("device-menu.main")
    self.world.timer:after(2, function ()
        self.world.music:play("AUDIO_DRONE")
    end)
end

return map
