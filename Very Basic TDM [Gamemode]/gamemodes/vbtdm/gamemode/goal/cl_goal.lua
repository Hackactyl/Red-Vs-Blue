//Set win goal!


function vb_TEAM_2_win()
	surface.PlaySound( "vbtdm/us_win.mp3" )
	local TEAM_2_TeamGoalFrame = vgui.Create( "DFrame" )
	TEAM_2_TeamGoalFrame:SetPos( 50, 50 ) --Set the window in the middle of the players screen/game window
	TEAM_2_TeamGoalFrame:SetSize( 200, 100 ) --Set the size
	TEAM_2_TeamGoalFrame:SetTitle( "Blue TEAM WINS" ) --Set title
	TEAM_2_TeamGoalFrame:Center()
	TEAM_2_TeamGoalFrame:SetVisible( true )
	TEAM_2_TeamGoalFrame:SetDraggable( false )
	TEAM_2_TeamGoalFrame:MakePopup()
	TEAM_2_TeamGoalFrame:ShowCloseButton(false)
	
	local TEAM_2_Text = vgui.Create("DLabel", TEAM_2_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_2_Text:SetPos(21,48)
	TEAM_2_Text:SetColor( Color( 0, 0, 0, 255 ) )
	TEAM_2_Text:SetFont("default")
	TEAM_2_Text:SetText("You can type here, press enter")
	TEAM_2_Text:SizeToContents()
	
	local TEAM_2_TextThree = vgui.Create("DLabel", TEAM_2_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_2_TextThree:SetPos(46,64)
	TEAM_2_TextThree:SetColor( Color( 51, 102, 255, 255 ))
	TEAM_2_TextThree:SetFont("default")
	TEAM_2_TextThree:SetText("Blue TEAM WINS!")
	TEAM_2_TextThree:SizeToContents()
	
	local TEAM_2_TextTwo = vgui.Create("DLabel", TEAM_2_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_2_TextTwo:SetPos(15,80)
	TEAM_2_TextTwo:SetColor( Color( 0, 0, 0, 255 ) )
	TEAM_2_TextTwo:SetFont("default")
	TEAM_2_TextTwo:SetText("The map will restart in 30 seconds!")
	TEAM_2_TextTwo:SizeToContents()
	
	local TEAM_2_DermaText = vgui.Create( "DTextEntry", TEAM_2_TeamGoalFrame )
	TEAM_2_DermaText:SetPos( 10,30 )
	TEAM_2_DermaText:SetTall( 20 )
	TEAM_2_DermaText:SetWide( 182 )
	TEAM_2_DermaText:SetEnterAllowed( true )
	TEAM_2_DermaText.OnEnter = function()
	RunConsoleCommand( "say", TEAM_2_DermaText:GetValue() )
end

timer.Create("chat",1,1,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 30 seconds" )
TEAM_2_restart_chat()
end)

function TEAM_2_restart_chat()
timer.Create("chat",15,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 15 seconds" )
TEAM_2_restart_chat2()
end)
end

function TEAM_2_restart_chat2()
timer.Create("chat",5,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 10 seconds" )
TEAM_2_restart_chat3()
end)
end

function TEAM_2_restart_chat3()
timer.Create("chat",5,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 5 seconds" )
end)
end
end


usermessage.Hook("vb_TEAM_2_win", vb_TEAM_2_win)

function vb_TEAM_3_win()
	surface.PlaySound( "vbtdm/ger_win.mp3" )
	local TEAM_3_TeamGoalFrame = vgui.Create( "DFrame" )
	TEAM_3_TeamGoalFrame:SetPos( 50, 50 ) --Set the window in the middle of the players screen/game window
	TEAM_3_TeamGoalFrame:SetSize( 200, 100 ) --Set the size
	TEAM_3_TeamGoalFrame:SetTitle( "Red TEAM WINS" ) --Set title
	TEAM_3_TeamGoalFrame:Center()
	TEAM_3_TeamGoalFrame:SetVisible( true )
	TEAM_3_TeamGoalFrame:SetDraggable( false )
	TEAM_3_TeamGoalFrame:MakePopup()
	TEAM_3_TeamGoalFrame:ShowCloseButton(false)
	
	local TEAM_3_Text = vgui.Create("DLabel", TEAM_3_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_3_Text:SetPos(21,48)
	TEAM_3_Text:SetColor( Color( 0, 0, 0, 255 ) )
	TEAM_3_Text:SetFont("default")
	TEAM_3_Text:SetText("You can type here, press enter")
	TEAM_3_Text:SizeToContents()
	
	local TEAM_3_TextThree = vgui.Create("DLabel", TEAM_3_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_3_TextThree:SetPos(41,64)
	TEAM_3_TextThree:SetColor( Color( 255, 0, 0 , 255 ))
	TEAM_3_TextThree:SetFont("default")
	TEAM_3_TextThree:SetText("Red TEAM WINS!")
	TEAM_3_TextThree:SizeToContents()
	
	local TEAM_3_TextTwo = vgui.Create("DLabel", TEAM_3_TeamGoalFrame) -- We only have to parent it to the DPanelList now, and set it's position.
	TEAM_3_TextTwo:SetPos(15,80)
	TEAM_3_TextTwo:SetColor( Color( 0, 0, 0, 255 ) )
	TEAM_3_TextTwo:SetFont("default")
	TEAM_3_TextTwo:SetText("The map will restart in 30 seconds!")
	TEAM_3_TextTwo:SizeToContents()
	
	local TEAM_3_DermaText = vgui.Create( "DTextEntry", TEAM_3_TeamGoalFrame )
	TEAM_3_DermaText:SetPos( 10,30 )
	TEAM_3_DermaText:SetTall( 20 )
	TEAM_3_DermaText:SetWide( 182 )
	TEAM_3_DermaText:SetEnterAllowed( true )
	TEAM_3_DermaText.OnEnter = function()
	RunConsoleCommand( "say", RedDermaText:GetValue() )
end

timer.Create("chat",1,1,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 30 seconds" )
TEAM_3_restart_chat()
end)

function TEAM_3_restart_chat()
timer.Create("chat",15,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 15 seconds" )
TEAM_3_restart_chat2()
end)
end

function TEAM_3_restart_chat2()
timer.Create("chat",5,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 10 seconds" )
TEAM_3_restart_chat3()
end)
end

function TEAM_3_restart_chat3()
timer.Create("chat",5,0,function()
	chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Restarting map in 5 seconds" )
end)
end

end
usermessage.Hook("vb_TEAM_3_win", vb_TEAM_3_win)
