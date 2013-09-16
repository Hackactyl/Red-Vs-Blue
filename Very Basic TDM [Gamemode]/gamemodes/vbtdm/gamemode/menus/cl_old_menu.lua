

function set_team()
 
local ChangeTeamFrame = vgui.Create( "DFrame" )
ChangeTeamFrame:SetPos( 50, 50 ) --Set the window in the middle of the players screen/game window
ChangeTeamFrame:SetSize( 200, 250 ) --Set the size
ChangeTeamFrame:SetTitle( "Change Team" ) --Set title
ChangeTeamFrame:SetVisible( true )
ChangeTeamFrame:SetDraggable( true )
ChangeTeamFrame:ShowCloseButton( true )
ChangeTeamFrame:MakePopup()
 
TeamPolice = vgui.Create( "DButton", ChangeTeamFrame )
TeamPolice:SetParent( ChangeTeamFrame ) -- Set parent to our "DermaPanel"
TeamPolice:SetPos( 25, 30 ) --Place it half way on the tall and 5 units in horizontal
TeamPolice:SetSize( 150, 25 )
TeamPolice:SetText( "Team: Police" )
TeamPolice.DoClick = function() --Make the player join team 1
	ChangeTeamFrame:Close()
    RunConsoleCommand( "Team_Blue" )
end
 
TeamCriminal = vgui.Create( "DButton", ChangeTeamFrame )
TeamCriminal:SetParent( ChangeTeamFrame ) -- Set parent to our "DermaPanel"
TeamCriminal:SetPos( 25, 60 ) --Place it half way on the tall and 5 units in horizontal
TeamCriminal:SetSize( 150, 25 )
TeamCriminal:SetText( "Team: Criminal" )
TeamCriminal.DoClick = function() --Make the player join team 2
	ChangeTeamFrame:Close()
    RunConsoleCommand( "Team_Red" )
end

PlayerTeamList = vgui.Create("DListView")
PlayerTeamList:SetParent( ChangeTeamFrame )
PlayerTeamList:SetPos(25, 90)
PlayerTeamList:SetSize(150, 100)
PlayerTeamList:SetMultiSelect(false)
PlayerTeamList:AddColumn("Player") -- Add column
PlayerTeamList:AddColumn("Team")
for k,v in pairs(player.GetAll()) do
    PlayerTeamList:AddLine(v:Nick(),v:Team()) -- Add lines
end

Close = vgui.Create( "DButton", ChangeTeamFrame )
Close:SetParent( ChangeTeamFrame ) -- Set parent to our "DermaPanel"
Close:Center()
Close:SetPos( 25, 200 ) --Place it half way on the tall and 5 units in horizontal
Close:SetSize( 150, 25 )
Close:SetText( "Close" )
Close.DoClick = function() --Make the player join team 2
	ChangeTeamFrame:Close()
end

end
concommand.Add( "vbtdm_old_menu", set_team )