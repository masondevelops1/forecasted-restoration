---@class SmallFaceText : SmallFaceText
local SmallFaceText, super = Class(SmallFaceText)

function SmallFaceText:init(text, x, y, face, actor)
    super.init(self,text, x, y, face, actor)
    if not self.sprite then return end
    if self.sprite:getFX("recolor") then return end
    local eg_face_col = Utils.hexToRgb("#feb062")
    self.sprite:addFX(ShaderFX("portrait", {shadercolor = function ()
        if actor and not actor.no_face_recolor then
            if (actor.is_depths or Utils.endsWith(actor.id, "_depths")) then
                return eg_face_col
            end
        end
        return COLORS.white
    end}), "recolor")
end

return SmallFaceText