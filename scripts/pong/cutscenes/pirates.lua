---@type table<string, fun(cutscene:PongCutscene,...)>
local pirates = {
    start = function (cutscene)
        cutscene:text([=[
[miniface:ralsei]Yer ship ain't made to take all
these cannonballs!
]=], nil, "pirates/ralsei")

        cutscene:text("[miniface:kris]Show them Cap'n!!!", nil, "pirates/kris")

        cutscene:text("* I can keep batting these things all day!!", "smile", "susie")

        cutscene:text("[miniface:scientist]Greetings.")

        cutscene:text("* AHH!!", "teeth_b", "susie")
        cutscene:text("* WHAT THE HELL ARE YOU DOING HERE?!", "teeth", "susie")

        cutscene:text("[miniface:scientist]So...[wait:10]\n[miniface:scientist]You're fighting the pirates huh?")
        cutscene:text("[miniface:scientist]I guess the gig is up.[wait:10]")
        cutscene:text("[miniface:scientist]Not like I actually cared to help them,[wait:5] of course")
        cutscene:text("[miniface:scientist]They made a big ruckus in the hall...[wait:5]\n[miniface:scientist]I was bound to hear them.")
        cutscene:text("[miniface:scientist]Really,[wait:5]\nwhat a terrible plan they had.")
        cutscene:text("[miniface:scientist]If it wasnt for me th-", nil, nil, {auto=true})

        cutscene:text("* SHUT UP!!!!", "teeth", "susie")
        cutscene:text("* GET OUT OF HERE!!!!", "teeth_b", "susie")

        cutscene:text("[miniface:scientist]...")
        cutscene:text("[miniface:scientist]I'll leave you to it...")
        
    end,

    playerGetHit = function (cutscene)
        cutscene:text("* Kris! Watch out!", "angry", "susie")
        cutscene:text([=[
[miniface:noelle]YAAAHAHAHAHA
]=], nil, "pirates/noelle")

        cutscene:text([=[
[miniface:noelle]I'll be so glad to watch ye ship 
sink down below...
]=], nil, "pirates/noelle")

cutscene:text([=[
[miniface:susie]DID YA SEE THAT CAPTAIN?
[miniface:susie]I HIT EM,[wait:5] I JUST HIT EM!
]=], nil, "pirates/susie")
cutscene:text([=[
[miniface:ralsei]Aye I saw it, I saw it! 
[miniface:ralsei]Now KEEP SHOOTING AT THEM!!!
]=], nil, "pirates/ralsei")

    end,

    enemyGetHitA = function (cutscene)
        cutscene:text("* HA![wait:5]\n* How do you like that?!", "teeth", "susie")
        cutscene:text([=[
[miniface:ralsei]Yarghhh,[wait:5] tis' but a scratch!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]Me ship has taken worse blows 
before!
]=], nil, "pirates/ralsei")
    end,

    enemyGetHitB = function (cutscene)
        cutscene:text([=[
[miniface:kris]Watch out Cap'n!
[miniface:ralsei]Calm down![wait:10] Calm down!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]Me ship ain't going down just yet!!
[miniface:ralsei]YAHAHA-[wait:5] huh
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]Is that-[wait:10]
[miniface:ralsei]SCALLYWAG,[wait:5] THE SHIP IS LEAKING!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT!
[miniface:ralsei]THE SHIP IS LEAKING!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT?!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]THE SHIP
[miniface:ralsei]IS BLOODY LEAKING!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:susie]WHAT
[miniface:ralsei]FOR GOODNESS SAKE!!!!!!!!!!!
]=], nil, "pirates/ralsei")

        cutscene:text([=[
[miniface:ralsei]It don't matter,[wait:5] we can 
keep going on a little more...
]=], nil, "pirates/ralsei")
    end,


    victory = function (cutscene)
        cutscene:text([=[
[miniface:ralsei]NO!!!!!
[miniface:ralsei]THIS CAN'T BE HAPPENING!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]ME SHIP, ME PRECIOUS SHIP!
]=], nil, "pirates/ralsei")
        cutscene:text("* Hell yeah![wait:10] How do you like THAT!", "teeth_smile", "susie")
        cutscene:text([=[
[miniface:ralsei]Don't ye see what ye have done!?[wait:10]
[miniface:ralsei]Ye stressing me parrot out!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:susie]DON'T WORRY BOSS IM HERE WITH YE
]=], nil, "pirates/susie")
cutscene:text([=[
[miniface:susie]EVEN THO YE MAROONED ME THAT ONE
TIME
]=], nil, "pirates/susie")
        cutscene:text([=[
[miniface:noelle]Would never ditch ye,[wait:5] Captain![wait:10]
[miniface:kris]Damn it!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:noelle]We were SO CLOSE!!!!!!
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]There ain't nothing to do about
it now,[wait:5] me hearties...        
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]A good captain goes down with
his ship...
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[miniface:ralsei]And so does a good crew...
]=], nil, "pirates/ralsei")
        cutscene:text([=[
[image:face/mini/pirates/kris_1][image:face/mini/pirates/susie_1][image:face/mini/pirates/noelle_1] Aye aye, Captain...
[miniface:ralsei]Aye aye...
]=], nil, "pirates/ralsei")
    end,

    ---@param losing_paddle PongPaddle?
    preroundstart = function (cutscene, losing_paddle)
        local player_won = losing_paddle == cutscene.game.left_paddle
        local player_hp = cutscene.game.right_paddle.health
        local enemy_hp = cutscene.game.left_paddle.health
        
        if not losing_paddle then
            cutscene:gotoCutscene("pirates.start")
        elseif player_won then
            if enemy_hp == 2 then
                cutscene:gotoCutscene("pirates.enemyGetHitA")
            elseif enemy_hp == 1 then
                cutscene:gotoCutscene("pirates.enemyGetHitB")
            end
        else
            cutscene:gotoCutscene("pirates.playerGetHit")
        end
    end,


    ---@param losing_paddle PongPaddle?
    game_end = function (cutscene, losing_paddle)
        local player_won = losing_paddle == cutscene.game.left_paddle
        if player_won then
            cutscene:text([==[
[miniface:pirates/susie]fuck
[miniface:pirates/ralsei]fuck
]==])
            cutscene:text([==[
[miniface:pirates/noelle]fuck
[miniface:pirates/kris]fuck
]==])
            cutscene:text("* Fuck yeah", "sincere_smile", "susie")
        else
            cutscene:text("* Some point of no return this is!", "agitated", "susie")
        end
    end,
}

return pirates