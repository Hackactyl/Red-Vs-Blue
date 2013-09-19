// Freeze Teams

CreateConVar( "freeze_teams", "0", { FCVAR_REPLICATED + FCVAR_ARCHIVE } )

function team_lock( ply )
if ply:IsAdmin() then
	game.ConsoleCommand("freeze_teams 1\n")
end
end

function team_unlock( ply )
if ply:IsAdmin() then
	game.ConsoleCommand("freeze_teams 0\n")
end
end

concommand.Add( "teams_lock", team_lock )
concommand.Add( "teams_unlock", team_unlock )