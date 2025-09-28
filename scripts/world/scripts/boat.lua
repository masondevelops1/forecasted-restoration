---@type table<string, fun(event:Script,chara:Player)>
local group = {
    security_move = function (event, chara)
        local resume
        resume = coroutine.wrap(function ()
            if not event.active then return end
            local properties = event["data"] and event["data"].properties or {}
            local flag = properties.flag or "permission"
            local npc = event.world:getEvent(properties.target.id)
            ---@cast npc +NPC
            ---@cast npc -Event
            if not (npc:getFlag(flag, Game:getFlag(flag))) then return end
            local startx,starty = npc.init_x, npc.init_y
            local tx, ty = event.world.map:getMarker(properties.marker)

            npc:walkToSpeed(tx,ty, 6)

            event.world.timer:afterCond(function ()
                if chara:collidesWith(npc) then
                    chara:doWalkToStep(4 * DTMULT, 0, true)
                end
                return not chara:collidesWith(event)
            end, resume)
            coroutine.yield()

            npc:walkToSpeed(startx,starty, 6, nil, nil, resume)
            coroutine.yield()
        end)
        resume()
    end
}

return group