// Client Side Mr. Apple :p
function set_team3()
chat.AddText( Color( 255, 255, 255 ), "[", Color( 255, 0, 0 ), "TDM", Color( 255, 255, 255 ), "] ", Color( 255, 255, 255 ), "Welcome to our server! Type !teams or press F2 to get started!" )
	surface.PlaySound( "vbtdm/info.mp3" )
end

function set_team2(ply)
local GAMEMODE_VERSION = "1.2.1"

// Start of Main Frame
local MainMenuFrame = vgui.Create( "DFrame" )
MainMenuFrame:SetSize( 900, 500 )
MainMenuFrame:SetTitle("Very Basic Team Deathmatch Menu: Version "..GAMEMODE_VERSION )
MainMenuFrame:Center()
MainMenuFrame:SetVisible( true )
MainMenuFrame:SetDraggable( false )
MainMenuFrame:MakePopup()
// End of Main Frame

// Start of TabsList
local MainMenuSheet = vgui.Create( "DPropertySheet", MainMenuFrame )
MainMenuSheet:SetPos( 5, 27 )
MainMenuSheet:SetSize( 890, 467 )
 
local TabOne = vgui.Create( "DPanelList" )
TabOne:SetPos( 0, 0 )
TabOne:SetSize( MainMenuSheet:GetWide(), MainMenuSheet:GetTall() )
TabOne:SetSpacing( 5 )
TabOne:EnableHorizontal( false )
TabOne:EnableVerticalScrollbar( true )
 
local TabTwo = vgui.Create( "DPanelList" )
TabTwo:SetPos( 0, 0 )
TabTwo:SetSize( MainMenuSheet:GetWide(), MainMenuSheet:GetTall() )
TabTwo:SetSpacing( 5 )
TabTwo:EnableHorizontal( false )
TabTwo:EnableVerticalScrollbar( true )

local TabThree = vgui.Create( "DPanelList" )
TabThree:SetPos( 0, 0 )
TabThree:SetSize( MainMenuSheet:GetWide(), MainMenuSheet:GetTall() )
TabThree:SetSpacing( 5 )
TabThree:EnableHorizontal( false )
TabThree:EnableVerticalScrollbar( true )

local TabFour = vgui.Create( "DPanelList" )
TabFour:SetPos( 0, 0 )
TabFour:SetSize( MainMenuSheet:GetWide(), MainMenuSheet:GetTall() )
TabFour:SetSpacing( 5 )
TabFour:EnableHorizontal( false )
TabFour:EnableVerticalScrollbar( true )

local TabFive = vgui.Create( "DPanelList" )
TabFive:SetPos( 0, 0 )
TabFive:SetSize( MainMenuSheet:GetWide(), MainMenuSheet:GetTall() )
TabFive:SetSpacing( 5 )
TabFive:EnableHorizontal( false )
TabFive:EnableVerticalScrollbar( true )
// End of TabsList

// Start of Extra Tab
local ExtraListOne = vgui.Create("DLabel", TabFive) -- We only have to parent it to the DPanelList now, and set it's position.
ExtraListOne:SetPos(7,5)
ExtraListOne:SetColor( Color( 0, 0, 0, 255 ) )
ExtraListOne:SetFont("default")
ExtraListOne:SetText("Some extra's that this gamemode has:")
ExtraListOne:SizeToContents()

local ExtraListTwo = vgui.Create("DLabel", TabFive) -- We only have to parent it to the DPanelList now, and set it's position.
ExtraListTwo:SetPos(7,15)
ExtraListTwo:SetColor( Color( 0, 0, 0, 255 ) )
ExtraListTwo:SetFont("default")
ExtraListTwo:SetText("Reminder: Some of these commands are Admin only and or Client Side only!")
ExtraListTwo:SizeToContents()
 
local Hitmarkers = vgui.Create( "DCheckBoxLabel", TabFive )
Hitmarkers:SetPos( 7,35 )
Hitmarkers:SetText( "Enable Hitmarkers" )
Hitmarkers:SizeToContents() -- Make its size to the contents. Duh?
Hitmarkers:SetValue( 0 )
Hitmarkers:SetConVar( "hitnums_enable" )

FriendlyFire1 = vgui.Create( "DButton", TabFive )
FriendlyFire1:SetPos( 7, 55 ) --Place it half way on the tall and 5 units in horizontal
FriendlyFire1:SetSize( 115, 25 )
FriendlyFire1:SetText( "Friendly Fire On" )
FriendlyFire1.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "ff_enable_1" )
	RunConsoleCommand( "vb_msg_ff_enable_1" )
end
FriendlyFire2 = vgui.Create( "DButton", TabFive )
FriendlyFire2:SetPos( 125, 55 ) --Place it half way on the tall and 5 units in horizontal
FriendlyFire2:SetSize( 115, 25 )
FriendlyFire2:SetText( "Friendly Fire off" )
FriendlyFire2.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "ff_enable_0" )
	RunConsoleCommand( "vb_msg_ff_enable_2" )
end

LockTeams1 = vgui.Create( "DButton", TabFive )
LockTeams1:SetPos( 7, 85 ) --Place it half way on the tall and 5 units in horizontal
LockTeams1:SetSize( 115, 25 )
LockTeams1:SetText( "Lock Teams" )
LockTeams1.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "teams_lock" )
	RunConsoleCommand( "vb_msg_teams_lock" )
end
LockTeams2 = vgui.Create( "DButton", TabFive )
LockTeams2:SetPos( 125, 85 ) --Place it half way on the tall and 5 units in horizontal
LockTeams2:SetSize( 115, 25 )
LockTeams2:SetText( "Unlock Teams" )
LockTeams2.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "teams_unlock" )
	RunConsoleCommand( "vb_msg_teams_unlock" )
end

LockTeams1 = vgui.Create( "DButton", TabFive )
LockTeams1:SetPos( 7, 115 ) --Place it half way on the tall and 5 units in horizontal
LockTeams1:SetSize( 115, 25 )
LockTeams1:SetText( "Armor On" )
LockTeams1.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "armor_on" )
	RunConsoleCommand( "vb_msg_armor_on" )
end
LockTeams2 = vgui.Create( "DButton", TabFive )
LockTeams2:SetPos( 125, 115 ) --Place it half way on the tall and 5 units in horizontal
LockTeams2:SetSize( 115, 25 )
LockTeams2:SetText( "Armor Off" )
LockTeams2.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "armor_off" )
	RunConsoleCommand( "vb_msg_armor_off" )
end

BotsButton = vgui.Create( "DButton", TabFive )
BotsButton:SetPos( 7, 145 ) --Place it half way on the tall and 5 units in horizontal
BotsButton:SetSize( 115, 25 )
BotsButton:SetText( "Create a Bot" )
BotsButton.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "vb_create_bot" )
    RunConsoleCommand( "vb_msg_create_bot" )
end

ResetScore = vgui.Create( "DButton", TabFive )
ResetScore:SetPos( 7, 175 ) --Place it half way on the tall and 5 units in horizontal
ResetScore:SetSize( 115, 25 )
ResetScore:SetText( "Reset Scores" )
ResetScore.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "vb_reset_team_scores" )
    RunConsoleCommand( "vb_msg_reset_score" )
end



local ExtraListThree = vgui.Create("DLabel", TabFive) -- We only have to parent it to the DPanelList now, and set it's position.
ExtraListThree:SetPos(7,205)
ExtraListThree:SetColor( Color( 0, 0, 0, 255 ) )
ExtraListThree:SetFont("default")
ExtraListThree:SetText("Win Goal:")
ExtraListThree:SizeToContents()

WinGoalOne = vgui.Create( "DButton", TabFive )
WinGoalOne:SetPos( 7, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalOne:SetSize( 25, 25 )
WinGoalOne:SetText( "10" )
WinGoalOne.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_1" )
	RunConsoleCommand( "vb_msg_win_goal_1" )
end

WinGoalTwo = vgui.Create( "DButton", TabFive )
WinGoalTwo:SetPos( 35, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalTwo:SetSize( 25, 25 )
WinGoalTwo:SetText( "20" )
WinGoalTwo.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_2" )
	RunConsoleCommand( "vb_msg_win_goal_2" )
end

WinGoalThree = vgui.Create( "DButton", TabFive )
WinGoalThree:SetPos( 63, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalThree:SetSize( 25, 25 )
WinGoalThree:SetText( "30" )
WinGoalThree.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_3" )
	RunConsoleCommand( "vb_msg_win_goal_3" )
end

WinGoalFour = vgui.Create( "DButton", TabFive )
WinGoalFour:SetPos( 91, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalFour:SetSize( 25, 25 )
WinGoalFour:SetText( "40" )
WinGoalFour.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_4" )
	RunConsoleCommand( "vb_msg_win_goal_4" )
end

WinGoalFive = vgui.Create( "DButton", TabFive )
WinGoalFive:SetPos( 119, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalFive:SetSize( 25, 25 )
WinGoalFive:SetText( "50" )
WinGoalFive.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_5" )
	RunConsoleCommand( "vb_msg_win_goal_5" )
end

WinGoalSix = vgui.Create( "DButton", TabFive )
WinGoalSix:SetPos( 147, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalSix:SetSize( 25, 25 )
WinGoalSix:SetText( "60" )
WinGoalSix.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_6" )
	RunConsoleCommand( "vb_msg_win_goal_6" )
end

WinGoalSeven = vgui.Create( "DButton", TabFive )
WinGoalSeven:SetPos( 175, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalSeven:SetSize( 25, 25 )
WinGoalSeven:SetText( "70" )
WinGoalSeven.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_7" )
	RunConsoleCommand( "vb_msg_win_goal_7" )
end

WinGoalEight = vgui.Create( "DButton", TabFive )
WinGoalEight:SetPos( 203, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalEight:SetSize( 25, 25 )
WinGoalEight:SetText( "80" )
WinGoalEight.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_8" )
	RunConsoleCommand( "vb_msg_win_goal_8" )
end

WinGoalNine = vgui.Create( "DButton", TabFive )
WinGoalNine:SetPos( 231, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalNine:SetSize( 25, 25 )
WinGoalNine:SetText( "90" )
WinGoalNine.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_9" )
	RunConsoleCommand( "vb_msg_win_goal_9" )
end

WinGoalTen = vgui.Create( "DButton", TabFive )
WinGoalTen:SetPos( 259, 220 ) --Place it half way on the tall and 5 units in horizontal
WinGoalTen:SetSize( 25, 25 )
WinGoalTen:SetText( "100" )
WinGoalTen.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_10" )
	RunConsoleCommand( "vb_msg_win_goal_10" )
end

WinGoalZero = vgui.Create( "DButton", TabFive )
WinGoalZero:SetPos( 7, 250 ) --Place it half way on the tall and 5 units in horizontal
WinGoalZero:SetSize( 75, 25 )
WinGoalZero:SetText( "Remove Goal" )
WinGoalZero.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "win_goal_0" )
	RunConsoleCommand( "vb_msg_win_goal_0" )
end

GoalDermaText = vgui.Create( "DTextEntry", TabFive )
GoalDermaText:SetPos( 154,250 )
GoalDermaText:SetTall( 25 )
GoalDermaText:SetWide( 130 )
GoalDermaText:SetEnterAllowed( true )
GoalDermaText.OnEnter = function()
local rgoalnum = GoalDermaText:GetValue()
    RunConsoleCommand( "win_goal_1337", rgoalnum )
	RunConsoleCommand( "vb_msg_win_goal_custom", rgoalnum)
end

local CustomGoalEnt = vgui.Create("DLabel", TabFive) -- We only have to parent it to the DPanelList now, and set it's position.
CustomGoalEnt:SetPos(85,255)
CustomGoalEnt:SetColor( Color( 0, 0, 0, 255 ) )
CustomGoalEnt:SetFont("default")
CustomGoalEnt:SetText("Custom Goal:")
CustomGoalEnt:SizeToContents()

// End of Extra Tab


// Start of Team Tab
local ChooseATeam = vgui.Create("DLabel", TabOne) -- We only have to parent it to the DPanelList now, and set it's position.
ChooseATeam:SetPos(10,5)
ChooseATeam:SetColor( Color( 0, 0, 0, 255 ) )
ChooseATeam:SetFont("default")
ChooseATeam:SetText("Choose a Team:")
ChooseATeam:SizeToContents()

local ChooseAClass = vgui.Create("DLabel", TabOne) -- We only have to parent it to the DPanelList now, and set it's position.
ChooseAClass:SetPos(10,55)
ChooseAClass:SetColor( Color( 0, 0, 0, 255 ) )
ChooseAClass:SetFont("default")
ChooseAClass:SetText("Choose a Class:")
ChooseAClass:SizeToContents()

PlayerTeamList = vgui.Create("DListView", TabOne)
PlayerTeamList:SetPos(0, 290)
PlayerTeamList:SetSize(300, 150)
PlayerTeamList:SetMultiSelect(false)
PlayerTeamList:AddColumn("Player") -- Add column
PlayerTeamList:AddColumn("Team")
PlayerTeamList:AddColumn("Kills")
PlayerTeamList:AddColumn("Deaths")
for k,v in pairs(player.GetAll()) do
    PlayerTeamList:AddLine(v:Nick(),team.GetName(v:Team()),v:Frags(),v:Deaths())
end

local MenuButton = vgui.Create("DButton", TabOne)
MenuButton:SetText( "Team Chooser:" )
MenuButton:SetPos(7, 20)
MenuButton:SetSize( 150, 25 )
MenuButton.DoClick = function ( btn )
    local MenuButtonOptions = DermaMenu() -- Creates the menu

    MenuButtonOptions:AddOption("Blue", function()  
    RunConsoleCommand( "Team_US" )
    RunConsoleCommand( "vb_msg_team_US" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end ) -- Add options to the menu
    MenuButtonOptions:AddOption("Red", function()  
    RunConsoleCommand( "Team_Germany" )
    RunConsoleCommand( "vb_msg_team_Germany" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end )	
    MenuButtonOptions:AddOption("Admin", function()  
    RunConsoleCommand( "Team_Admin" )
    RunConsoleCommand( "vb_msg_team_admin" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end )	
    MenuButtonOptions:Open() -- Open the menu AFTER adding your options
end

local ClassButton = vgui.Create("DButton", TabOne)
ClassButton:SetText( "Class Chooser:" )
ClassButton:SetPos(7, 70)
ClassButton:SetSize( 150, 25 )
ClassButton.DoClick = function ( btn )
    local ClassButtonOptions = DermaMenu() -- Creates the menu

    ClassButtonOptions:AddOption("Class 1", function()  
    RunConsoleCommand( "Class_1" )
    RunConsoleCommand( "vb_msg_class_1" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end ) -- Add options to the menu
    ClassButtonOptions:AddOption("Class 2", function()  
    RunConsoleCommand( "Class_2" )
    RunConsoleCommand( "vb_msg_class_2" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end )	
    ClassButtonOptions:AddOption("Class 3", function()  
    RunConsoleCommand( "Class_3" )
    RunConsoleCommand( "vb_msg_class_3" )
    RunConsoleCommand( "stopsound" )
	MainMenuFrame:Close()
end )	
    ClassButtonOptions:Open() -- Open the menu AFTER adding your options
end
// End of Team Tab


// Start of help tab Tab
local ToDoListOne = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
ToDoListOne:SetPos(7,5)
ToDoListOne:SetColor( Color( 0, 0, 0, 255 ) )
ToDoListOne:SetFont("default")
ToDoListOne:SetText("A list of commands to help players/admins use the gamemode correctly.")
ToDoListOne:SizeToContents()

local list1 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list1:SetPos(7,20)
list1:SetColor( Color( 0, 0, 0, 255 ) )
list1:SetFont("default")
list1:SetText("Spawn Points:")
list1:SizeToContents()

local list2 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list2:SetPos(7,32)
list2:SetColor( Color( 0, 0, 0, 255 ) )
list2:SetFont("default")
list2:SetText("- !setspawn  | DESCRIPTION: Allows you to set a certain spawn point of a team  | USAGE: !setspawn team_name spawn_number(1-10)")
list2:SizeToContents()

local list3 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list3:SetPos(7,44)
list3:SetColor( Color( 0, 0, 0, 255 ) )
list3:SetFont("default")
list3:SetText("- !removespawn  | DESCRIPTION: Removes a certain spawn point from a team  | USAGE: team_name spawn_number(1-10)")
list3:SizeToContents()

local list4 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list4:SetPos(7,56)
list4:SetColor( Color( 0, 0, 0, 255 ) )
list4:SetFont("default")
list4:SetText("- !reloadspawns  | DESCRIPTION: Reloads the spawn points if they are acting weird.")
list4:SizeToContents()

local list5 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list5:SetPos(7,68)
list5:SetColor( Color( 0, 0, 0, 255 ) )
list5:SetFont("default")
list5:SetText("- !showspawnson  | DESCRIPTION: Shows where the spawn points are located at.")
list5:SizeToContents()

local list6 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list6:SetPos(7,80)
list6:SetColor( Color( 0, 0, 0, 255 ) )
list6:SetFont("default")
list6:SetText("- !showspawnsoff  | DESCRIPTION: Doesn't show the where the spawn points are, though they will still work if this is off")
list6:SizeToContents()

local list7 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list7:SetPos(7,95)
list7:SetColor( Color( 0, 0, 0, 255 ) )
list7:SetFont("default")
list7:SetText("Leaderboards:")
list7:SizeToContents()

local list8 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list8:SetPos(7,107)
list8:SetColor( Color( 0, 0, 0, 255 ) )
list8:SetFont("default")
list8:SetText("- !leaderboards  | DESCRIPTION: Opens up the leaderboards for the server you're playing in")
list8:SizeToContents()

local list9 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list9:SetPos(7,119)
list9:SetColor( Color( 0, 0, 0, 255 ) )
list9:SetFont("default")
list9:SetText("- !lbs  | DESCRIPTION: Opens up the leaderboards for the server you're playing in")
list9:SizeToContents()

local list10 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list10:SetPos(7,131)
list10:SetColor( Color( 0, 0, 0, 255 ) )
list10:SetFont("default")
list10:SetText("- !rank  | DESCRIPTION: Shows what rank you are in the server you're playing in")
list10:SizeToContents()

local list11 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list11:SetPos(7,146)
list11:SetColor( Color( 0, 0, 0, 255 ) )
list11:SetFont("default")
list11:SetText("Core Gamemode:")
list11:SizeToContents()

local list12 = vgui.Create("DLabel", TabThree) -- We only have to parent it to the DPanelList now, and set it's position.
list12:SetPos(7,158)
list12:SetColor( Color( 0, 0, 0, 255 ) )
list12:SetFont("default")
list12:SetText("- !teams  | DESCRIPTION: Opens this menu up")
list12:SizeToContents()
// End of help Tab


// Start of Special Thanks Tab
// Start of "Special thanks goes out to"
local SpecialThanks = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
SpecialThanks:SetPos(7,5)
SpecialThanks:SetColor( Color( 0, 0, 0, 255 ) )
SpecialThanks:SetFont("default")
SpecialThanks:SetText("Special Thanks goes out to:")
SpecialThanks:SizeToContents()
// End of "Special thanks goes out to"

// Start of Justin
local JustinButton = vgui.Create( "DButton", TabTwo )
JustinButton:SetPos(6,25)
JustinButton:SetSize( 55, 15 )
JustinButton:SetText( "Mr. Apple" )
JustinButton.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/agent_cole_phelps/")
end
local JustinLabel = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
JustinLabel:SetPos(63,26)
JustinLabel:SetColor( Color( 0, 0, 0, 255 ) )
JustinLabel:SetFont("default")
JustinLabel:SetText(" - Created the gamemode.")
JustinLabel:SizeToContents()
// End of Justin

// Start of Aegis
local Sixnew2Button = vgui.Create( "DButton", TabTwo )
Sixnew2Button:SetPos(6,45)
Sixnew2Button:SetSize( 55, 15 )
Sixnew2Button:SetText( "Aegis" )
Sixnew2Button.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/profiles/76561198027817963/")
end
local Sixnew2Label = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
Sixnew2Label:SetPos(63,46)
Sixnew2Label:SetColor( Color( 0, 0, 0, 255 ) )
Sixnew2Label:SetFont("default")
Sixnew2Label:SetText(" - Co-Creator of this gamemode.")
Sixnew2Label:SizeToContents()
// End of Aegis

// Start of Shoop Da Whoop
local Sixnew2Button = vgui.Create( "DButton", TabTwo )
Sixnew2Button:SetPos(6,65)
Sixnew2Button:SetSize( 55, 15 )
Sixnew2Button:SetText( "Shoopy" )
Sixnew2Button.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/war_spigot/")
end
local Sixnew2Label = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
Sixnew2Label:SetPos(63,66)
Sixnew2Label:SetColor( Color( 0, 0, 0, 255 ) )
Sixnew2Label:SetFont("default")
Sixnew2Label:SetText(" - Assistant Co-Creator of this gamemode.")
Sixnew2Label:SizeToContents()
// End of Shoop Da Whoop

// Start of Sixnew2
local Sixnew2Button = vgui.Create( "DButton", TabTwo )
Sixnew2Button:SetPos(6,85)
Sixnew2Button:SetSize( 55, 15 )
Sixnew2Button:SetText( "Sixnew2" )
Sixnew2Button.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/zackg")
end
local Sixnew2Label = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
Sixnew2Label:SetPos(63,86)
Sixnew2Label:SetColor( Color( 0, 0, 0, 255 ) )
Sixnew2Label:SetFont("default")
Sixnew2Label:SetText(" - Testing the Gamemode.")
Sixnew2Label:SizeToContents()
// End of Sixnew2

// Start of DOA100
local DOA100Button = vgui.Create( "DButton", TabTwo )
DOA100Button:SetPos(6,105)
DOA100Button:SetSize( 55, 15 )
DOA100Button:SetText( "DOA100" )
DOA100Button.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/DOA100/")
end
local DOA100Label = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
DOA100Label:SetPos(63,106)
DOA100Label:SetColor( Color( 0, 0, 0, 255 ) )
DOA100Label:SetFont("default")
DOA100Label:SetText(" - Testing the Gamemode.")
DOA100Label:SizeToContents()
// End of DOA100

// Start of qwant2b
local qwant2bButton = vgui.Create( "DButton", TabTwo )
qwant2bButton:SetPos(6,125)
qwant2bButton:SetSize( 55, 15 )
qwant2bButton:SetText( "qwant2b" )
qwant2bButton.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/qwant2b1yesok/")
end
local qwant2bLabel = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
qwant2bLabel:SetPos(63,126)
qwant2bLabel:SetColor( Color( 0, 0, 0, 255 ) )
qwant2bLabel:SetFont("default")
qwant2bLabel:SetText(" - Testing the Gamemode.")
qwant2bLabel:SizeToContents()
// End of qwant2b

// Start of Skydive
local SkydiveButton = vgui.Create( "DButton", TabTwo )
SkydiveButton:SetPos(6,145)
SkydiveButton:SetSize( 55, 15 )
SkydiveButton:SetText( "Skydive" )
SkydiveButton.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/Sala2223/")
end
local SkydiveLabel = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
SkydiveLabel:SetPos(63,146)
SkydiveLabel:SetColor( Color( 0, 0, 0, 255 ) )
SkydiveLabel:SetFont("default")
SkydiveLabel:SetText(" - Helping me out with Derma.")
SkydiveLabel:SizeToContents()
// End of Skydive

// Start of Lead4u
local Lead4uButton = vgui.Create( "DButton", TabTwo )
Lead4uButton:SetPos(6,165)
Lead4uButton:SetSize( 55, 15 )
Lead4uButton:SetText( "Lead4u" )
Lead4uButton.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/lead4u2/")
end
local Lead4uLabel = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
Lead4uLabel:SetPos(63,166)
Lead4uLabel:SetColor( Color( 0, 0, 0, 255 ) )
Lead4uLabel:SetFont("default")
Lead4uLabel:SetText(" - Inspired me to learn lua.")
Lead4uLabel:SizeToContents()
// End of Lead4u

// Start of ulx megidoo
local NateButton = vgui.Create( "DButton", TabTwo )
NateButton:SetPos(6,185)
NateButton:SetSize( 55, 15 )
NateButton:SetText( "Nate" )
NateButton.DoClick = function() 
	gui.OpenURL("http://steamcommunity.com/id/ief015")
end
local NateLabel = vgui.Create("DLabel", TabTwo) -- We only have to parent it to the DPanelList now, and set it's position.
NateLabel:SetPos(63,186)
NateLabel:SetColor( Color( 0, 0, 0, 255 ) )
NateLabel:SetFont("default")
NateLabel:SetText(" - Allowing me to use his creation, Hit Markers.")
NateLabel:SizeToContents()
// End of ulx megidoo
// End of Special Thank Tab




// Start of Information
local InfoLabelOne = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelOne:SetPos(7,5)
InfoLabelOne:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelOne:SetFont("default")
InfoLabelOne:SetText("License:")
InfoLabelOne:SizeToContents()
local InfoLabelOne = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelOne:SetPos(7,25)
InfoLabelOne:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelOne:SetFont("default")
InfoLabelOne:SetText("This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.")
InfoLabelOne:SizeToContents()
local InfoLabelTwo = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelTwo:SetPos(7,35)
InfoLabelTwo:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelTwo:SetFont("default")
InfoLabelTwo:SetText("To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to:")
InfoLabelTwo:SizeToContents()
local InfoLabelThree = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelThree:SetPos(7,45)
InfoLabelThree:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelThree:SetFont("default")
InfoLabelThree:SetText("Creative Commons")
InfoLabelThree:SizeToContents()
local InfoLabelFour = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelFour:SetPos(7,55)
InfoLabelFour:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelFour:SetFont("default")
InfoLabelFour:SetText("543 Howard Street")
InfoLabelFour:SizeToContents()
local InfoLabelFive = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelFive:SetPos(7,65)
InfoLabelFive:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelFive:SetFont("default")
InfoLabelFive:SetText("5th Floor")
InfoLabelFive:SizeToContents()
local InfoLabelSix = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelSix:SetPos(7,75)
InfoLabelSix:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelSix:SetFont("default")
InfoLabelSix:SetText("San Francisco, California 94105")
InfoLabelSix:SizeToContents()
local InfoLabelSeven = vgui.Create("DLabel", TabFour) -- We only have to parent it to the DPanelList now, and set it's position.
InfoLabelSeven:SetPos(8,85)
InfoLabelSeven:SetColor( Color( 0, 0, 0, 255 ) )
InfoLabelSeven:SetFont("default")
InfoLabelSeven:SetText("USA")
InfoLabelSeven:SizeToContents()
// End of Information


// Start of TabListName
MainMenuSheet:AddSheet( "Team", TabOne, "icon16/group.png", false, false, "Select a team to be on." )
MainMenuSheet:AddSheet( "Extra", TabFive, "icon16/brick.png", false, false, "Some extra's that you can toggle, ect.." )
MainMenuSheet:AddSheet( "Commands", TabThree, "icon16/page_edit.png", false, false, "Help sheet" )
MainMenuSheet:AddSheet( "Information", TabFour, "icon16/information.png", false, false, "Information" )
MainMenuSheet:AddSheet( "Special Thanks", TabTwo, "icon16/star.png", false, false, "To all the people that helped me." )
// End of TabListName

end
concommand.Add( "vbtdm_menu_info", set_team3 )
concommand.Add( "vbtdm_menu", set_team2 )
usermessage.Hook( "MyMenu", set_team2 )