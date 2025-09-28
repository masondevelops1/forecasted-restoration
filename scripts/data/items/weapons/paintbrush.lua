local item, super = Class(LightEquipItem, "light/paintbrush")

function item:init(inventory)
    super.init(self)

    -- Display name
    self.name = "Paintbrush"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Whether this item is for the light world
    self.light = true

    -- Item description text (unused by light items outside of debug menu)
    self.description = "It's my paintbrush."

    -- Light world check text
    self.check = "It's my paintbrush.\nI'm not sure how I got it."

    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil

    self.bonuses = {
        attack = 2,
        defense = 0
    }

end

function item:onWorldUse()
    Game.world:showText("* I look at my paintbrush.\n[wait:5]* It inspires me.")
    return false
end




function item:onToss()
    Game.world:startCutscene(function(cutscene)
        if Game.chapter == 1 then
            cutscene:text("* I didn't want to let it go.\nit away.")
        else
            cutscene:text("* I hold the paintbrush in my hand.[wait:5]\n"..
                          "* I don't want to let it go.")
        end
        cutscene:text("* Should I drop it anyways?")

        local dropped
        if Game.chapter == 1 then
            dropped = cutscene:choicer({"No", "Yes"}) == 2
        else
            dropped = cutscene:choicer({"Yes", "No"}) == 1
        end

        if dropped then
            Game.inventory:removeItem(self)

            Assets.playSound("bageldefeat")
            cutscene:text("* Reluctantly,[wait:5] I open my hand and it falls, shattering into bits.")
            cutscene:text("* Liquid drips down my face.")
            cutscene:text("* I am filled with a new[color:blue] overwhelming emotion.")
        else
            cutscene:text("* I put the paintbrush away.")
        end
    end)
    return false
end


return item