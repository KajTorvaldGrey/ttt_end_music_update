-- Enter the amount of sound files here.
-- Make sure that the sound files are in the round folder
AMOUNT_OF_FILES = 55

-- Sets the chance of the song to appear
-- 0 = only chance to appear
-- sound_chance < 0 = song will not appear
sound_chance = {}
for i=0, (AMOUNT_OF_FILES-1) do
	sound_chance[i] = 0
end

-- IDEA
-- 1. declare every song number as 0
-- 2. reduce the song number to be below 0 if selected
-- 3. check song numbers if they are below 0
-- 4. if they are, increase them by 1 every round
-- 5. only songs with number 0 can be played

-- TODO
-- Test on server

// You must define a default sound to play if some of your lists above are empty.
END_OF_ROUND_WIN_DEFAULT_SOUND = "round/sound1.mp3";

if ( SERVER ) then
	util.AddNetworkString( "_ttt_end_round_music" );

	for i=1, AMOUNT_OF_FILES do
		resource.AddFile( "sound/round/sound"..i ..".mp3");
	end

	local function endofround( wintype )
		// Default sound
		local _sound = END_OF_ROUND_WIN_DEFAULT_SOUND

		if wintype == WIN_INNOCENT or wintype == WIN_TRAITOR or wintype == WIN_TIMELIMIT then
			local selectedSound = math.random(0, AMOUNT_OF_FILES-1);
			if sound_chance[selectedSound]<0 then
				sound_chance[selectedSound] = sound_chance[selectedSound] + 1;
			else
				_sound = "round/sound"..sound_chance[selectedSound]..".mp3";
		end

-- end of server shit
		net.Start( "_ttt_end_round_music" );
			net.WriteString( _sound );
		net.Broadcast( );
	end
	hook.Add( "TTTEndRound", "Handymanendofround", endofround )
end
