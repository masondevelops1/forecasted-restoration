local CheronShop, super = Class(Shop)

function CheronShop:init()
    super.init(self)
    self.encounter_text = "* Hello, lightners."
    self.shop_text = "* Thanks for visiting my little old place."
    self.leaving_text = "* Come back any time."
    self.buy_menu_text = "Here's\nwhat I got."
    self.buy_confirmation_text = "Buy it for\n%s ?"
    self.buy_refuse_text = "That's too bad."
    self.buy_text = "Pleasure doin business with ya!"
    self.buy_storage_text = "I put that in your storage for ya!"
    self.buy_too_expensive_text = "Not\nenough\nmoney."
    self.buy_no_space_text = "You're\ncarrying\ntoo much."
    self.sell_no_price_text = "Don't think I'd have much use for that."
    self.sell_menu_text = "I'll take that off ya."
    self.sell_nothing_text = "Nothin' there."
    self.sell_confirmation_text = "Sell it for\n%s ?"
    self.sell_refuse_text = "Maybe next time...?"
    -- Shown when you sell something
    self.sell_text = "Pleasure doin business with ya!"
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "Nothin' there."
    -- Shown when you enter the talk menu.
    self.talk_text = "Stay as long as you'd like,\nfriends."

    self.sell_options_text = {}
    self.sell_options_text["items"]   = "Let's see what ya got."
    self.sell_options_text["weapons"] = "Let's see what ya got."
    self.sell_options_text["armors"]  = "Let's see what ya got."
    self.sell_options_text["storage"] = "Let's see what ya got."

    self.background = "shops/sailor_bg"
    self.shop_music = "merchant"

    self.shopkeeper:setActor("shopkeepers/sailorShopActor")
    self.shopkeeper.sprite:setPosition(0, 8)
    self.shopkeeper.slide = true

    self:registerItem("smart_scouter")
    self:registerItem("sailortaffy")
    self:registerItem("dualDrink")
    self:registerItem("gilded_halberd")

    self:registerTalk("About Yourself")
    self:registerTalk("Your name?")
    self:registerTalk("Picture frame")
    self:registerTalk("The Evergroves")

    self:registerTalkAfter("Cheese?", 1)
    self:registerTalkAfter("Rafter's Message", 2, "talk_2", 1)
    self:registerTalkAfter("Together", 3)
    self:registerTalkAfter("Forest Dream?", 4, "talk_3", 1)
end

function CheronShop:postInit()
    super.postInit(self)
    self.background_sprite:play(5/30, true)
    self.shopkeeper:setLayer(SHOP_LAYERS["above_boxes"])
end

function CheronShop:startTalk(talk)
    if talk == "About Yourself" then
        self:startDialogue({"[emote:idle]* I don't know where to start...\n[wait:5]* I'm just a shopkeeper here in the ridge.", "[emote:idle]* I mean, [wait:5]I really like seeing everything that passes through my shop.\n[wait:5]* There's always such interesting things from outsiders!", "[emote:happy]* Plus, sometimes they bring a little bit of cheese as a gift!"})
    elseif talk == "Cheese?" then
        self:startDialogue({"[emote:idle]* I, [wait:5]um, [wait:5]really like cheese.\n[wait:5]* It's just the perfect food.", "[emote:idle]* Wh-[wait:5]no, [wait:5]I'm not addicted, [wait:5]I can stop any time I want, [wait:5]alright?"})
    elseif talk == "Your name?" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:idle]* My name?[wait:5] Nobody usually asks about that.\n[wait:5]* It's Cheron."})
    elseif talk == "Rafter's Message" then
        self:startDialogue({"[emote:idle]* H-[wait:5]He wanted you to say hi to me...?\n[wait:5]* I didn't know he still...", "[emote:idle]* If you ever see him again,[wait:5] tell him I said thank you..."})
    elseif talk == "Picture frame" then
        self:startDialogue({"[emote:idle]* Oh, [wait:5]ehehe...\n[wait:5]* I keep forgetting I put that there.", "[emote:idle]* Pay no attention to it,[wait:5] it's just..."})
    elseif talk == "Together" then
        self:startDialogue({"[emote:idle]* U-us? [wait:5]No, [wait:5]we're not... [wait:5]I-I mean, [wait:5]there's not much goin' for me.", "[emote:happy]* That's all!!"})
    elseif talk == "The Evergroves" then
        self:setFlag("talk_3", 1)
        self:startDialogue({"[emote:idle]* The Evergroves... I've always loved it here.\n[wait:5]* There's been more people visiting over here lately...", "[emote:idle]* If you haven't already heard, [wait:5]there's this story about a forest dream.\n[wait:5]* Capital doesn't want us to talk about it,[wait:5] though.", "[emote:idle]* It's caused a lot of debate in at the Capital...\n[wait:5]* The Evergroves might even get permanently closed!", "[emote:idle]* Well,[wait:5] the cruise that brings residents in,[wait:5] that is.", "[emote:happy]* Not like I'd be going anywhere,[wait:5] HA!"})
    elseif talk == "Forest Dream?" then
        self:setFlag("talk_3", 1)
        self:startDialogue({"[emote:idle]* You're lucky I know the capital members well, kiddos.\n[wait:5]* I'll tell you the story of the Forest Dream.", "[emote:happy]* \"Long ago,[wait:5] two races ruled over EARTH:[wait:5] the LIGHT and the DEEP.\"", "[emote:idle]* \"Until one day,[wait:5] when the LIGHT found the DEEP to be too dangerous.\n[wait:5]* And so the DEEP were sealed away by their namesake,[wait:5] they were sealed in the deepest part of EARTH.\"", "[emote:happy]* \"But one day,[wait:5] they found a place different from the rest of the CLIFFS.\n[wait:5]* It was a magical forest.\"", "[emote:idle]* \"So most called it their home,[wait:5] while the others stayed behind.\"", "[emote:happy]* \"But now,[wait:5] there remains a dream at the highest part of the Evergroves.\"", "[emote:happy]* \"They say an angel will come to grant you a wish,[wait:5] a wish to become a hero.\"", "[emote:idle]* \"A wish to free us all.\n[wait:5]* To free us all from these Depths,[wait:5] to finally see the real sky again...\n[wait:5]* The End.\"", "[emote:happy]* That is all of the story I know,[wait:5] kiddos.\n[wait:5]* Just don't go around asking about the Forest Dream,[wait:5] okay?"})
    --unused
    elseif talk == "About Wall Guardian" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:idle]* Wallie? [wait:5]He's a good friend of mine.\n[wait:5]* He's been here for as long as I can remember, [wait:5]even showed me around when I first got here."})
    end
end

return CheronShop