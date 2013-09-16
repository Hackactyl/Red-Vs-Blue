if SERVER then return end

// I don't know how this works, nor do I care. It just gives my damn gamemode hands!
function GM:PostDrawViewModel( vm, ply, weapon )
if ( weapon.UseHands || !weapon:IsScripted() ) then
local hands = LocalPlayer():GetHands()
if ( IsValid( hands ) ) then hands:DrawModel() end
end
end