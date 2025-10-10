---@class Keypad : Object
---@overload fun(...) : Keypad
local Keypad, super = Class(Object)

-- For japanese support in the future maybe
Keypad.MODES = {
    ["default"] = {
        x      = 500,
        y      = 390,
        step_x = 60,
        step_y = 60,
        name_y = 80,
        keyboard = {
            {"1", "2", "3"},
            {"4", "5", "6"},
            {"7", "8", "9"},
            {"^^", "0", "^^"}
        }
    }
}

return Keypad