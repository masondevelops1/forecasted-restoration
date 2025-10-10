local wave, super = Class(Wave, "scrapscallion/anvil")

function wave:init()
    super.init(self)

    self:setArenaSize(150, 200)

    self.spawnTimer = 1

    self.time = 12
end

function wave:onStart()
    self.timer:script(function (wait)
        while true do
            wait(self.spawnTimer)
            local x,y = love.math.random(Game.battle.arena.left+25, Game.battle.arena.right-25), Game.battle.arena.top
            print(x, y)
            self:spawnBulletTo(Game.battle.mask, "scrapscallion/anvil", x, y, math.pi*1.5, 0)
            if self.spawnTimer > 0.4 then
            self.spawnTimer = self.spawnTimer -0.075
            end
        end
    end)
end

return wave