local MyEncounter, super = Class(Encounter)

function MyEncounter:init()
    super.init(self)
    self.background = false
    self.music = nil
    -- Dummy enemy required to prevent a crash
    self:addEnemy("omnis_boss")
    self.waves = {}
end

function MyEncounter:onBattleInit()
    Game.battle.battle_ui:slideTo(0,440,.2, "out-quad")
    Game.battle.battle_ui.shown = true
    Game.battle.tension_bar.shown = true
    for _,battler in ipairs(Game.battle.party) do
        if Game.battle.party_world_characters[battler.chara.id] then
            Game.battle.party_world_characters[battler.chara.id].visible = true
            battler.visible = false
        end
    end
    -- Hack for funnyFeline looking nice
    if Game.battle.background then
        Game.battle.background:remove()
    end
end

function MyEncounter:onStateChange(old, new)
    print(old, "->", new)
    if old == "DEFENDINGEND" then
        Game.battle.current_selecting = 0
        Game.battle.active = false
        Game.stage.timer:after(0, function ()
            Game.battle:returnToWorld()
        end)
        Game.battle:setState("NONE")
    elseif old == "DEFENDING" then
        Game.stage.timer:tween(0.2, Game.battle.battle_ui, {y = 482}, "out-quad", function ()
        end)
    end
end

return MyEncounter