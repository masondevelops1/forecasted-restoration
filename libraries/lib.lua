local EventCallbacks = {}

local callbacks = {}

function EventCallbacks.subscribe(eventName, obj, func)
    if(not callbacks[eventName]) then
        callbacks[eventName] = {}
    end
    callbacks[eventName][obj] = func
end

function EventCallbacks.unsubscribe(eventName, obj)
    if(callbacks[eventName]) then
        callbacks[eventName][obj] = nil
    end
end

function EventCallbacks.init()
    setmetatable(EventCallbacks,{__index = function(self, key)
        local v = rawget(self, key)
        if(v) then return v end
        if(not callbacks[key]) then return end

        --if not in library, assume libCall
        return function(lib, ...)
            if(not callbacks[key]) then return end
            for obj, callback in pairs(callbacks[key]) do
                callback(obj, ...)
            end
        end
    end})
end

return EventCallbacks