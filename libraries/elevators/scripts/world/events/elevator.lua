local Elevator, super = Class(Event)

function Elevator:init(data)
    super.init(self, 0, 0)

    self.timer = 0

    self.shakecon = 0
    self.charadjustcon = 0
    self.rectcon = 0
    self.rectspeed = 0
    self.rect_alpha = 0
    self.recty = 0
    self.dir = 1
    self.target_floor = 3 -- what floor ID you're going to
    self.current_floor = 2 -- what floor ID you're currently on

    self.merge_amt = 0
    self.mergespeed = 0.1
    self.mergecon = 0
    self.mergetimer = 0
    self.movecon = 0
    self.movetimer = 0
    self.rectspacing = 600
    self.doorcon = 0
    self.doorx = 40
    self.con = 0

    self.catepillar_positions = {}

    --[[
        If in elevator cutscene, con is set to 1, and the caterpillar is destroyed. (Plot is less than 165)
    ]]

    self.length = 40

    self.layer = WORLD_LAYERS.bottom

    self.floors = {}

    self.infinite = false

    for key, value in pairs(data.properties) do
        -- key is formatted thing_1, thing_2, etc.
        local floor_property = key:match("([a-z]+)_")
        local floor_number = tonumber(key:match("_([0-9]+)"))

        self.floors[floor_number] = self.floors[floor_number] or {}

        self.floors[floor_number][floor_property] = value

        if floor_property == "color" then
            self.floors[floor_number][floor_property] = Utils.parseColorProperty(value)
        end
    end

    self:setCurrentFloor(1)
end

function Elevator:moveTo(number)
    self.target_floor = number

    -- If the target floor is below our current one, move down. Otherwise, move up.
    if number < self.current_floor then
    self.dir = -1
    else
    self.dir = 1
    end

    -- If a floor has a dir value set, use that instead
    if self.floors[number].dir then self.dir = self.floors[number].dir end

    self.length = self.floors[number].length or 40

    self.con = 100
end

function Elevator:setCurrentFloor(number)
    self.current_floor = number
    self.prev_bg_c  = self.floors[self.current_floor].color
    self.cur_bg_c   = self.floors[self.current_floor].color
    self.ideal_bg_c = self.floors[self.current_floor].color

    self:setExit(self.floors[number].dest)
end

function Elevator:postLoad()
    if Mod.lastMap == nil then return end

    for floor_number, floor in pairs(self.floors) do
        if floor.dest == Mod.lastMap then
            self:setCurrentFloor(floor_number)
            break
        end
    end
end

function Elevator:setExit(map)
    local transition = Game.world.map:getEvent("transition")
    if transition then
        transition.target.map = map
    end
end

function Elevator:update()
    self.timer = self.timer + DTMULT

    if self.infinite then
        self.length = self.length + DTMULT
    end

    if (self.movecon == 1) then
        if not Game.world:hasCutscene() then
            Game.lock_movement = true
        end

        self.maxrectspeed = 14
        self.movetimer = 0
        self.movecon = 2
        self.doorcon = 2
        self.charadjustcon = 1
        self.rectspacing = 120
        self.shakecon = 1
        self.rectcon = 1
    end
    if (self.movecon == 2) then
        self.movetimer = self.movetimer + DTMULT
        if (self.movetimer >= 10 and ((self.movetimer - DTMULT) <= 10)) then
            self.do_once = true
            self.mergecon = 1
            self.mergespeed = 0.05 / ((self.length - 20) / 20)
        end
        if (self.movetimer >= (self.length - 10) and ((self.movetimer - DTMULT) <= self.length - 10)) then
            if (self.charadjustcon >= 2) then
                self.charadjustcon = 3
            end
            self.current_floor = self.target_floor
            self:setCurrentFloor(self.target_floor)
            self.doorcon = 1
            if self.shakecon < 3 then -- TODO: the check is a hacky bandaid fix for target FPS being 30.
                self.shakecon = 3 -- this is in the original code, not a part of the bandaid fix
            end
            self.rectcon = 3
        end
        if (self.movetimer >= self.length) then
            self.movecon = 0
            if not Game.world:hasCutscene() then
                Game.lock_movement = false
            end
            self.charadjustcon = 0
        end
    end
    if (self.movecon == 3) then
        if not Game.world:hasCutscene() then
            Game.lock_movement = true
        end

        self.doorcon = 2
        self.maxrectspeed = 10
        self.movetimer = 0
        self.movecon = 4
        self.rectspacing = 240
        self.shakecon = 1
        self.rectcon = 1
    end
    if (self.mergecon == 1) then
        self.prev_bg_c  = self.floors[self.current_floor].color
        self.ideal_bg_c = self.floors[self.target_floor].color
        if (self.movecon == 0) then
            self.current_floor = self.target_floor
            self:setCurrentFloor(self.target_floor)
        end
        self.mergecon = 2
        self.mergetimer = 0
        self.merge_amt = 0
    end
    if (self.mergecon == 2) then
        self.merge_amt = self.merge_amt + (self.mergespeed * DTMULT)
        if (self.merge_amt >= 1) then
            self.merge_amt = 1
            self.mergecon = 3
        end
        self.cur_bg_c = Utils.mergeColor(self.prev_bg_c, self.ideal_bg_c, self.merge_amt)
    end
    if (self.mergecon == 3) then
        self.mergecon = 0
    end
    if (self.shakecon == 1) then
        self.shakeamt = 0
        self.shaketimer = 0
        self.shakecon = 2
    end
    if (self.shakecon == 2) then
        if (math.abs(Game.world.camera.oy) < 4) then
            Game.world.camera.oy = Game.world.camera.oy - (self.dir * 0.5) * DTMULT
        end
    end
    if (self.shakecon == 3) then
        Assets.playSound("screenshake")

        self.shakeamt = 4
        self.shakecon = 4
        local timer = Game.world.timer:everyInstant(1/30, function()
            if (self.shakeamt >= 0) then
                Game.world.camera.ox = (0 - Utils.random(self.shakeamt)) + Utils.random(self.shakeamt)
                Game.world.camera.oy = (0 - Utils.random(self.shakeamt)) + Utils.random(self.shakeamt)
                self.shakeamt = self.shakeamt - 0.5
                return true
            else
                Game.world.camera.ox = 0
                Game.world.camera.oy = 0
                self.shakecon = 0
                return false
            end
        end)
    end
    if (self.rectcon == 1) then
        self.rectcon = 0
        self.rectspeed = 0
        self.rect_alpha = 0
        self.recty = 0
        self.rectcon = 2
    end
    if (self.rectcon == 2) then
        if (self.dir == 1) then
            if (self.rectspeed < self.maxrectspeed) then
                self.rectspeed = self.rectspeed + DTMULT
            end
        end
        if (self.dir == -1) then
            if (self.rectspeed > (-self.maxrectspeed)) then
                self.rectspeed = self.rectspeed - DTMULT
            end
        end
        if (self.rect_alpha < 0.2) then
            self.rect_alpha = self.rect_alpha + 0.02 * DTMULT
        end
        self.recty = self.recty + self.rectspeed * DTMULT
        if (self.recty >= self.rectspacing) then
            self.recty = self.recty - self.rectspacing
        end
        if (self.recty <= (-self.rectspacing)) then
            self.recty = self.recty + self.rectspacing
        end
    end
    if (self.rectcon == 3) then
        self.rectspeed = Utils.clamp(self.rectspeed, -6, 6)
        if (self.rectspeed > 0) then
            self.rectspeed = self.rectspeed - 0.5 * DTMULT
        end
        if (self.rectspeed < 0) then
            self.rectspeed = self.rectspeed + 0.5 * DTMULT
        end
        if (self.rect_alpha > 0) then
            self.rect_alpha = self.rect_alpha - 0.02 * DTMULT
        end

        self.recty = self.recty + self.rectspeed * DTMULT
        if (self.recty >= self.rectspacing) then
            self.recty = self.recty - self.rectspacing
        end
        if (self.recty <= (-self.rectspacing)) then
            self.recty = self.recty + self.rectspacing
        end
        if (self.rectspeed == 0 and self.rect_alpha == 0) then
            self.rectcon = 0
        end
    end
    if (self.doorcon == 1) then
        if (self.doorx <= 40) then
            self.doorx = self.doorx + 5 * DTMULT
        end
    end
    if (self.doorcon == 2) then
        if (self.doorx >= 0) then
            self.doorx = self.doorx - 5 * DTMULT
        end
        if (self.doorx <= 0) then
            self.doorx = 0
            self.doorcon = 0
        end
    end

    if self.charadjustcon == 1 then
        -- Loop through followers
        self.catepillar_positions = {}
        for i, follower in ipairs(Game.world.followers) do
            table.insert(self.catepillar_positions, follower.y)
        end
        self.charadjustcon = 2
    end

    if self.charadjustcon == 2 then
        for i, follower in ipairs(Game.world.followers) do
            -- This is what deltarune does, I'm not sure what to do with it
            if follower.y >= 360 then -- It's 260 in DELTARUNE...
                follower.y = follower.y - 10 * DTMULT
            end
        end
    end

    if self.charadjustcon == 3 then
        local continue = true
        for i, follower in ipairs(Game.world.followers) do
            if follower.y < self.catepillar_positions[i] then
                follower.y = follower.y + 10 * DTMULT
                continue = false
            end
            if follower.y >= self.catepillar_positions[i] then
            end
        end
        if continue then
            self.charadjustcon = 0
        end
    end

    --if charadjustcon == 1 then
    --    ccount = 0
        
    --[[if (charadjustcon == 1) then
        ccount = 0
        exist[0] = 0
        exist[1] = 0
        charremy[0] = 0
        charremy[1] = 0
        if instance_exists(global.cinstance[0]) then
            exist[0] = 1
            charremy[0] = global.cinstance[0].y
        end
        if instance_exists(global.cinstance[1]) then
            exist[1] = 1
            charremy[1] = global.cinstance[1].y
        end
        charadjustcon = 2
    end
    if (charadjustcon == 2) then]]
        -- TODO: loop through party members and adjust their y position
        --[[
        for (i = 0; i < 2; i += 1)
        {
            if (exist[i] == 1) then
                with (global.cinstance[i])
                {
                    if (self.y >= 260) then
                        self.y = self.y - 10
                    end
                end
            end
        end]]
    --[[end
    if (charadjustcon == 3)
    {
        ok[0] = 0
        ok[1] = 0
        for (i = 0; i < 2; i += 1)
        {
            if (exist[i] == 1)
            {
                if (global.cinstance[i].y < charremy[i])
                {
                    with (global.cinstance[i])
                        y += 10
                }
                if (global.cinstance[i].y >= charremy[i])
                    ok[i] = 1
            }
            else
                ok[i] = 1
        }
        if (ok[0] == 1 && ok[1] == 1)
            charadjustcon = 0
    }]]
    if (self.con >= 1) then
    --[[
        if (con == 1)
        {
            with (obj_caterpillarchara_ch1)
                instance_destroy()
            with (obj_mainchara_ch1)
                visible = false
            global.interact = 1
            k = scr_dark_marker_ch1(300, 420, spr_krisu_dark_ch1)
            s = scr_dark_marker_ch1(300, 460, spr_susieu_dark_ch1)
            r = scr_dark_marker_ch1(300, 500, spr_ralseiu_ch1)
            cc[0] = k
            cc[1] = s
            cc[2] = r
            for (i = 0; i < 3; i += 1)
            {
                with (cc[i])
                {
                    scr_depth_ch1()
                    vspeed = -4
                    image_speed = 0.25
                }
            }
            con = 2
        }
        if (con == 2)
        {
            global.interact = 1
            if (k.y <= 200)
            {
                with (k)
                {
                    scr_halt_ch1()
                    sprite_index = spr_krisd_dark_ch1
                }
            }
            if (s.y <= 200 && s.x == s.xstart)
            {
                with (s)
                {
                    scr_halt_ch1()
                    x -= 1
                    hspeed = -4
                    image_speed = 0.25
                    sprite_index = spr_susiel_dark_ch1
                }
            }
            if (s.x <= 240)
            {
                with (s)
                {
                    scr_halt_ch1()
                    x = 240
                    sprite_index = spr_susier_dark_ch1
                }
            }
            if (r.y <= 275 && r.x == r.xstart)
            {
                jup = 1
                with (r)
                {
                    hspeed = 1.25
                    vspeed = -2.25
                }
            }
            if (jup == 1)
                a_timer += 1
            if (a_timer >= 48)
            {
                with (r)
                    scr_halt_ch1()
                con = 3
            }
        }
        if (con == 3)
        {
            with (k)
                scr_halt_ch1()
            with (r)
                scr_halt_ch1()
            with (s)
                scr_halt_ch1()
            con = 4
            alarm[4] = 30
        }
        if (con == 5)
        {
            with (r)
                sprite_index = spr_ralseid_ch1
            global.fc = 2
            global.typer = 31
            global.fe = 11
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_353_0") // \EB* Alright^1, this lift should take us out of here./%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 6
        }
        if (con == 6 && (!d_ex_ch1()))
        {
            ele_noise = snd_init_ch1("elevator.ogg")
            ele_noise_ind = mus_loop_ext_ch1(ele_noise, 0.6, 0.1)
            with (r)
                sprite_index = spr_ralseiu_ch1
            snd_play_ch1(snd_item_ch1)
            movecon = 3
            newcno = 2
            con = 7
            pitchcount = 0.1
            alarm[4] = 45
        }
        if (con == 7)
        {
            pitchcount += 0.015
            snd_pitch_ch1(ele_noise_ind, pitchcount)
        }
        if (con == 8)
        {
            with (r)
                sprite_index = spr_ralseid_ch1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_384_0") // * Now^1, it might take a while^1, so.../%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 9
        }
        if (con == 9 && (!d_ex_ch1()))
        {
            with (r)
            {
                vspeed = 2
                image_speed = 0.2
            }
            con = 10
            alarm[4] = 15
        }
        if (con == 11)
        {
            with (r)
                scr_halt_ch1()
            with (r)
            {
                sprite_index = spr_ralsei_sit_ch1
                image_speed = 0.25
            }
            con = 12
            snd_play_ch1(snd_wing_ch1)
            alarm[4] = 12
        }
        if (con == 13)
        {
            with (r)
            {
                image_speed = 0
                image_index = 2
            }
            con = 15
            alarm[4] = 20
        }
        if (con == 16)
        {
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_419_0") // \E0* Get comfy^1, everyone!/%
            con = 17
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
        if (con == 17 && (!d_ex_ch1()))
        {
            with (s)
            {
                hspeed = -4
                image_speed = 0.2
            }
            with (k)
                sprite_index = spr_kris_fallen_dark_ch1
            snd_play_ch1(snd_wing_ch1)
            con = 18
            alarm[4] = 10
        }
        if (con == 19)
        {
            with (s)
            {
                scr_halt_ch1()
                sprite_index = spr_susier_wall_ch1
            }
            con = 20
            alarm[4] = 120
        }
        if (con == 21)
        {
            global.fc = 1
            global.typer = 30
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_448_0") // * ... Hey^1. Ralsei^1./
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_449_0") // * Y'know Lancer's dad..^1. The King?/
            scr_ralface_ch1(2, "B")
            global.msg[3] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_451_0") // * Yes...?/
            scr_susface_ch1(4, 0)
            global.msg[5] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_453_0") // * When we meet him..^1. You think we'll have to.../
            global.msg[6] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_454_0") // \EC* ... hurt him?/
            scr_ralface_ch1(7, "B")
            global.msg[8] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_456_0") // * Susie...?/
            scr_susface_ch1(9, 7)
            global.msg[10] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_458_0") // \E7* I mean, I could EASILY smash him^1, but.../
            global.msg[11] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_459_0") // \E0* You guys^1, I know that's not really your thing./
            global.msg[12] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_460_0") // \E2* You're more about^1, uh^1, grovelling like total losers./%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 22
        }
        if (con == 22 && (!d_ex_ch1()))
        {
            con = 23
            alarm[4] = 90
        }
        if (con == 24)
        {
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_476_0") // \E0* And I was thinking..^1. maybe.../
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_477_0") // \E6* I could..^1. do that too?/
            scr_ralface_ch1(2, 3)
            global.msg[3] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_479_0") // * Susie!^1? You mean you want to try ACTing...?/
            scr_susface_ch1(4, 6)
            global.msg[5] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_481_0") // * Uh, well,/
            scr_ralface_ch1(6, 6)
            global.msg[7] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_483_0") // * Susie..^1. We'd be happy if you ACTed with us!/
            global.msg[8] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_484_0") // \E0* And don't worry^1, we'll be there to help you!/
            global.msg[9] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_485_0") // \E6* You won't have to figure it out by yourself./
            scr_susface_ch1(10, 0)
            global.msg[11] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_487_0") // * .../
            global.msg[12] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_488_0") // \EC* ... sure^1, alright./%
            con = 25
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
        }
        if (con == 25 && (!d_ex_ch1()))
        {
            con = 26
            alarm[4] = 90
        }
        if (con == 27)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_503_0") // \EC* .../
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_504_0") // \E0* Hey^1. Ralsei./
            scr_ralface_ch1(2, 0)
            global.msg[3] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_506_0") // * Susie?/
            scr_susface_ch1(4, 0)
            global.msg[5] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_508_0") // * Are you.../
            global.msg[6] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_509_0") // \E6* Still gonna make those^1, uh^1, cakes...?/
            scr_ralface_ch1(7, 6)
            global.msg[8] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_511_0") // * Well^1, will you stop making fun of me?/
            scr_susface_ch1(9, 0)
            global.msg[10] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_513_0") // * .../
            global.msg[11] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_514_0") // \E2* Well^1, if I HAVE TO^1, I guess./
            scr_ralface_ch1(12, 8)
            global.msg[13] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_516_0") // * Then I'll bake you as many as you like^1, alright?/
            scr_susface_ch1(14, 2)
            global.msg[15] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_518_0") // * Yeah^1, like you can make that many^1, dude./%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 28
        }
        if (con == 28 && (!d_ex_ch1()))
        {
            con = 29
            alarm[4] = 45
        }
        if (con == 30)
        {
            movecon = 2
            con = 31
            snd_volume_ch1(ele_noise_ind, 0, 60)
            alarm[4] = 60
        }
        if (con == 31)
        {
            if (pitchcount > 0.1)
                pitchcount -= 0.015
            snd_pitch_ch1(ele_noise_ind, pitchcount)
            global.interact = 1
        }
        if (con == 32)
        {
            snd_free_ch1(ele_noise)
            with (r)
                image_speed = -0.25
            con = 33
            alarm[4] = 7
        }
        if (con == 34)
        {
            with (r)
            {
                sprite_index = spr_ralseid_ch1
                image_index = 0
                vspeed = 4
                image_speed = 0.25
            }
            con = 35
        }
        if (con == 35)
        {
            if (r.y >= 270)
            {
                with (r)
                {
                    vspeed = 0
                    hspeed = -6
                    sprite_index = spr_ralseil_ch1
                }
                con = 36
            }
        }
        if (con == 36)
        {
            if (r.x <= 300)
            {
                with (r)
                {
                    scr_halt_ch1()
                    sprite_index = spr_ralseiu_ch1
                }
                con = 37
                alarm[4] = 20
            }
        }
        if (con == 38)
        {
            global.fc = 2
            global.typer = 31
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_605_0") // \E0* Well^1, this is our stop!/%
            d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
            d.side = 0
            con = 39
        }
        if (con == 39 && (!d_ex_ch1()))
        {
            with (r)
            {
                sprite_index = spr_ralseid_ch1
                vspeed = 4
                image_speed = 0.25
            }
            global.interact = 0
            con = 40
            kremx = k.x
            kremy = k.y
            snd_play_ch1(snd_wing_ch1)
            with (k)
                instance_destroy()
            obj_mainchara_ch1.x = kremx
            obj_mainchara_ch1.y = kremy
            global.facing = 0
            with (obj_mainchara_ch1)
                visible = true
            movecounter = 0
        }
        if (con == 40)
        {
            if (obj_mainchara_ch1.x != kremx || obj_mainchara_ch1.y != kremy)
                movecounter += 1
            if (movecounter >= 3)
            {
                con = 41
                global.interact = 1
                global.fc = 1
                global.typer = 30
                global.fe = 0
                global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_644_0") // \E0* Hey, Kris^1. Wait a sec./%
                instance_create_ch1(0, 0, obj_dialoguer_ch1)
            }
        }
        if (con == 41 && (!d_ex_ch1()))
        {
            with (s)
            {
                sprite_index = spr_susier_dark_unhappy_ch1
                image_speed = 0.1
                hspeed = 2
            }
            global.facing = 3
            con = 43
            alarm[4] = 15
        }
        if (con == 44)
        {
            with (s)
                scr_halt_ch1()
            con = 45
            alarm[4] = 30
        }
        if (con == 46)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_674_0") // * Y'know^1, I'm starting to realize./
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_675_0") // * It'll be easier for us to get out of here.../
            global.msg[2] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_676_0") // * If we all^1, uh^1, "get along" a little more./
            global.msg[3] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_677_0") // * So, next time we fight an enemy.../%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 47
        }
        if (con == 47 && (!d_ex_ch1()))
        {
            with (s)
                sprite_index = spr_susieu_dark_ch1
            con = 48
            alarm[4] = 30
        }
        if (con == 49)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_691_0") // \EC* If you tell me what to do... I'll listen to you./%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 50
        }
        if (con == 50 && (!d_ex_ch1()))
        {
            with (s)
                sprite_index = spr_susiel_dark_unhappy_ch1
            con = 51
            alarm[4] = 60
        }
        if (con == 52)
        {
            with (s)
                sprite_index = spr_susier_dark_ch1
            global.fe = 1
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_709_0") // \E1* ... but, y'know, don't tell me anything STUPID,/
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_710_0") // \E2* Or I'll go back to smashing heads, alright!?/%
            instance_create_ch1(0, 0, obj_dialoguer_ch1)
            con = 53
        }
        if (con == 53 && (!d_ex_ch1()))
        {
            with (s)
            {
                sprite_index = spr_susied_dark_ch1
                vspeed = 4
                image_speed = 0.25
            }
            con = 54
        }
        if (con == 54)
        {
            if (s.y >= 260)
            {
                global.facing = 0
                with (s)
                {
                    scr_halt_ch1()
                    hspeed = 4
                    sprite_index = spr_susier_dark_ch1
                    image_speed = 0.25
                }
                con = 55
            }
        }
        if (con == 55)
        {
            if (s.x >= 300)
            {
                with (s)
                {
                    scr_halt_ch1()
                    vspeed = 3
                    sprite_index = spr_susied_dark_unhappy_ch1
                    image_speed = 0.125
                }
                con = 56
            }
        }
        if (con == 56)
        {
            snd_free_all_ch1()
            if (s.y >= 320)
            {
                with (s)
                    scr_halt_ch1()
                con = 57
                alarm[4] = 30
            }
        }
        if (con == 58)
        {
            global.currentsong[0] = snd_init_ch1("charjoined.ogg")
            global.fe = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_774_0") // \E0* Kris.../
            global.msg[1] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_775_0") // \EC* I'm counting on you^1, OK?/%
            d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
            d.side = 0
            con = 59
        }
        if (con == 59 && (!d_ex_ch1()))
        {
            with (s)
            {
                vspeed = 6
                image_speed = 0.25
            }
            con = 60
            alarm[4] = 50
        }
        if (con == 61)
        {
            global.currentsong[1] = mus_play_ch1(global.currentsong[0])
            snd_volume_ch1(global.currentsong[1], 0.8, 0)
            global.typer = 6
            global.fc = 0
            global.msg[0] = scr_84_get_lang_string_ch1("obj_Elevator_slash_Step_0_gml_798_0") // * (Susie joined the party for real.)
            d = instance_create_ch1(0, 0, obj_dialoguer_ch1)
            d.side = 0
            con = 62
            alarm[4] = 110
        }
        if (con == 63)
        {
            if (global.plot < 165)
                global.plot = 165
            with (obj_dialoguer_ch1)
                instance_destroy()
            with (obj_writer_ch1)
                instance_destroy()
            snd_free_all_ch1()
            global.interact = 0
            global.flag[239] = 1
            con = 64
        }]]
        if (self.con == 100) then
            if not Game.world:hasCutscene() then
                Game.lock_movement = true
            end
            if (self.movecon == 0) then
                self.movecon = 1
            end
            self.con = 101
            Assets.playSound("spearappear")
            Game.world.music:play("elevator", 0.7, 0.5)

            self.pitchcount = 0.5
            self.volcount = 0.7
            self.pitchtimer = 0
            self.continuetimer = 0
        end
        if (self.con == 101) then
            if not Game.world:hasCutscene() then
                Game.lock_movement = true
            end

            self.continuetimer = self.continuetimer + DTMULT
            self.pitchtimer = self.pitchtimer + DTMULT
            if (self.pitchtimer < 10) then
                self.pitchcount = self.pitchcount + 0.04 * DTMULT
            end
            if (self.pitchtimer >= self.length - 10) then
                if (self.pitchcount > 0) then
                    self.pitchcount = self.pitchcount - 0.08 * DTMULT
                end
                self.volcount = self.volcount - 0.05 * DTMULT
            end
            if (self.pitchcount > 0) then
                Game.world.music:setPitch(Utils.clamp(self.pitchcount, 0, 1))
            end
            Game.world.music:setVolume(Utils.clamp(self.volcount, 0, 1))
            if (self.continuetimer >= self.length) then
                self.con = self.con + 1
            end
        end
        if (self.con == 102) then
            Game.world.music:stop()
            self.con = 0

            -- set current floor here ig?

            --global.flag[239] = cno

            if not Game.world:hasCutscene() then
                Game.lock_movement = false
                Game.world.player:setFacing("down")
            end
        end
    end

    super.update(self)
end

function Elevator:draw()
    love.graphics.setColor(self.cur_bg_c)
    love.graphics.draw(Assets.getTexture("bg/elevator"), 0, 0, 0, 2, 2)

    if (self.rectcon >= 1) then
        love.graphics.setColor(Utils.mergeColor(self.cur_bg_c, COLORS.black, 1 - self.rect_alpha))
        for i = 0, 7 do
            local x1 = -10
            local y1 = (-100 + self.recty) + (i * self.rectspacing)
            local x2 = 180
            local y2 = (-60 + self.recty) + (i * self.rectspacing)
            love.graphics.rectangle("fill", x1, y1, x2 - x1, y2 - y1)

            local x1 = 640
            local y1 = (-100 + self.recty) + (i * self.rectspacing)
            local x2 = 460
            local y2 = (-60 + self.recty) + (i * self.rectspacing)
            love.graphics.rectangle("fill", x1, y1, x2 - x1, y2 - y1)
        end
    end

    if (self.doorx > 0) then
        love.graphics.setColor(self.cur_bg_c)
        love.graphics.draw(Assets.getTexture("bg/elevator_door_left"), (302 - self.doorx), 352, 0, 2, 2)
        love.graphics.draw(Assets.getTexture("bg/elevator_door_right"), (318 + self.doorx), 352, 0, 2, 2)
        --draw_sprite_ext(spr_elevator_frontdoor_ch1, 0, (302 - doorx), 352, 2, 2, 0, cur_bg_c, 1)
        --draw_sprite_ext(spr_elevator_frontdoor_ch1, 1, (318 + doorx), 352, 2, 2, 0, cur_bg_c, 1)
        love.graphics.setColor(COLORS.black)
        local x1 = (318 - self.doorx)
        local y1 = 352
        local x2 = (318 + self.doorx)
        local y2 = 500
        love.graphics.rectangle("fill", x1, y1, x2 - x1, y2 - y1)
    end

    love.graphics.setColor(COLORS.white)

    super.draw(self)
end

-- A few helper functions for getting floor numbers

-- Returns a floor number based on the name that appears in the selection menu, or returns nil if no match can be found.
function Elevator:getFloorByName(name)
    local floor_found = nil
    for i, _ in ipairs(self.floors) do
        if self.floors[i].name == name then
            floor_found = i
            --break
        end
    end
    if floor_found == nil then
        Kristal.Console:warn("No floor with the name " .. name .. " was found!")
    end
    return floor_found
end

-- Returns a floor number based on the destination map, or returns nil if no match can be found.
function Elevator:getFloorByDestination(dest)
    local floor_found = nil
    for i, _ in ipairs(self.floors) do
        if self.floors[i].dest == dest then
            floor_found = i
            break
        end
    end
    if floor_found == nil then
        Kristal.Console:warn("No floor going to the map " .. dest .. " was found!")
    end
    return floor_found
end


return Elevator