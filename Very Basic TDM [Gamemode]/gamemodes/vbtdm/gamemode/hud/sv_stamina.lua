if not StaminaToggled then
    function Stamina_Spawn( ply )
    ply:SetNWInt( "Stamina", 100 )
	ply.TimeJump = CurTime()
	end
	hook.Add( "PlayerSpawn", "Stamina_Spawn", Stamina_Spawn )
		
	function Stamina_MainThink()
		for k, ply in pairs( player.GetAll() ) do
			if ply:GetNWInt( "Stamina" ) < 0 then ply:SetNWInt( "Stamina", 0 ) end
			if ply:GetNWInt( "Stamina" ) > 100 then ply:SetNWInt( "Stamina", 100 ) end
			if ply:GetMoveType() ~= MOVETYPE_NOCLIP then
				if ( ply:KeyDown( IN_SPEED ) or ply:KeyPressed( IN_SPEED ) ) and ply:GetNWInt( "Stamina" ) > 0 then
				ply:SetNWInt( "Stamina", ply:GetNWInt( "Stamina" )-0.1 )
				end
				if (ply:KeyPressed( IN_JUMP ) and ply:GetNWInt( "Stamina" ) > 0 and ply:WaterLevel() < 1 and ply.TimeJump <= CurTime() ) then
                ply:SetNWInt( "Stamina", ply:GetNWInt( "Stamina" )-2.5 )
				ply.TimeJump = CurTime() + 0.2
				end
				if (ply:GetNWInt( "Stamina" ) <= 0) then
                ply:SetRunSpeed( ply:GetWalkSpeed() )
				elseif (ply:GetNWInt( "Stamina" ) >= 10) then
				ply:SetRunSpeed( 500 ) // 500 is the default sprint speed, change to your current run speed if you have changed it
				end
			end
		end
	end
	hook.Add( "Think", "Stamina_MainThink", Stamina_MainThink )
end

function Stamina_Toggle()
    if StaminaToggled then
        StaminaToggled = false
    else
        StaminaToggled = true
    end
end

function Stamina_Regen()
	for k, v in pairs(player.GetAll()) do
		if((v:GetMoveType() ~= MOVETYPE_NOCLIP) and (!v:KeyDown(IN_SPEED)) and (!v:KeyDown(IN_JUMP)))then
			local Stam = v:GetNWInt("Stamina")
			if v:IsOnGround() and v:WaterLevel() == 0 and !v:KeyDown(IN_JUMP) then
				v:SetNWInt( "Stamina", math.Clamp(Stam+0.075, 0, 100))
			elseif v:IsOnGround() and v:WaterLevel() == 1 and !v:KeyDown(IN_JUMP) then
				v:SetNWInt( "Stamina", math.Clamp(Stam+0.15, 0, 100))
			end
		end
	end
end
timer.Create("Stamina_Regen", 0.01, 0, Stamina_Regen)
concommand.Add( "Stamina_toggle", Stamina_Toggle )