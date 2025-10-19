local Warstalker, super = Class(Encounter)

function Warstalker:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "[instant]Error: attempted to create non existent experiment. Attempting to recover data..."

    -- The Project Spacetime inspiration is evident here
    self.music = "mus_prebattle2"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self.warstalker = self:addEnemy("warstalker")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")

    self.timer = 0
end

function Warstalker:onReturnToWorld(events)
    -- check whether the enemies were killed
    if Game.battle.killed then
        -- run this code for each event in the table
        for _,event in ipairs(events) do
            for _,event in ipairs(event:getGroupedEnemies(true)) do
                -- set a 'dont_load' flag to true for the event,
                -- which is a special flag that will prevent the event from loading
                event:setFlag("dont_load", true)
            end
        end
    end
end

function Warstalker:update()
    super.update(self)
    
    --[[local time = math.floor(Game.battle.music:tell()) % 10
    if time == 0 or time == 2 or time == 4 or time == 6 or time == 8 then
        Game.battle.music.pitch = 1 + math.random(-0.1, 0.1)/10
    --elseif time == 2 then
      --  Game.battle.music.pitch = 1 + math.random(-0.1, 0.1)/10
    end]]

    
    if self.timer > 3 then
        Game.battle.music.pitch = Utils.random(0.4, 1.4) ^ 2
        self.timer = self.timer - Utils.random(0.5,3)
    end
    
    self.timer = self.timer + DT
    if self.warstalker.health < 1500/2 then
         self.warstalker.rotation = (math.sin(self.timer * math.random(1, 2)))/8 --for low hp
    end
    if Game.battle.enemies[1] and Game.battle.enemies[1]:canSpare() then
        if math.random(1, 2) == 1 then
            self.warstalker:setScale((math.sin(self.timer * math.random(0.1, 0.5))) * 2, 2)
        else
            self.warstalker:setScale(2, (math.sin(self.timer * math.random(0.1, 0.5))) * 2)
        end
    end
    --self.warstalker:setScale(math.sin(self.timer * 0.1)) * 2, 2)
end

return Warstalker