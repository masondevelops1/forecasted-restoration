return {
    ---@param cutscene BattleCutscene
    tomorrow = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Tomorrow.")

        cutscene:battlerText(enemy, "tomorrow.")

        -- Susie text
        cutscene:setSpeaker("susie")
        cutscene:text("* WHAT DO YOU MEAN TOMORROW????", "orange/teeth_b")

        cutscene:setSpeaker(nil)
        cutscene:battlerText(enemy, "tomorrow.")
    end
}