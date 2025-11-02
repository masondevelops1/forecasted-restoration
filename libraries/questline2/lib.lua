local lib = {}
Registry.registerGlobal("QuestlineLib", lib)
QuestlineLib = lib

function lib:load(data)
    self:initQuests()
    if data.quests_data then
        for k,v in pairs(data.quests_data) do
            if self.quests_data[k] then
                self.quests_data[k]:load(v)
            else
                self.quests_data[k] = FallbackQuest(v)
            end
        end
    end
end

function lib:onRegistered()
    self.quests = {}

    for _,path,quest in Registry.iterScripts("data/quests") do
        assert(quest ~= nil, '"data/quests/' .. path .. '.lua" does not return value')
        quest.id = quest.id or path
        self.quests[quest.id] = quest
    end
end

function lib:save(data)
    data.quests_data = {}
    for k,v in pairs(self.quests_data) do
        data.quests_data[k] = v:save()
    end
end

function lib:initQuests()
    self.quests_data = {}
    for id,quest in pairs(self.quests) do
        self.quests_data[id] = quest()
    end
end

function lib:onKeyPressed(key)
    if Game.world and Game.world.state == "GAMEPLAY" and Input.is("quest", key) and not Game.battle and not Game.shop then
		Game.world:openMenu(QuestMenu())
	end
end

function lib:postInit(new_file)
	if Game:getFlag("quest_menu_ever_opened") == nil then
		Game:setFlag("quest_menu_ever_opened", false)
	end
end

function lib:getQuest(id)
    return self.quests_data[id]
end

return lib
