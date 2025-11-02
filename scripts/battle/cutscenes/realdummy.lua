return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    smile = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* You smiled at the Guard.[wait:5] The Guard smiled back.")
        enemy.hidden_mercy = enemy.hidden_mercy + 1
        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(50)
        end
    end,
    smile2 = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* You smiled at the Guard,[wait:5] but the Guard was already smiling.")
    end,
    fluff = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* H-hey...[wait:5] just stand still Mr. Guard...", "blush_surprise_smile", "noelle")
        cutscene:text("* Noelle put some of the Guard's fluff back inside of it.")
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:text("* The Guard was very thankful!")
        enemy.hidden_mercy2 = enemy.hidden_mercy2 + 1
        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(50)
        end
    end,
    fluff2 = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* You tried to help the Guard,[wait:5] but you couldn't think of any other way to help it.")
    end,
    cry = function(cutscene, battler, enemy)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)
        cutscene:wait(0.5)
        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text("* It cries and cries,[wait:5]\n despite no tears coming out.")
        cutscene:text("* Oh![wait:10] Cry me a river!")
        cutscene:text("* What?[wait:10] You didn't say that.")

        enemy.hidden_mercy = enemy.hidden_mercy + 1
    end,
    comfort = function(cutscene, battler, enemy)
        
        cutscene:text("* Hey hey,[wait:5] no need to cry.", "smile", "ralsei")

        Assets.playSound("bump")
        enemy:shake(2, 2)
        
        cutscene:text("* You'll be okay.[wait:10] I promise.", "smile_b", "ralsei")

        Assets.playSound("bump")
        enemy:shake(2, 2)

        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.name = "Strangeman"
            attacker.text = {
                "* Strangeman seems comforted."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT 20 DF 0 \n* It still has no mouth but it is happy."
            attacker:setAnimation("grow")
        end

        cutscene:text("* Strangeman seems to appriciate that.")

    end,
}