if CLIENT then return end

// I don't know how this works, nor do I care. It just gives my damn gamemode hands!
function HandsSpawn(ply)
local oldhands = ply:GetHands()
if ( IsValid( oldhands ) ) then oldhands:Remove() end
local hands = ents.Create( "gmod_hands" )
if ( IsValid( hands ) ) then
ply:SetHands( hands )
hands:SetOwner( ply )

-- Which hands should we use?
local cl_playermodel = ply:GetInfo( "cl_playermodel" )
local info = player_manager.TranslatePlayerHands( cl_playermodel )
if ( info ) then
hands:SetModel( info.model )
hands:SetSkin( info.skin )
hands:SetBodyGroups( info.body )
end

-- Attach them to the viewmodel
local vm = ply:GetViewModel( 0 )
hands:AttachToViewmodel( vm )

vm:DeleteOnRemove( hands )
ply:DeleteOnRemove( hands )

hands:Spawn()
end 
end

hook.Add( "PlayerSpawn", "HandsSpawn", HandsSpawn )