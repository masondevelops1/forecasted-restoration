---@class Shop : Shop
local Shop, super = HookSystem.hookScript(Shop)

---@return number
function Shop:getMoney()
    if Game:isLight() then
        return Game.lw_money
    else
        return Game.money
    end
end

---@param amount number
function Shop:setMoney(amount)
    if Game:isLight() then
        Game.lw_money = amount
    else
        Game.money = amount
    end
end

return Shop