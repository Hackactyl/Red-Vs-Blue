
germany_team = 0
us_team = 0

function player_initial()
umsg.Start("newplayer")
	umsg.Short(germany_team)
	umsg.Short(us_team)
umsg.End()
end
hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", player_initial )

function teamscore()
	for k, ply in pairs( player.GetAll() ) do
		if (ply.first == nil) then
		ply.first = 1
		ply.lastkill = 0
		end
				if (ply:Team() == 2) then //US
					if ( ply:Frags() != ply.lastkill ) then
					ply.poskill = ply:Frags() + 1
					ply.negkill = ply:Frags() - 1
						if ( ply:Frags() == 0 and ply.lastkill == -1 ) then
						ply.lastkill = ply:Frags()
						us_team = us_team + 1
						umsg.Start("teamscoring")
							umsg.Short(us_team)
							umsg.Short(2)
						umsg.End()
						elseif ( ply.negkill == ply.lastkill) then
						ply.lastkill = ply:Frags()
						us_team = us_team + 1
						umsg.Start("teamscoring")
							umsg.Short(us_team)
							umsg.Short(2)
						umsg.End()
						end
					end
				end
				if (ply:Team() == 3) then //GERMAN
					if ( ply:Frags() != ply.lastkill ) then
					ply.poskill = ply:Frags() + 1
					ply.negkill = ply:Frags() - 1
						if ( ply:Frags() == 0 and ply.lastkill == -1 ) then
						ply.lastkill = ply:Frags()
						germany_team = germany_team + 1
						umsg.Start("teamscoring")
							umsg.Short(germany_team)
							umsg.Short(3)
						umsg.End()
						elseif ( ply.negkill == ply.lastkill) then
						ply.lastkill = ply:Frags()
						germany_team = germany_team + 1
						umsg.Start("teamscoring")
							umsg.Short(germany_team)
							umsg.Short(3)
						umsg.End()
						end
					end
				end
			end
		end
hook.Add("Think","checkteamscore", teamscore)

function largest()
numbers = {us_team, germany_team}
local maxcount = 0
local maxindex
	for index, value in pairs(numbers) do
		if value > maxcount then
		maxcount = value
		maxindex = index
		umsg.Start("topteamscore")
			umsg.Short(maxindex)
		umsg.End()
		end
	end
end
hook.Add("Think","Largestnumber", largest)




// Reset scores
function reset_scores( ply )
if ply:IsAdmin() then
for k, ply in pairs( player.GetAll() ) do
ply:SetFrags(0)
ply:SetDeaths(0)
end
us_team = 0
germany = 0
player_initial()
umsg.Start("topteamscorereset")
umsg.End()
end
end
concommand.Add( "vb_reset_team_scores", reset_scores )

