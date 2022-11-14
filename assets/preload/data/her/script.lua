function onCreatePost()

    dadPositionX = getProperty("dad.x")
    dadPositionY = getProperty("dad.y")

    -- Configs (Edit Numbers Below if you don't like their speed)
    dadMaxX = 15 -- How far off the x-axis dad can travel
    dadMaxY = 15 -- How far off the y-axis dad can travel
    crashTT = 0.5 -- How long it takes for dad to travel (In Seconds)
    crashTTBack = 1 -- How long it takes for dad to return back (In Seconds)


    goBack = false

end



function opponentNoteHit(id, direction, noteType, isSustainNote)
    
    if isSustainNote == false then
        cancelTween("dadTweenCrash")
        if direction == 0 then
            doTweenX("dadTweenCrash", "dad", (dadPositionX-dadMaxX), crashTT, "expoOut")
            --debugPrint("0 [Left Arrow]")

        elseif direction == 1 then
            doTweenY("dadTweenCrash", "dad", (dadPositionY+dadMaxY), crashTT, "expoOut")
            --debugPrint("1 [Down Arrow]")

        elseif direction == 2 then
            doTweenY("dadTweenCrash", "dad", (dadPositionY-dadMaxY), crashTT, "expoOut")
            --debugPrint("2 [Up Arrow]")

        elseif direction == 3 then
            doTweenX("dadTweenCrash", "dad", (dadPositionX+dadMaxX), crashTT, "expoOut")
            --debugPrint("3 [Right Arrow]")

        end
    end

end

function onTweenCompleted(tag)
    if tag == "dadTweenCrash" and goBack == false then
        goBack = true
    end
end

function onUpdate(elapsed)
    --if getProperty("dad.x") >= (dadPositionX+dadMaxX) or getProperty("dad.x") <= (dadPositionX-dadMaxX) or getProperty("dad.y") >= (dadPositionY+dadMaxY) or getProperty("dad.y") <= (dadPositionY-dadMaxY) then
    if goBack == true then
        doTweenX("dadTweenX","dad", dadPositionX, crashTTBack, "expoInOut")
        doTweenY("dadTweenY","dad", dadPositionY, crashTTBack, "expoInOut")
        goBack = false
    end     
end


