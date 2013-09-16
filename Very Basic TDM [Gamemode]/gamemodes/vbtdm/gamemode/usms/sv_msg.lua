// Message System... Yeah I know there is a lot of them
// I hope you don't start snooping around here...

// Enable Friendly Fire
function vb_msg_ff_enable_1( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_ff_enable_1")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_ff_enable_1", vb_msg_ff_enable_1 )

// Disable Friendly Fire
function vb_msg_ff_enable_2( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_ff_enable_2")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_ff_enable_2", vb_msg_ff_enable_2 )

// Spawning with armor
function vb_msg_armor_on( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_armor_on")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_armor_on", vb_msg_armor_on )

// Spawning without Armor
function vb_msg_armor_off( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_armor_off")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_armor_off", vb_msg_armor_off )

// Create a bot
function vb_msg_create_bot( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_create_bot")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_create_bot", vb_msg_create_bot )

// Lock Teams
function vb_msg_teams_lock( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_teams_lock")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_teams_lock", vb_msg_teams_lock )

// Goal 1
function vb_msg_win_goal_1( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_1")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_1", vb_msg_win_goal_1 )

// Goal 2
function vb_msg_win_goal_2( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_2")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_2", vb_msg_win_goal_2 )

// Goal 3
function vb_msg_win_goal_3( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_3")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_3", vb_msg_win_goal_3 )

// Goal 4
function vb_msg_win_goal_4( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_4")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_4", vb_msg_win_goal_4 )

// Goal 5
function vb_msg_win_goal_5( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_5")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_5", vb_msg_win_goal_5 )

// Goal 6
function vb_msg_win_goal_6( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_6")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_6", vb_msg_win_goal_6 )

// Goal 7
function vb_msg_win_goal_7( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_7")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_7", vb_msg_win_goal_7 )

// Goal 8
function vb_msg_win_goal_8( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_8")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_8", vb_msg_win_goal_8 )

// Goal 9
function vb_msg_win_goal_9( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_9")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_9", vb_msg_win_goal_9 )

// Goal 10
function vb_msg_win_goal_10( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_10")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_10", vb_msg_win_goal_10 )

// Goal 0
function vb_msg_win_goal_custom( ply, cmd, args )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_custom")
		umsg.String(args[1])
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_custom", vb_msg_win_goal_custom )

// Goal 0
function vb_msg_win_goal_0( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_win_goal_0")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_win_goal_0", vb_msg_win_goal_0 )

// Unlock Teams
function vb_msg_teams_unlock( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_teams_unlock")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_teams_unlock", vb_msg_teams_unlock )

// Resetting the score
function vb_msg_reset_score( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_reset_score")
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_reset_score", vb_msg_reset_score )

// Attemping to killself
function vb_msg_kill_self( ply )
	umsg.Start( "vb_msg_kill_self", ply)
	umsg.End()
end
concommand.Add( "vb_msg_kill_self", vb_msg_kill_self )

// Switching to team admin
function vb_msg_team_admin( ply )

if ply:IsAdmin() then
	umsg.Start( "vb_msg_team_admin", ply)
	umsg.End()
else
	umsg.Start( "vb_msg_not_admin", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_team_admin", vb_msg_team_admin )

// US Team Check
function vb_msg_team_US( ply )
if GetConVarNumber( "freeze_teams" ) == 0 then
	umsg.Start( "vb_msg_team_US", ply)
	umsg.End()
else
	umsg.Start( "vb_msg_team_are_locked", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_team_US", vb_msg_team_US )

// GERMAN Team Check
function vb_msg_team_Germany( ply )
if GetConVarNumber( "freeze_teams" ) == 0 then
	umsg.Start( "vb_msg_team_Germany", ply)
	umsg.End()
else
	umsg.Start( "vb_msg_team_are_locked", ply)
	umsg.End()
end
end
concommand.Add( "vb_msg_team_Germany", vb_msg_team_Germany )

// Class 1
function vb_msg_class_1( ply )

	umsg.Start( "vb_msg_class_1", ply)
	umsg.End()
end
concommand.Add( "vb_msg_class_1", vb_msg_class_1 )

// Class 2
function vb_msg_class_2( ply )

	umsg.Start( "vb_msg_class_2", ply)
	umsg.End()
end
concommand.Add( "vb_msg_class_2", vb_msg_class_2 )

// Class 2
function vb_msg_class_3( ply )

	umsg.Start( "vb_msg_class_3", ply)
	umsg.End()
end
concommand.Add( "vb_msg_class_3", vb_msg_class_3 )