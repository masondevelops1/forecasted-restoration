return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    cry = function(cutscene, battler, enemy)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text("* It cries and cries,[wait:5]\nbut no tears come out.")

        enemy.hidden_mercy = enemy.hidden_mercy + 1
    end,
    comfort = function(cutscene, battler, enemy)
        
        cutscene:text("* H-Hey...[wait:5] no need to cry.", "sad_b", "noelle")

        Assets.playSound("bump")
        enemy:shake(2, 2)
        
        cutscene:text("* You'll be okay.[wait:10] I promise.", "smile_closed", "noelle")
        cutscene:text("* Yeah![wait:5] We're cheering you on!", "closed_grin", "susie")
        Assets.playSound("bump")
        enemy:shake(2, 2)

        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.text = {
                "* The Guard seems comforted."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT 6 DF 0 \n* It's ready to go into hibernation."
        end

        cutscene:text("* The Guard seems to appriciate that.")
    end,
}