return {
    -- The inclusion of the below line tells the language server that the first parameter of the cutscene is `BattleCutscene`.
    -- This allows it to fetch us useful documentation that shows all of the available cutscene functions while writing our cutscenes!

    ---@param cutscene BattleCutscene
    talk = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Uh,[wait:5]\n* Hey,[wait:5] we're actually here to give you a new directive.", "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text("* It seems to be ready to get a new directive.")

        enemy.hidden_mercy = enemy.hidden_mercy + 1
    end,
    talk2 = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* You tried to talk,[wait:5] but you had nothing to say.")
    end,
    directive = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Alright,[wait:5] your uh...[wait:5] new directive is to...[wait:5]\n* Spare us,[wait:5] yeah.", "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text("* It accepted the new directive!")
        for _, attacker in ipairs(Game.battle.enemies) do
            attacker:addMercy(100)
            attacker.text = {
                "* The Guard seems to be at ease."
            }
            attacker.waves = {
                nil
            }
            attacker.check = "AT ?? DF 0 \n* It's forgotten who it once was."
            attacker:setAnimation("grow")
        end
    end,
    failed = function(cutscene, battler, enemy)
        -- Open textbox and wait for completion
        cutscene:text("* Alright,[wait:5] you uh...[wait:5] have a new directive...[wait:5]\n* Spare us.", "nervous_side", "susie")

        Assets.playSound("bump")
        enemy:shake(3, 3)

        cutscene:text("* But it didn't believe you.")
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