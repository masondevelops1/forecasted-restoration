---@type table<string, fun(cutscene:BattleCutscene, battler:PartyBattler?, enemy:EnemyBattler?)>
local scrapscallion = {
    susie_punch = function (cutscene, battler, enemy)
        cutscene:text("* Susie bashed into the scrapscallion!")
        Assets.playSound("damage")
        enemy:shake()
        enemy:addMercy(4)
        cutscene:wait(1)
        cutscene:text("* Somehow, a loose screw got tightened.")
    end
}

return scrapscallion