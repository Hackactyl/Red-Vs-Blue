// Server Side Menu

function ISaid( ply, saywhat )
local name = ply:Nick()
	if string.find(saywhat, "!teams") == 1 then 
		ply:ConCommand( "vbtdm_menu" )
		MsgN("[VBTDM] Player '" .. name .. "' said !teams")
	end
	if string.find(saywhat, "!old_teams") == 1 then 
		ply:ConCommand( "vbtdm_old_menu" )
		MsgN("[VBTDM] Player '" .. name .. "' for some reason said !teams_old")
	end
end
hook.Add( "PlayerSay", "ISaid", ISaid );

function MyMenu( ply ) --Start the function
    umsg.Start( "MyMenu", ply ) --Send the contents of "MyMenu" to the client
    umsg.End()
end --End the function
hook.Add("ShowTeam", "MyHook", MyMenu) --Add the hook "ShowHelp" so it opens with F1