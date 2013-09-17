AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
 
include( 'shared.lua' )

function GM:PlayerSpawn( ply )
    self.BaseClass:PlayerSpawn( ply )   
 
    ply:SetGravity  ( .65 )  
    ply:SetMaxHealth( 100, true )  
 
    ply:SetWalkSpeed( 325 )  
    ply:SetRunSpeed ( 400 ) 
 
end

function GM:PlayerLoadout( ply )

	ply:StripWeapons()

	if ply:Team() == 1 then
		ply:Give( "weapon_ttt_ma5b" )
		ply:Give( "weapon_ttt_halosword" )
		ply:Give( "weapon_ttt_m6d" )
		ply:SetModel( "models/player/masterchiefh2_red.mdl" )
	end

	if ply:Team() == 2 then
		ply:Give( "weapon_ttt_ma5b" )
		ply:Give( "weapon_ttt_halosword" )
		ply:Give( "weapon_ttt_m6d" )
		ply:SetModel( "models/player/masterchiefh2_blue.mdl" )
	end
	
	if ply:Team() == 2 then
		ply:Give( "weapon_ttt_ma5b" )
		ply:Give( "weapon_ttt_halosword" )
		ply:Give( "weapon_ttt_m6d" )
		ply:SetModel( "models/peterboi/masterchief" )
	end
	
end

function GM:PlayerInitialSpawn( ply )
	   ply:PrintMessage( HUD_PRINTTALK, "Welcome to Red Vs. Blue, Spartan " .. ply:Name() .. "!" )
	   ply:SetTeam( 3 )
	   ply:ConCommand( "team_menu" )
end

concommand.Add( "team_menu", set_team )

function GM:CheckRoundEnd()
 
	if ( !GAMEMODE:InRound() ) then return end 
 
	for k,v in pairs( team.GetPlayers( red and blue ) ) do
 
		if v:Frags() >= 25 then
 
		      GAMEMODE:RoundEndWithResult( v )
 
                end
 
        end
 
end
 
// This is called after a player wins in a free for all
function GM:OnRoundWinner( ply, resulttext )
 
	ply:AddScore( 1 ) // Let's pretend we have AddScore for brevity's sake
 
end
 
// Called when the round ends
function GM:OnRoundEnd( num )
 
       for k,v in pairs( team.GetPlayers( red and blue ) ) do
             v:SetFrags( 0 ) // Reset their frags for next round
       end
 
end
