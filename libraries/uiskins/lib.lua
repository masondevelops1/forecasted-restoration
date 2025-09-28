local lib = {}
Registry.registerGlobal("UISkinLib", lib)
UISkinLib = lib

function UISkinLib:onRegistered()
    self.skins = {}
    for _, path, skin in (Registry.iterScripts("data/uiskins")) do
        skin.id = skin.id or path
        self.skins[skin.id] = skin
    end
end

function UISkinLib:createSkin(id, ...)
    if self.skins[id] then
        return self.skins[id](...)
    elseif Assets.getFramesOrTexture("ui/box/" .. id .. "/left") then
        return ImageUISkin(id, ...)
    else
        return UISkin(...)
    end
end

function UISkinLib:swapUISkin(skin)
    for _,v in pairs(Game.stage:getObjects(UIBox)) do
        v:setSkin(skin)
    end
end

return lib