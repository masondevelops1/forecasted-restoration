return {
  
sailor = function (cutscene) 

  local text = DialogueText("", 120, 24, (SCREEN_WIDTH - 50 * 2) + 14, SCREEN_HEIGHT, nil, "GONER")
  text.parallax_x = 0
  text.parallax_y = 0
  text.layer = WORLD_LAYERS["textbox"]
  Game.world:addChild(text)
  
  text.alpha = 0
  local textWait = function() return text:isDone() end

  Game.world.timer:tween(1, text, { alpha = 1 })
 
  
  text:setText("[voice:none]My [wait:40]new [wait:8.5]life, [wait:37]be[wait:9]low [wait:10]the [wait:9]stars. ")
  cutscene:wait(7.5)
  text:setText("[voice:none]My[wait:9] world[wait:30] has[wait:8] changed-[wait:45] \nand[wait:1] it's[wait:2] stran[wait:7]ger[wait:2] than[wait:8] be[wait:2]fore.[wait:4]")
  cutscene:wait(8.4)
  text:setText("[voice:none]Ev[wait:40]en [wait:8.5]still [wait:37]I [wait:9]row [wait:10]a[wait:9]long. ")
  cutscene:wait(6.5)
  text:setText("[voice:none]My [wait:9]world [wait:40]is [wait:9]changed, \n[wait:40]and[wait:10] I,")
  cutscene:wait(5.9)
  text:setText("[voice:none]I [wait:2]don't [wait:2]mind, [wait:8]I've \n[wait:5]got [wait:2]my [wait:3]raft [wait:3]with [wait:2]me! ")
  cutscene:wait(7)
  text:setText("")
  
end
}
