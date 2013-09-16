/*
Toggle settings
Set to true or false
*/

function ServerVoiceAPI()
	Msg("[VBTDM] Enabling all configs!\n")
	game.ConsoleCommand("sv_voiceenable 1\n")
	game.ConsoleCommand("sv_alltalk 3\n")
	game.ConsoleCommand("net_maxfilesize 25\n")
	game.ConsoleCommand("freeze_teams 0\n")
// Do not edit the following lines below
local rd = "ReadMe"
local rdtxt = "Do not touch any of these files/folders, unless you know what you're doing"
	file.Write("vbtdm/"..rd..".txt", rdtxt)
// Do not edit the following lines above
end
timer.Create( "ServerVoice", 1, 1, ServerVoiceAPI )