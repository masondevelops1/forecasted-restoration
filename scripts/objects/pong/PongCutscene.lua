---@class PongCutscene: Cutscene
---@overload fun(...): PongCutscene
local PongCutscene, super = Class(Cutscene)

---@param game PongMinigame
function PongCutscene:init(game, group, id, ...)
    self.game = game
    local scene, args = self:parseFromGetter(Mod.getPongCutscene, group, id, ...)
    self.textbox = game.ui.textbox
    self.interruptable = true

    super.init(self, scene, unpack(args))
end

---@param interruptable boolean
function PongCutscene:setInterruptable(interruptable)
    self.interruptable = interruptable
end

function PongCutscene:_waitForEncounterText() return self.textbox.text.text == "" end
--- Types text on the encounter text box, and suspends the cutscene until the player progresses the dialogue. \
--- When passing arguments to this function, the options table can be passed as the second or third argument to forgo specifying `portrait` or `actor`.
---@overload fun(self: BattleCutscene, text: string, options?: table): finished: fun(): boolean
---@overload fun(self: BattleCutscene, text: string, portrait: string, options?: table): finished: fun(): boolean
---@param text      string  The text to be typed.
---@param portrait? string  The character portrait to be used.
---@param actor?    Actor|string   The actor to use for voice bytes and dialogue portraits, overriding the active cutscene speaker.
---@param options?  table   A table defining additional properties to control the text.
---|"x"         # The x-offset of the dialgoue portrait.
---|"y"         # The y-offset of the dialogue portrait.
---|"reactions" # A table of tables that define "reaction" dialogues. Each table defines the dialogue, x and y position of the face, actor and face sprite, in that order. x and y can be strings as well, referring to existing positions; x can be left, leftmid, mid, middle, rightmid, or right, and y can be top, mid, middle, bottommid, and bottom. Must be used in combination with a react text command.
---|"functions" # A table defining additional functions that can be used in the text with the `func` text command. Each key, value pair will form the id to use with `func` and the function to be called, respectively.
---|"font"      # The font to be used for this text. Can optionally be defined as a table {font, size} to also set the text size.
---|"align"     # Sets the alignment of the text.
---|"skip"      # If false, the player will be unable to skip the textbox with the cancel key.
---|"advance"   # When `false`, the player cannot advance the textbox, and the cutscene will no longer suspend itself on the dialogue by default.
---|"auto"      # When `true`, the text will auto-advance after the last character has been typed.
---|"wait"      # Whether the cutscene should automatically suspend itself until the textbox advances. (Defaults to `true`, unless `advance` is false.)
---@return fun() finished A function that returns `true` when the textbox has been advanced. (Only use if `options["wait"]` is set to `false`.)
function PongCutscene:text(text, portrait, actor, options)
    if type(actor) == "table" then
        options = actor
        ---@diagnostic disable-next-line: cast-local-type
        actor = nil
    end
    if type(portrait) == "table" then
        options = portrait
        ---@diagnostic disable-next-line: cast-local-type
        portrait = nil
    end

    options = options or {}

    actor = actor or self.textbox_actor

    -- Nice hack so that we use the correct actor for party members.
    if Game.world and type(actor) == "string" then
        actor = Game.world:getCharacter(actor) or actor
    end
    actor = actor and actor.actor or actor

    self.textbox:setActor(actor)
    self.textbox:setFace(portrait, options["x"], options["y"])

    self.textbox:resetReactions()
    if options["reactions"] then
        for id,react in pairs(options["reactions"]) do
            self.textbox:addReaction(id, react[1], react[2], react[3], react[4], react[5])
        end
    end

    self.textbox:resetFunctions()
    if options["functions"] then
        for id,func in pairs(options["functions"]) do
            self.textbox:addFunction(id, func)
        end
    end

    if options["font"] then
        if type(options["font"]) == "table" then
            -- {font, size}
            self.textbox:setFont(options["font"][1], options["font"][2])
        else
            self.textbox:setFont(options["font"])
        end
    else
        self.textbox:setFont()
    end

    self.textbox:setAlign(options["align"])

    self.textbox:setSkippable(options["skip"])
    self.textbox:setAdvance(options["advance"] or options["advance"] == nil)
    self.textbox:setAuto(options["auto"] ~= false)
    if options["auto"] == nil then
        text = text .. "[wait:2s]"
    end

    self.textbox:setText(text, function()
        self.game.ui:clearTextbox()
        self:tryResume()
    end)

    local wait = options["wait"] or options["wait"] == nil
    if not self.textbox.text.can_advance then
        wait = options["wait"] -- By default, don't wait if the textbox can't advance
    end

    if wait then
        return self:wait(self._waitForEncounterText)
    else
        return self._waitForEncounterText
    end
end

--- Sets the active speaker for the encountertext box.
---@param actor? Actor|nil The character or actor to set as the speaker. `nil` resets the speaker to nothing.
function PongCutscene:setSpeaker(actor)
    if isClass(actor) and (actor:includes(PartyBattler) or actor:includes(EnemyBattler)) then
        actor = actor.actor
    end
    self.textbox_actor = actor
end

return PongCutscene