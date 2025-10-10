return {

    terminal1 = function(cutscene)
    
    Kristal.Console:log("test")   
        cutscene:text("* You see an audio log here.[wait:5]\n * It reads as follows:") 
        cutscene:text("[color:purple]HELLO, [wait:5] \nTHIS IS DR. G.")
        cutscene:text("[color:purple]THE EXPERIMENTS HAVE BEEN, [wait:5] \nINTERESTING.[wait:5].[wait:5].[wait:5]")
        cutscene:text("[color:purple]THINGS HAVE BEEN GETTING A BIT OFFTRACK IN THE GATEWAY.")
        cutscene:text("[color:purple]THE LIQUIDS LOOKING GREAT TODAY.[wait:5]\nIT MAY BE READY ALREADY!")
        cutscene:text("[color:purple]HMM, LET'S SEE...[wait:5] \nLOOKING ALRIGHT,[wait:5] ANYWAY...[wait:5] WOAH-")
        cutscene:text("* You hear a distant splash,[wait:5] followed by harrowing screams.")
        cutscene:setSpeaker(susie)
        cutscene:text("* That can't be good.", "sad")
    
    end,

    }