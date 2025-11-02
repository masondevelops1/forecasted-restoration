---@class QuestCreatedPopup : Object
---@overload fun(...) : QuestCreatedPopup
local QuestCreatedPopup, super = Class("Object", "QuestCreatedPopup")

---@param quest Quest
function QuestCreatedPopup:init(quest)
    super.init(self, SCREEN_WIDTH, 0, 280, SCREEN_HEIGHT)

    self.quest_menu_present_initially = #Game.stage:getObjects(QuestMenu) > 0

    local quest_name = quest:getName()

    self.box = self:addChild(BoxComponent(FixedSizing(self.width), FitSizing()))
    self.box:setLayout(VerticalLayout({ gap = 4, align = "start" }))
    self.box:setPadding(self.box.padding[1]*.75, self.box.padding[2]*.75, self.box.padding[3]*.75, self.box.padding[4]*.75)
    self.box:addChild(Text("[font:main,16][color:yellow]New Quest Acquired!"))
    local box_size_w = self.box.x_sizing:getWidth() - self.box.padding[1] - self.box.padding[3]
    self.box:addChild(Text("[font:plain]"..quest_name, nil, nil, box_size_w))
    if not Game:getFlag("quest_menu_ever_opened") then
        self.box:addChild(Component(FillSizing(), FixedSizing(1)))
        self.open_menu_hint = self.box:addChild(Text("[font:main,16][color:#808080](Press [bind:quest] to view)",
            nil, nil, box_size_w, nil, { align = "center" }))
    end
end

function QuestCreatedPopup:onAdd()
    super.onAdd(self)

	Assets.playSound("achievement")

	---@type Timer
	local timer = self.stage.timer
	timer:tween(0.5, self, { x = SCREEN_WIDTH - self.box:getTotalWidth() }, "linear", function()
		timer:after(5, function()
			timer:tween(0.5, self, { x = SCREEN_WIDTH }, "linear", function()
				self:remove()
			end)
		end)
	end)
end

function QuestCreatedPopup:update()
    if not self.quest_menu_present_initially and #Game.stage:getObjects(QuestMenu) > 0 then
        self:remove()
    elseif self.open_menu_hint then
        self.open_menu_hint.alpha =
            (Game.world and Game.world.state == "GAMEPLAY" and not Game.battle and not Game.shop)
            and 1 or 0.5
    end

    super.update(self)
end

return QuestCreatedPopup
