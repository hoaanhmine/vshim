function onCreate()
	-- background shit
	makeLuaSprite('it', 'it', -350, -50);
	setScrollFactor('it', 1.0, 1.0);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		precacheImage("characters/itDrums")


	end

	addLuaSprite('it', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end