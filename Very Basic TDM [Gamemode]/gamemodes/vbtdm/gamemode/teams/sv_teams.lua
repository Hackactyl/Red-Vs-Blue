// Server side


function FirstSpawn( ply )
if ply:IsValid() then
timer.Create( "First_Spawn", 1, 1, function()
	ply:StripAmmo()
	ply:StripWeapons()
	ply:GodEnable()
	ply:SetTeam( 9 )
	ply:SetModel( "models/player/Group01/Male_02.mdl" )
	ply:Give( "gmod_camera" )
	ply:Spawn()
	end)
	timer.Create( "First_Spawn2", 5, 1, function()
	ply:ConCommand( "vbtdm_menu_info" )
	ply:ConCommand( "vbtdm_menu" )
	end)
if ply:SteamID() == "BOT"  then
timer.Create( "First_Spawn", 2, 1, function()
	ply:StripAmmo()
	ply:StripWeapons()
	ply:SetTeam( 8 )
	ply:SetModel( "models/player/gman_high.mdl" )
	ply:GodDisable()
	ply:Give( "weapon_crowbar" )
	ply:Spawn()
	end)
end
end
end
hook.Add( "PlayerInitialSpawn", "playerfirstspawn", FirstSpawn )

// Custom Spawning
function CustomSpawn( ply )
	local Team = ply:Team()
	points = ents.FindByClass("team" .. Team)
	if #points == 0 then
	points = ents.FindByClass("info_player_start")
	end
	
	return points[math.random(#points)]
end
hook.Add( "PlayerSelectSpawn", "CustomSpawn", CustomSpawn )

// Player Spawning
function GM:PlayerSpawn( ply )
local CounterTerrorists = {"models/player/leet.mdl","models/player/guerilla.mdl","models/player/arctic.mdl","models/player/phoenix.mdl"}
local Terrorists = {"models/player/urban.mdl","models/player/gasmask.mdl","models/player/riot.mdl","models/player/swat.mdl"}

// US TEAM
if ply:Team() == 2 then
	ply:GodDisable()
    ply:SetModel( table.Random(Terrorists) )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end


// GERMAN TEAM
if ply:Team() == 3 then
	ply:GodDisable()
    ply:SetModel( table.Random(CounterTerrorists) )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end

// GUEST TEAM
if ply:Team() == 9 then
	ply:GodEnable()
    ply:SetModel( "models/player/Group01/Male_02.mdl" )
	ply:Give( "gmod_camera" )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end


// ADMIN TEAM
if ply:Team() == 1 then
	ply:GodEnable()
    ply:Give( "weapon_physgun" )
    ply:Give( "weapon_crowbar" )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end


// BOT
if ply:Team() == 8 then
	ply:GodDisable()
	ply:SetModel( "models/player/gman_high.mdl" )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end


// NULL TEAM
if ply:Team() == 1337 then
	ply:GodEnable()
    ply:SetModel( "models/player/zombie_soldier.mdl" )
    ply:Give( "weapon_physgun" )
local armor = "armor"
local checkarmor = tonumber(file.Read("vbtdm/armor/"..armor..".txt","DATA"))
if checkarmor == 1 then
	ply:SetArmor( 100 )
end
end
end

 


// US Team
function Team_US( ply )
local name = ply:Nick()
if GetConVarNumber("freeze_teams") == 1 then return end
	ply:SetTeam( 2 )
	print("[VBTDM] Setting '" .. name .. "' to blue team\n")
	ply:Spawn()
end

// Germany Team
function Team_Germany( ply )
local name = ply:Nick()
if GetConVarNumber("freeze_teams") == 1 then return end
	ply:SetTeam( 3 )
	print("[VBTDM] Setting '" .. name .. "' to red team\n")
	ply:Spawn()
end


// Admin Team
function Team_Admin( ply )
local name = ply:Nick()
if ply:IsAdmin() then
	ply:SetTeam( 1 )
	print("[VBTDM] Setting '" .. name .. "' to Admin Team\n")
	ply:Spawn()
else
MsgN("[VBTDM] "..name.." tried to become team admin.")
end
end


// Null Team - don't touch this!
function Team_Null( ply )
local name = ply:Nick()
if ply:IsAdmin() then
    ply:SetTeam( 1337 )
	print("[VBTDM] Setting '" .. name .. "' to Null Team\n")
	ply:Spawn()
end
end

concommand.Add( "Team_US", Team_US )
concommand.Add( "Team_Germany", Team_Germany )
concommand.Add( "Team_Admin", Team_Admin )
concommand.Add( "Team_Null", Team_Null )