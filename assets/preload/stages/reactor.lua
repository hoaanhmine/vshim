function onCreatePost()
	makeLuaSprite('red', 'empty', -100, -100)
    makeGraphic('red', 1400, 820, 'ff0000')
    setObjectCamera('red', 'hud')
	setProperty("red.alpha", 0)
		addLuaSprite('red', true)
	

end

function onCreate()

	makeLuaSprite('bg', 'stages/reactor background', -600, -600);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.7, 0.7);
	addLuaSprite('bg', false);

	makeLuaSprite('yellow', 'stages/susBoppers', 0, 300);
	makeAnimatedLuaSprite('yellow', 'stages/susBoppers', 490, 790);
	scaleObject('yellow', 0.7, 0.7);
	setScrollFactor('yellow', 1, 1);
	addLuaSprite('yellow', false);
	-- ('lua object name", "lua animation name for object", "xml animation", fps, true/false = if over and under)
	addAnimationByPrefix('yellow', 'ybounce', 'yellow sus', 24, false)
	

	makeLuaSprite('backp', 'stages/back pillars', -600, -600);
	setLuaSpriteScrollFactor('backp', 1, 1);
	scaleObject('backp', 0.7, 0.7);
	addLuaSprite('backp', false);

	makeLuaSprite('blue', 'stages/susBoppers', 0, 300);
	makeAnimatedLuaSprite('blue', 'stages/susBoppers', 2250, 800);
	scaleObject('blue', 0.7, 0.7)
	setScrollFactor('blue', 1, 1);
	addLuaSprite('blue', false);
	-- ('lua object name", "lua animation name for object", "xml animation", fps, true/false = if over and under)
	addAnimationByPrefix('blue', 'blounce', 'blue sus', 24, false)

	makeLuaSprite('middlep', 'stages/middle pillars', -600, -600);
	setLuaSpriteScrollFactor('middlep', 1, 1);
	scaleObject('middlep', 0.7, 0.7);
	addLuaSprite('middlep', false);
	
	makeLuaSprite('brown', 'stages/susBoppers', 0, 300);
	makeAnimatedLuaSprite('brown', 'stages/susBoppers', 30, 840);
	scaleObject('brown', 0.7, 0.7);
	setScrollFactor('brown', 1, 1);
	addLuaSprite('brown', false);
	-- ('lua object name", "lua animation name for object", "xml animation", fps, true/false = if over and under)
	addAnimationByPrefix('brown', 'bbounce', 'brown sus', 24, false)

	makeLuaSprite('white', 'stages/susBoppers', 0, 300);
	makeAnimatedLuaSprite('white', 'stages/susBoppers', 2550, 910);
	scaleObject('white', 0.7, 0.7)
	setScrollFactor('white', 1, 1);
	addLuaSprite('white', false);
	-- ('lua object name", "lua animation name for object", "xml animation", fps, true/false = if over and under)
	addAnimationByPrefix('white', 'wbounce', 'white sus', 24, false)
	
	makeLuaSprite('frontp', 'stages/front pillars', -600, -600);
	setLuaSpriteScrollFactor('frontp', 1, 1);
	scaleObject('frontp', 0.7, 0.7);
	addLuaSprite('frontp', false);

	makeLuaSprite('energy', 'stages/ball of big ol energy', 660, -410);
	setLuaSpriteScrollFactor('energy', 1, 1);
	scaleObject('energy', 0.7, 0.7);
	addLuaSprite('energy', false);

	makeLuaSprite('console', 'stages/center console', 820, 830);
	setLuaSpriteScrollFactor('console', 1, 1);
	scaleObject('console', 0.7, 0.7);
	addLuaSprite('console', false);

	makeLuaSprite('sconsole', 'stages/side console', -400, 1100);
	setLuaSpriteScrollFactor('sconsole', 1, 1);
	scaleObject('sconsole', 0.7, 0.7);
	addLuaSprite('sconsole', false);

	makeLuaSprite('cranes', 'stages/upper cranes', 450, -600);
	setLuaSpriteScrollFactor('cranes', 1, 1);
	scaleObject('cranes', 0.7, 0.7);
	addLuaSprite('cranes', false);

 --[[
 	makeLuaSprite('ref', 'stages/reference', -600, -600);
	setLuaSpriteScrollFactor('ref', 1, 1);
	addLuaSprite('ref', false);
	scaleObject('ref', 0.7, 0.7);
	setProperty("ref.alpha", 0.4)
	--]]
	
	setProperty('cameraSpeed', 2)
	

	setProperty("ref.alpha", 0)
end

local variable = true;

	
function onBeatHit()


	
	


   if variable == true then
      variable = false

     
	   
   elseif variable == false then
      variable = true
	setProperty('energy.x', 540);
	setProperty('energy.y', -500);
	scaleObject('energy', 0.8, 0.8);
	doTweenX('energyx', 'energy.scale', 0.7, 0.2, 'easeOut')
	doTweenY('energyy', 'energy.scale', 0.7, 0.2, 'easeOut')
	objectPlayAnimation('yellow', 'ybounce', false)
	objectPlayAnimation('brown', 'bbounce', false)
	objectPlayAnimation('white', 'wbounce', false)
	objectPlayAnimation('blue', 'blounce', false)	

end

end

function onTweenCompleted(tag)
if tag == 'red1' then
 doTweenAlpha('red', 'red', 0, 0.6, 'easeOut')
end
end



local followchars = true;

local y = 1000
-- camera movement
function onUpdate(elapsed)

    if followchars == true then
        if mustHitSection == false then
            triggerEvent('Camera Follow Pos','1300',y)
        else
			triggerEvent('Camera Follow Pos','1600',y)
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

end

function onEvent(name, value1, value2)
	if value1 == 'Zoom' then
		if value2 == 'True' then
			setProperty('defaultCamZoom', 0.9)
			y = 1100
		end
		if value2 == 'False' then
			setProperty('defaultCamZoom', 0.6)
			y = 1000
		end
	end
	
	if value1 == 'Flash' then
			doTweenAlpha('red1', 'red', 0.4, 0.000001, 'easeOut')
	end
end
