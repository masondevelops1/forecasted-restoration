local Scrapscallion, super = Class(Encounter)

function Scrapscallion:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Boom![wait:5] Bang![wait:5] Scrapscallions scrapping through!"

    -- Battle music ("battle" is rude buster)
    self.music = "crude buster"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the Scrapscallion enemy to the encounter
    self:addEnemy("scrapscallion", 482, 106)
    self:addEnemy("scrapscallion", 540, 190)
    self:addEnemy("scrapscallion", 498, 292)

    self.combo_waves = {
        "scrapscallion/mechpress_anvil_combo",
        "scrapscallion/mechpress_pipe_combo",
        "scrapscallion/mechpress_boiler_combo",
    }
    --- Uncomment this line to add another!
    --self:addEnemy("scrapscallion")
end

function Scrapscallion:onBattleEnd()
    if Plot:between("boat_act2_mapswitch", "boat_act2_scrap") then
        Plot:set("boat_act2_scrap")
    end
    super.onBattleEnd(self)
end

function Scrapscallion:getNextWaves()
    if #Game.battle.enemies == 1 then
        return super.getNextWaves(self)
    end

    local enemies = Game.battle:getActiveEnemies()
    local wave = Utils.pick(self.combo_waves)

    for _, enemy in ipairs(enemies) do
        enemy.selected_wave = wave
    end

    return {wave}
end

return Scrapscallion