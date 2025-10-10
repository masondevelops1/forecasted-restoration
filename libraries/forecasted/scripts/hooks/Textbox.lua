---@class Textbox : Textbox
local Textbox, super = Class(Textbox)

function Textbox:setFace(face, ox, oy)
    super.setFace(self, face, ox, oy)
    if not self.face then return end
    if self.face:getFX("recolor") then return end
    local eg_face_col = Utils.hexToRgb("#feb062")
    self.face:addFX(ShaderFX("portrait", {shadercolor = function ()
        if self.actor and not self.actor.no_face_recolor then
            if (self.actor.is_depths or Utils.endsWith(self.actor.id, "_depths")) then
                return eg_face_col
            end
        end
        return COLORS.white
    end}), "recolor")
end

return Textbox