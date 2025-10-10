---@class FloorMirror : Event
local FloorMirror, super = Class(Event)


function FloorMirror:init(data)
    self.floor_mirror_sprites =  {
        ["walk/down"] = "walk/down",
        ["walk/up"] = "walk/up",


        ["walk/left"] = "walk/left",
        ["walk/right"] = "walk/right",
    }
    
    super.init(self, data)
    
    local properties = type(data) == "table" and data.properties or {}
    if data.polygon then
        self:preparePolygon(data.polygon)
    end


    self.canvas = love.graphics.newCanvas(self.width, self.height)

    self.offset = properties["offset"] or 0
    self.offset = self.offset - 60
    self.opacity = properties["opacity"] or 0.6

    self.bottom = self.y + self.height
    self.flip_y = true
end

---@param polygon {x:number,y:number}[]
function FloorMirror:preparePolygon(polygon)
    local min_x = 0
    local min_y = 0
    for _, point in ipairs(polygon) do
        min_x = math.min(min_x, point.x)
        min_y = math.min(min_y, point.y)
    end
    for _, point in ipairs(polygon) do
        point.x = point.x - min_x
        point.y = point.y - min_y
    end
    for _, point in ipairs(polygon) do
        point.y = self.height - point.y
    end
    self.x = self.x + min_x
    self.y = self.y + min_y
    self.mask = love.graphics.newCanvas(self.width,self.height,{dpiscale=0.5})
    self.collider = Utils.colliderFromShape(self, {shape = "polygon", polygon = polygon})
    Draw.pushCanvas(self.mask)
    self.collider:drawFill()
    Draw.popCanvas()
end

function FloorMirror:getBottom()
    return self.y + self.height
end

function FloorMirror:drawMirror()
    local orig_dbg = DEBUG_RENDER
    DEBUG_RENDER = false
    local to_draw = {}
    for _, obj in ipairs(Game.world.children) do
        if obj:includes(Character) then
            table.insert(to_draw, 1, obj) -- always add to the start of the table, so they render in reverse layer order
        end
    end
    for i=#to_draw, 1, -1 do
        self:drawCharacter(to_draw[i])
    end
    DEBUG_RENDER = orig_dbg
end

function FloorMirror:transformActorPath(chara)
    return chara.actor.path
end

function FloorMirror:drawCharacter(chara)
    love.graphics.push()

    chara:preDraw()
    local orig_path = chara.sprite.texture_path
    local oyd = chara.y - (self:getBottom())
    love.graphics.translate(0, -oyd + (self.offset + (-self.height/2)) + 56)
    local oldsprite = string.sub(chara.sprite.texture_path, #chara.sprite.path + 2)
    local t = Utils.split(oldsprite, "_")
    local pathless = t[1]
    if chara.actor.reflect_offsets and chara.actor.reflect_offsets[pathless] then
        love.graphics.translate(Utils.unpack(chara.actor.reflect_offsets[pathless]))
    end
    local frame = t[2]
    local newsprite = oldsprite
    local mirror = chara.actor.floor_mirror_sprites or self.floor_mirror_sprites
    if mirror and mirror[pathless] then
        newsprite = mirror[pathless] .. "_" .. frame
    end
    local pathdirs = Utils.split(chara.actor.path, "/")
    local pathend = table.remove(pathdirs, #pathdirs)
    pathend = ({dark = "light", light = "dark"})[pathend] or pathend
    local newsprite_abs = self:transformActorPath(chara) .. "/" .. newsprite
    if Assets.getTexture(newsprite_abs) then
        chara.sprite:setTextureExact(newsprite_abs)
    else
        -- chara.sprite:setTextureExact(chara.actor.path .. "/" .. newsprite)
    end
    chara:draw()
    chara:postDraw()
    chara.sprite:setTextureExact(orig_path)
    love.graphics.pop()
end

function FloorMirror:draw()
    super.draw(self)
    love.graphics.push()

    Draw.pushCanvas(self.canvas)
    love.graphics.push()
    love.graphics.clear()

    love.graphics.translate(-self.x, -self.y)
    self:drawMirror()
    love.graphics.pop()
    Draw.popCanvas()

    Draw.setColor(1, 1, 1, self.opacity)
    if self.mask then
        love.graphics.stencil(function ()
            local last_shader = love.graphics.getShader()
            love.graphics.setShader(Kristal.Shaders["Mask"])
            Draw.draw(self.mask)
            love.graphics.setShader(last_shader)
        end)
        love.graphics.setStencilTest("greater", 0)
        Draw.draw(self.canvas)
        love.graphics.setStencilTest()
    else
        Draw.draw(self.canvas)
    end
    Draw.setColor(1, 1, 1, 1)
    love.graphics.pop()
    if DEBUG_RENDER then
        love.graphics.setLineWidth(1)
        self.collider:draw(0,1,1)
    end
end

return FloorMirror