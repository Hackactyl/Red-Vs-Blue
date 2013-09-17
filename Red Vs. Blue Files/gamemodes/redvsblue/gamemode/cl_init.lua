include( 'shared.lua' )

function set_team()
 
local frame = vgui.Create( "DFrame" )
frame:SetPos( ScrW() / 2, ScrH() / 2 ) --Set the window in the middle of the players screen/game window
frame:SetSize( 400, 400 ) --Set the size
frame:SetTitle( "Select Your Team!" ) --Set title
frame:SetVisible( true )
frame:SetDraggable( false )
frame:ShowCloseButton( true )
frame:MakePopup()
 
team_1 = vgui.Create( "DButton", frame )
team_1:SetPos( frame:GetTall() / 4, 4 ) --Place it half way on the tall and 5 units in horizontal
team_1:SetSize( 150, 100 )
team_1:SetText( "Red Army!" )
team_1.DoClick = function() --Make the player join team 1
    SetTeam ( 1 )
end
 
team_2 = vgui.Create( "DButton", frame )
team_2:SetPos( frame:GetTall() / 4, 105 ) --Place it next to our previous one
team_2:SetSize( 150, 100 )
team_2:SetText( "Blue Army!" )
team_2.DoClick = function() --Make the player join team 2
    SetTeam ( 2 )
end
 
end
//
team.SetUp( 1, "Red", Color(255,0,0,255) )
team.SetUp( 2, "Blue", Color(0,0,255,255) )
team.SetUp( 3, "Joining", Color(50,50,50,255) )
//
concommand.Add( "team_menu", set_team )
