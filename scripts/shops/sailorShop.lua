local CheronShop, super = Class(Shop)

function CheronShop:init()
    super.init(self)
    self.encounter_text = "* Oh,[wait:5] hello.[wait:5] Welcome to my shop."
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
    self.sell_refuse_text = "Maybe next time..."
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
    self.shopkeeper.sprite:setPosition(22, 8)
    self.shopkeeper.slide = true

    self:registerItem("smart_scouter")
    self:registerItem("sailortaffy")
    self:registerItem("dualDrink")
    self:registerItem("gilded_halberd")

    self:registerTalk("Why're you here?")
    self:registerTalk("Your name?")
    self:registerTalk("Picture frame")
    self:registerTalk("The Evergroves")

    self:registerTalkAfter("Your daughter?", 1, "talk_1", 1)
end

function CheronShop:postInit()
    super.postInit(self)
    self.background_sprite:play(5/30, true)
    self.shopkeeper:setLayer(SHOP_LAYERS["above_boxes"])
end

function CheronShop:startTalk(talk)
    if talk == "Why're you here?" then
        self:setFlag("talk_1", 1)
        self:startDialogue({"[emote:talk]* I don't usually come 'round these parts,[wait:5] as I told ye earlier,[wait:5] but...", "[emote:happy]* I just couldn't resist when I heard my daughter was walking 'round here!"})
    elseif talk == "Your daughter?" then
        self:startDialogue({"[emote:talk]* Oh,[wait:5] I haven't told ye about my daughter...", "[emote:talk]* Well,[wait:5] y'see,[wait:5] she's the princess of The Evergroves nowadays...[wait:5] but it wasn't always like that.", "[emote:happy]* She was lost at sea when I found er',[wait:5] floating across that endless expanse...", "[emote:talk]* I took her in,[wait:5] raised er',[wait:5] and sent her off once she was ready...[wait:5] 'course,[wait:5] like any other person,[wait:5] I was in despair after that...", "[emote:happy]* But now...[wait:5] after not seein' her for years,[wait:5] I heard she was walkin' around The Evergroves for once...\n* I recently got the approval to see er'.", "[emote:talk]* I'm just stoppin' by here.[wait:5] I hope it'll all be worth it..."})
    elseif talk == "Your name?" then
        self:startDialogue({"[emote:talk]* It's Cheron.[wait:5] It's got a nice ring to it,[wait:5] dont ya think?"})
    elseif talk == "Picture frame" then
        self:startDialogue({"[emote:talk]* Oh,[wait:5] pay no mind to it.[wait:5]\n* It's just a picture of me and my daughter,[wait:5] a long while ago..."})
    elseif talk == "The Evergroves" then
        self:setFlag("talk_4", 1)
        self:startDialogue({"[emote:talk]* The Evergroves... it's just a small residency.\n[wait:5]* Not much reason to come over 'ere,[wait:5] I guess...", "[emote:talk]* Other than that mansion off in the distance,[wait:5] that thing has attracted many tourists like you."})
    end
end
return CheronShop