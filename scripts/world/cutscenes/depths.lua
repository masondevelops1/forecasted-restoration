---@type table<string, fun(cutscene:WorldCutscene)>
local depths = {}

function depths.start(cutscene)
    Game.world.music:stop()
    local kris = cutscene:getCharacter("kris")
    cutscene:fadeOut(0, {global = true})
    cutscene:detachCamera()
    cutscene:detachFollowers()
    kris:setSprite("fell")
    kris:setPosition(Game.world.map:getMarker("spawn"))
    cutscene:wait(1)
    cutscene:fadeIn(0, {global = true})
    Assets.playSound("noise")
    cutscene:wait(1)
    Assets.playSound("wing", 0.5)
    kris:shake()
    kris:setSprite("sit")
    cutscene:wait(1)
    kris:setAnimation({"landed", 0.4, next="walk"})
    cutscene:wait(2)
    kris:setFacing("left")

    Game.world.music:play("endless_expanse")

    kris:setFacing("right")
    cutscene:interpolateFollowers()
    cutscene:attachCamera()
    cutscene:wait(cutscene:attachFollowers())
end

return depths