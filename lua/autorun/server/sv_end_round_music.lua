END_OF_ROUND_SOUNDS = {
	"round/sound1.mp3",
	"round/sound2.mp3",
	"round/sound3.mp3",
	"round/sound4.mp3",
	"round/sound5.mp3",
	"round/sound6.mp3",
	"round/sound7.mp3",
	"round/sound8.mp3",
	"round/sound9.mp3",
	"round/sound10.mp3",
	"round/sound11.mp3",
	"round/sound12.mp3",
	"round/sound13.mp3",
	"round/sound14.mp3",
	"round/sound15.mp3",
	"round/sound16.mp3",
	"round/sound17.mp3",
	"round/sound18.mp3",
	"round/sound19.mp3",
	"round/sound20.mp3",
	"round/sound21.mp3",
	"round/sound22.mp3",
	"round/sound23.mp3",
	"round/sound24.mp3",
	"round/sound25.mp3",
	"round/sound26.mp3",
	"round/sound27.mp3",
	"round/sound28.mp3",
	"round/sound29.mp3",
	"round/sound30.mp3",
	"round/sound31.mp3",
	"round/sound32.mp3",
	"round/sound33.mp3",
	"round/sound34.mp3",
	"round/sound35.mp3",
	"round/sound36.mp3",
	"round/sound37.mp3",
	"round/sound38.mp3",
	"round/sound39.mp3",
	"round/sound40.mp3",
	"round/sound41.mp3",
	"round/sound42.mp3",
	"round/sound43.mp3",
	"round/sound44.mp3",
	"round/sound45.mp3",
	"round/sound46.mp3",
	"round/sound47.mp3",
	"round/sound48.mp3",
	"round/sound49.mp3",
	"round/sound50.mp3",
	"round/sound51.mp3",
	"round/sound52.mp3",
	"round/sound53.mp3",
	"round/sound54.mp3",
	"round/sound55.mp3",

	}

// You must define a default sound to play if some of your lists above are empty.
END_OF_ROUND_WIN_DEFAULT_SOUND = "round/sound1.mp3";

if ( SERVER ) then
	util.AddNetworkString( "_ttt_end_round_music" );

	for k, v in pairs( END_OF_ROUND_SOUNDS ) do resource.AddFile( "sound/" .. v ); end

	local function endofround( wintype )
		// Default sound
		local _sound = END_OF_ROUND_WIN_DEFAULT_SOUND

		if wintype == WIN_INNOCENT or wintype == WIN_TRAITOR or wintype == WIN_TIMELIMIT then
			_sound = "round/sound2.mp3";
		end

		-- if wintype == WIN_INNOCENT then
		--	_sound = table.Random( END_OF_ROUND_SOUNDS );
		-- elseif wintype == WIN_TRAITOR then
		--	_sound = table.Random( END_OF_ROUND_SOUNDS );
		-- elseif wintype == WIN_TIMELIMIT then
		--	_sound = table.Random( END_OF_ROUND_SOUNDS );
		-- end

		net.Start( "_ttt_end_round_music" );
			net.WriteString( _sound );
		net.Broadcast( );
	end
	hook.Add( "TTTEndRound", "Handymanendofround", endofround )
end
