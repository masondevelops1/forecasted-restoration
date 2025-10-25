local CheronShop, super = Class(Shop)

function CheronShop:init()
    super.init(self)
    self.encounter_text = "* Hello, friends."
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

    self:registerTalk("About Wall Guardian")
    self:registerTalk("Your name?")
    self:registerTalk("Picture frame")
    self:registerTalk("The Evergroves")

    self:registerTalkAfter("Daughter?", 1, "talk_1", 1)
    self:registerTalkAfter("About yourself", 2, "talk_2", 1)
    self:registerTalkAfter("Together", 3, "talk_3", 1)
    self:registerTalkAfter("Forest Dream?", 4, "talk_4", 1)
end

function CheronShop:postInit()
    super.postInit(self)
    self.background_sprite:play(5/30, true)
    self.shopkeeper:setLayer(SHOP_LAYERS["above_boxes"])
end

function CheronShop:startTalk(talk)
    if talk == "About Wall Guardian" then
        self:setFlag("talk_1", 1)
        self:startDialogue({"[emote:idle]* Wallie? [wait:5]He's a good friend of mine.\n[wait:5]* He's been here for as long as I can remember, [wait:5]even showed me around when I first got here.", "[emote:happy]* Can't wait for my daughter to meet him."})
    elseif talk == "Daughter?" then
        self:setFlag("talk_1", 0)
        self:startDialogue({"[emote:happy]* Oh,[wait:5] right,[wait:5] my daughter![wait:10] Well,[wait:5] I'd always hoped to start a family here.", "[emote:idle]* A while before the docks even existed,[wait:5] I found her,[wait:5] lost at sea...", "[emote:happy]* I took her in on this very boat,[wait:5] raising her until she was old enough to go out on her own...", "[emote:idle]* I really was sad to see her go,[wait:5] I completely isolated myself...", "[emote:happy]* Until you came...[wait:5] my daughter sent me some mail.[wait:5] She invited me here for a family reunion.", "[emote:idle]* Nobody usually comes by to talk to me...[wait:5] I think I needed to get that off my chest...\n[wait:5]* Thank you."})
    elseif talk == "Your name?" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:idle]* My name?[wait:5] Well,[wait:5] that's not a usual question I get.\n[wait:5]* It's Cheron."})
    elseif talk == "About yourself" then
        self:setFlag("talk_2", 0)
        self:startDialogue({"[emote:idle]* Me?[wait:5] Oh,[wait:5] there's not much to an old sailor like me.", "[emote:idle]* I've been sailing for years,[wait:5] before the docks that you first visited me from existed!", "[emote:happy]* Those were"})
    elseif talk == "Picture frame" then
        self:setFlag("talk_3", 1)
        self:startDialogue({"[emote:idle]* Oh, [wait:5]ehehe...\n[wait:5]* I keep forgetting I put that there.", "[emote:idle]* Pay no attention to it,[wait:5] it's just..."})
    elseif talk == "Together" then
        self:setFlag("talk_3", 0)
        self:startDialogue({"[emote:idle]* U-us? [wait:5]No, [wait:5]we're not... [wait:5]I-I mean, [wait:5]there's not much goin' for me.", "[emote:happy]* That's all!!"})
    elseif talk == "The Evergroves" then
        self:setFlag("talk_4", 1)
        self:startDialogue({"[emote:idle]* The Evergroves... I've always loved it here.\n[wait:5]* There's been more people visiting over here lately...", "[emote:idle]* If you haven't already heard, [wait:5]there's this story about a forest dream.\n[wait:5]* Ursula and the doctor are still trying to figure out why it attracts the population."})
    elseif talk == "Forest Dream?" then
        self:setFlag("talk_4", 0)
        self:startDialogue({"[emote:idle]* Alright,[wait:5] friends.\n[wait:5]* I'll tell you the story of the Forest Dream.", "[emote:idle]* \"Long ago,[wait:5] a mysterious place above collapsed.[wait:5] That is when the docks were formed...[wait:5] And with those docks,[wait:5] many more people had appeared to that place.\"", "* \"But eventually,[wait:5] people got bored of the endless expanse.[wait:5] So they set sail, searching for a place across the waters...\"", "[emote:happy]* \"And one day,[wait:5] we found a place different from the rest of the Depths.\"", "[emote:idle]* \"Not many lived there,[wait:5] the natives were few for sure...[wait:5] except for one,[wait:5] the doctor.\"", "* \"It was a magical forest,[wait:5] yes,[wait:5] The Evergroves...\n[wait:5]* They convinced many people to move there.\"", "[emote:idle]* \"Eventually,[wait:5] Ursula came into power,[wait:5] working with the scientist to make The Evergroves great...\"", "[emote:happy]* \"But now,[wait:5] it is said that there remains a great dream at the highest part of the Evergroves.\"", "[emote:happy]* \"They say an angel will come to grant you a wish,[wait:5] the greatest wish you could ever think of.\"", "[emote:idle]* \"But that wish would not be seen by anybody but the hero.\"\n[wait:5]* \"And nobody would remember the dream... not even what they did... except for one...\"", "[emote:happy]* That is all of the story I know,[wait:5] friends.\n[wait:5]* And I think that's about what everybody else knows,[wait:5] too."})
    end
end
return CheronShop