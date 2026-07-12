return {

    terminal1 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:purple]> HELLO, [wait:5] \nTHIS IS DR. G.")
        cutscene:text("[color:purple]> THE EXPERIMENTS HAVE BEEN, [wait:5] \nINTERESTING.[wait:5].[wait:5].[wait:5]")
        cutscene:text("[color:purple]> THINGS HAVE BEEN GETTING A BIT OFFTRACK IN THE GATEWAY.")
        cutscene:text("[color:purple]> THOUGH I BELIEVE I HAVE MADE A... \"DISCOVERY.\"")
        cutscene:text("[color:purple]> I CAN ONLY HOPE THINGS STAY ON-TRACK.")
        cutscene:setSpeaker("noelle")
        cutscene:text("* (... things didn't stay on track,[wait:5] did they?)", "dejected") 
    end,

    sectorA = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> Welcome to Gateway Sector:[wait:5] A.")
        cutscene:text("[color:#ff00ff]> Current status:[wait:5] NOMINAL.")
    end,

    powerOut = function(cutscene)   
        cutscene:text("* (It's run out of power.)", "frown") 
    end,

    maintenanceAlert = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> Gateway Sector:[wait:5] A:[wait:5] is currently under scheduled maintenance.")
        cutscene:text("[color:#ff00ff]> To protect this process,[wait:5] only emergency exits have been made accessible.")
    end,

    gatewayGuide = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> Thank you for visiting Gateway Sector:[wait:5] A.")
        cutscene:text("[color:#ff00ff]> Gateway Guide Page 1:\n> [wait:5]Sector B [wait:5]>[wait:5]>[wait:5]>\n> [wait:5]Sector C [wait:5]>[wait:5]>[wait:5]>")
        cutscene:text("[color:#ff00ff]> Gateway Guide Page 2:\n> [wait:5]<[wait:5]<[wait:5]< Alternate Exit\n> Main Exit [wait:5]^[wait:5]^[wait:5]^")
        cutscene:setSpeaker("susie")
        cutscene:text("* (Kris,[wait:5] this place must be giant!)", "surprise") 
    end,

    lockdown = function(cutscene)   
        if Plot:isBefore("gateway_lockdown_off") then
            cutscene:setSpeaker("voicemail")
            cutscene:text("[color:#ff4444]> Warning:[wait:5] Due to maintenance,[wait:5] only emergency exits are currently available.")
            cutscene:text("[color:#ff4444]> If required,[wait:5] an administrator can manually stop maintenance for a short period of time.")
        else
            cutscene:setSpeaker("voicemail")
            cutscene:text("[color:#ff00ff]> Scheduled maintenance will begin in:[wait:5] 40 minutes.")
            cutscene:text("[color:#ff00ff]> You will be notified 15,[wait:5] 10,[wait:5] and 5 minutes before maintenance begins.")
        end
    end,

    sectorbBlocker = function(cutscene)   
        cutscene:text("* (There's a giant metal door blocking the way forward.)", "shock_b") 
    end,

    terminal2 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:purple]> HELLO.[wait:5] THIS IS DR. G.")
        cutscene:text("[color:purple]> HERE IS WHERE I START MY TREK INTO THE SHADOWS.")
        cutscene:text("[color:purple]> I PLAN TO MAKE THIS A GATEWAY FOR MY EXPERIMENTS...[wait:10] YES,[wait:5] A GATEWAY AMIDST LIGHT AND DARK.")
        cutscene:text("[color:purple]> I SHALL CONTINUE MONITORING OUR SOURCE OF POWER, DARKNESS.")
    end,

    terminal3 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:purple]> HELLO.[wait:5] THIS IS DR. G.")
        cutscene:text("[color:purple]> I BELIEVE THAT SIMPLICITY IS BEST FOR A PROJECT LIKE THIS.")
        cutscene:text("[color:purple]> WHICH IS WHY I'VE DECIDED TO MAKE THE ELEVATOR ONLY LOCKED BY THE PRESS OF THE RED BUTTON.")
        cutscene:text("[color:purple]> WHOEVER MAY BE READING THIS,[wait:5] REMEMBER TO CHOOSE SIMPLICITY.[wait:5] ALWAYS.")
    end,

    concealed = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> To protect from intruders, the path to vital equipment has been concealed.")
        cutscene:text("[color:#ff00ff]> Please do not attempt to walk off the edge in this area.")
    end,

    terminal4 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:purple]> HELLO.[wait:5] THIS IS DR. G.")
        cutscene:text("[color:purple]> AFTER MANY,[wait:5] MANY DIFFERENT ATTEMPTS AT MAKING A SECURITY SYSTEM,[wait:5] I THINK WE'VE DONE IT.")
        cutscene:text("[color:purple]> MODELED AFTER MY VERY ASSISTANT,[wait:5] MODEL 3 SEEMS TO HAVE A 85% SUCCESS RATE.")
        cutscene:text("[color:purple]> THAT IS A 30% INCREASE FROM MODEL 2,[wait:5] AND AN 80% INCREASE FROM MODEL 1![wait:5]")
    end,

    elevatorControl = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> Welcome to the Gateway Elevator Control office.")
        cutscene:text("[color:#ff00ff]> Please allow Gateway officials to disable and re-enable elevator controls.")
    end,

    hometownLimit = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> You have now passed the Hometown Town Limits.[wait:5] Thank you for visiting!")
        cutscene:text("[color:#ff00ff]> We hope you'll return soon!")
        cutscene:setSpeaker("noelle")
        cutscene:text("* (We're out of Hometown...?)", "confused_surprise_b") 
    end,

    elevatorDisabled = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:#ff00ff]> WARNING: Elevator is currently disabled.[wait:5] Please enable it at the Elevator Control office.")
        cutscene:setSpeaker("susie")
        cutscene:text("* (Didn't we see an office like that earlier...?)", "suspicious") 
    end,

    terminal5 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:purple]> HELLO.[wait:5] THIS IS DR. G.")
        cutscene:text("[color:purple]> I HAVE DECIDED TO CREATE AN ACCESS DRIVE BASED ON MY ASSISTANT'S DEVICE.")
        cutscene:text("[color:purple]> VERY BRIGHT SCIENTIST HE IS,[wait:5] I GUARANTEE HE MAY REACH GREATNESS...")
        cutscene:text("[color:purple]> WE SHALL CONTINUE TO MAKE OUR EXPERIMENTS BIGGER AND BETTER.[wait:5] TOGETHER.")
        cutscene:setSpeaker("susie")
        cutscene:text("* (I wonder if one of those scientists was the one we met earlier...)", "neutral_side") 
    end,

    terminal6 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:blue]> HELLO.[wait:5] THIS IS DR. O,[wait:5] DR. G TOLD ME TO USE ONLY MY INITIAL FOR THESE LOGS.")
        cutscene:text("[color:blue]> BUT I AM GETTING SIDETRACKED,[wait:5] THIS SEEMS TO BE MY BEST CREATION YET.")
        cutscene:text("[color:blue]> IT IS A DEVICE,[wait:5] THIS IS THE GATEWAY VERSION OF IT,[wait:5] I PLAN TO MAKE A SHELTER ONE TOO.")
        cutscene:text("[color:blue]> I THINK THIS COULD BE USEFUL AS A SECURITY FEATURE,[wait:5] PERHAPS I COULD INCLUDE AN ACCESSDRIVE.")
        cutscene:text("[color:blue]> AND THEN,[wait:5] IF YOU INSERTED IT,[wait:5] IT COULD GIVE YOU ACCESS TO DISABLE GATEWAY LOCKDOWNS!")
        cutscene:text("[color:blue]> I SHALL NOT MAKE THIS LOG TOO LONG,[wait:5] THOUGH,[wait:5] LET ME NOTIFY DR. G AT ONCE.")
        cutscene:setSpeaker("noelle")
        cutscene:text("* (... an \"ACCESSDRIVE\"...?)", "confused_surprise_b") 
    end,

    terminal7 = function(cutscene)   
        cutscene:setSpeaker("voicemail")
        cutscene:text("[color:blue]> HELLO.[wait:5] THIS IS DR. O.")
        cutscene:text("[color:blue]> AFTER MY PREVIOUS PROJECT,[wait:5] I'VE DECIDED TO MOVE TO A MORE...[wait:5] SIMPLE ONE.")
        cutscene:text("[color:blue]> WELL,[wait:5] NOT EXACTLY SIMPLE,[wait:5] BUT STILL.")
        cutscene:text("[color:blue]> I'VE DEVELOPED \"WINDOWS\" TO PUT AROUND THE GATEWAY.")
        cutscene:text("[color:blue]> THEY SHOULD ALLOW ME TO MONITOR OTHER,[wait:5] DISTANT LANDS.")
        cutscene:text("[color:blue]> THE ONE I'M CURRENTLY MONITORING IS THE ONE DR. G PLANNED TO MONITOR,[wait:5] BEFORE...")
        cutscene:text("[color:blue]> ...")
        cutscene:text("[color:blue]> NO MATTER,[wait:5] HE'LL BE BACK SOON,[wait:5] I'LL MAKE SURE OF IT.")
    end,

    window = function(cutscene)   
        cutscene:text("* (It's a sort of window,[wait:5] showing a different land.)") 
    end,
}