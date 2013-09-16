f = 1
go = 0
function think_ammo()
	for k, ply in pairs( player.GetAll() ) do
	if IsValid(ply) then
	if(ply.c == nil) then
	ply.c = 1
	end
		if(ply:Alive()) then
			ply.c = 1
			if (ply:GetActiveWeapon():GetClass() == nil) then
			ply.currentweapon = "Nothing"
			elseif (ply:GetActiveWeapon():GetClass() != "weapon_crowbar") then
			ply.currentweapon = ply:GetActiveWeapon():GetClass()
			end
		elseif(!ply:Alive() and ply.c == 1) then
			ply.c = 0
			local deathpos = ply:GetPos()
			if ( ply.currentweapon == "weapon_smg1" ) then
			local deathammo = ents.Create("item_ammo_smg1")
			deathammo:SetPos(deathpos+Vector(0,0,25))
			deathammo:Spawn()
			ply.currentweapon = ""
			elseif ( ply.currentweapon == "weapon_shotgun" ) then
			local deathammo = ents.Create("item_box_buckshot")
			deathammo:SetPos(deathpos+Vector(0,0,25))
			deathammo:Spawn()
			ply.currentweapon = ""
			elseif ( ply.currentweapon == "weapon_pistol" ) then
			local deathammo = ents.Create("item_ammo_pistol")
			deathammo:SetPos(deathpos+Vector(0,0,25))
			deathammo:Spawn()
			ply.currentweapon = ""
			/*deathammo:SetMoveType(MOVETYPE_FLY)
			deathammo:SetLocalVelocity( deathammo:GetForward()*f )*/
			end
		end		
	end
	end
end
hook.Add("Think","Ammothink",think_ammo)
/*function Ammo_Float()
if go == 0 then
i = i + 1
if i == 10 then
f = -1
go = 1
end
elseif go == 1 then
i = i - 1
if i == 0 then
f = 1
go = 0
end
end
timer.Create("Ammo_Float", 0.25, 0, Ammo_Float)*/