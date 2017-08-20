net.Receive( "_ttt_end_round_music", function( byte, Player )
	local _sound = net.ReadString( );
	surface.PlaySound( _sound );
end )