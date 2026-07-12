local CheronShop, super = Class(Shop)

function CheronShop:init()
    super.init(self)
        self.menu_options = {
        { "Buy", "BUYMENU" },
        {
            "Sell",
            function()
                self:startDialogue("* It doesn't want your items.", "MAINMENU")
            end
        },
        { "Talk", function()
                self:startDialogue("* But there was nothing to talk about.", "MAINMENU")
            end },
        { "Exit", "LEAVE" }
    }
    self.encounter_text = "* It cries and cries,[wait:5] but no tears come out."
    self.shop_text = "* ..."
    self.leaving_text = "* It tries to cry just one last time."
    self.buy_menu_text = "What\nwill you\nbuy?"
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_refuse_text = "..."
    self.buy_text = "It takes your cash quickly."
    self.buy_storage_text = "You put it in your storage."
    self.buy_too_expensive_text = "Not\nenough\nmoney."
    self.buy_no_space_text = "You're\ncarrying\ntoo much."
    self.sell_no_price_text = "Too important to\nsell. "
    self.sell_menu_text = "What will you sell?"
    self.sell_nothing_text = "You couldn't find anything there."
    self.sell_confirmation_text = "Sell it for\n%s ?"
    self.sell_refuse_text = "You decided not to sell it."
    -- Shown when you sell something
    self.sell_text = "You put the item on the counter."
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "You couldn't find anything there."
    -- Shown when you enter the talk menu.
    self.talk_text = "But there was nothing to talk about."

    self.shopkeeper:setActor("shopkeepers/gonerShopActor")
    self.shopkeeper.sprite:setPosition(0, -90)
    self.shopkeeper.slide = true

    self.sell_options_text = {}
    self.sell_options_text["items"]   = "What will you sell?"
    self.sell_options_text["weapons"] = "What will you sell?"
    self.sell_options_text["armors"]  = "What will you sell?"
    self.sell_options_text["storage"] = "What will you sell?"

    self.background = "shops/core_view"
    self.shop_music = "a goner's cry"

    self:registerItem("voidcure", { stock = 1 })
    self:registerItem("voiddrink", { stock = 2 })
end

return CheronShop