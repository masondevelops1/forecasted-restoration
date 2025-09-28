---@class Map.gateway.chase_spiral : Map
local map, super = Class(Map)

function map:init(world,data)
    self.collision_layers = self.collision_layers or {}
    super.init(self,world,data)
    self.collision_layers = self.collision_layers or {}
end

function map:onEnter()
    self:getTileLayer("battleborder_2"):addFX(AlphaFX(0))
    self:getTileLayer("battleborder_1"):addFX(AlphaFX(1))
    self:getTileLayer("Tile Layer 2").alpha = 0.5
    for index, value in ipairs(self.collision_layers.collision_2) do
        value.collidable = false
    end
    self.layer2 = self:getTileLayer("Tile Layer 2")
    self.layer2.fx = self.layer2:addFX(RecolorFX(0.7,0.7,0.7))
    self.layer1 = self:getTileLayer("Tile Layer 1")
    self.overlay_mask = Game.world.battle_fader:addFX(MaskFX(function ()
        if self.layer1.parent then
            return self.layer1
        end
        return self.layer2
    end))
end

function map:onExit()
    Game.world.battle_fader:removeFX(self.overlay_mask)
end

function map:loadObject(name, data)
    if name == "descent_trigger" then
        local ev = Event(data)
        ---@param ev Event
        ---@param chara Player
        ev.onEnter = function (ev, chara)
            if not chara.is_player then return end
            ev:remove()
            -- for index, value in ipairs(Game.world.map.collision_layers.collision_2) do
            --     value.collidable = true
            -- end
            Game.world:startCutscene(function (cutscene)
                ---@cast cutscene WorldCutscene
                cutscene:detachFollowers()
                local tx, ty = ev.x+(ev.width/2), ev.y+(ev.height/2)
                local kris, susie, noelle = cutscene:getCharacter("kris_lw"), cutscene:getCharacter("susie_lw"), cutscene:getCharacter("noelle_lw")
                Assets.stopAndPlaySound("jump")
                cutscene:jumpTo(kris, tx,ty, 8, 1, "fall", "fall")
                cutscene:wait(0.2)
                self:getTileLayer("Tile Layer 1"):fadeOutAndRemove(0.4)
                self:getTileLayer("Tile Layer 1").physics.speed_y = -5
                self.timer:tween(.4,self:getTileLayer("battleborder_1"):getFX(AlphaFX), {alpha = 0})
                self:getTileLayer("battleborder_1").physics.speed_y = -5
                self.timer:tween(.4,self:getTileLayer("battleborder_2"):getFX(AlphaFX), {alpha = 1})
                self.timer:tween(.4,self.layer2, {fx = {color={1,1,1}}, alpha = 1})
                -- self:getTileLayer("Tile Layer 2").alpha = 1 - self:getTileLayer("Tile Layer 2").alpha
                for index, value in ipairs(self.collision) do
                    value.collidable = not value.collidable
                end
                Assets.stopAndPlaySound("jump")
                cutscene:jumpTo(susie, tx,ty, 8, 1, "fall", "fall")
                cutscene:wait(0.2)
                Assets.stopAndPlaySound("jump")
                cutscene:wait(cutscene:jumpTo(noelle, tx,ty, 8, 1))
                cutscene:interpolateFollowers()
                cutscene:wait(cutscene:attachFollowers(20))
            end)
            -- Game.world.player:slideTo(ev.x+(ev.width/2), ev.y+(ev.height/2), 0.2)
        end
        return ev
    end
    return super.loadObject(self, name, data)
end

function map:loadCollision(layer)
    local hitboxes = self:loadHitboxes(layer)
    self.collision_layers = self.collision_layers or {}
    self.collision_layers[layer.name] = hitboxes
    Utils.merge(self.collision, hitboxes)
end

return map