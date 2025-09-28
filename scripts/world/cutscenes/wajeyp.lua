return {
  

kriswakeup = function(cutscene, event)
  local kris = cutscene:getCharacter("kris")
  kris:setSprite("fell")
  cutscene:wait(3)
  cutscene:shakeCharacter("kris")
  kris:setSprite("sit")
  cutscene:wait(2.5)
  cutscene:shakeCharacter("kris")
  cutscene:wait(1)
  cutscene:shakeCharacter("kris")
  cutscene:wait(0.2)
  kris:resetSprite()
  cutscene:look(kris, "right")
end,

}
