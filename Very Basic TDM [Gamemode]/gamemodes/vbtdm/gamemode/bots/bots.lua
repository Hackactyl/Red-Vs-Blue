// Create a bot


function vb_bot( ply )
if ply:IsAdmin() then
	game.ConsoleCommand("bot\n")
end
end

concommand.Add( "vb_create_bot", vb_bot )