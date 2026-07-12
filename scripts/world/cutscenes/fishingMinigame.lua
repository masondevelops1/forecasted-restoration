return {
    fish = function(cutscene)
        kris = cutscene:getCharacter("kris")
        local count = "three"
        for i = 1,4 do
            local countdown = Sprite("objects/fishing-assets/screen-elements/" ..count.. "-countdown", SCREEN_WIDTH/2, SCREEN_HEIGHT/2)
            countdown.layer = WORLD_LAYERS["top"]
            countdown:setScale(2)
            countdown.alpha = 0
            Game.world:addChild(countdown)
            Game.world.timer:tween(0.25, countdown, { alpha = 1 }, "out-cubic")
            cutscene:wait(0.25)
            if i == 1 then
                count = "two"
            elseif i == 2 then
                count = "one"
            elseif i == 3 then
                count = "go"
            else
                count = "DONE"
            end
            cutscene:wait(0.5)
            Game.world.timer:tween(0.25, countdown, { alpha = 0 }, "out-cubic")
            cutscene:wait(0.25)
            Game.world:removeChild(countdown)
        end
        if count == "DONE" then
            kris:setSprite("fishing")
            kris:play()
        end
    end
}