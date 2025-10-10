local open_dark_door, super = Class(DarkDoorFXRect)

function open_dark_door:init(properties)
    super.init(self, properties.x, properties.y, properties.width, properties.height)
end

return open_dark_door