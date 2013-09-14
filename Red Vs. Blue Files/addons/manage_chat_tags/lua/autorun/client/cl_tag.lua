// Client Side apple ROODAY

local Tags = 
{
--Group    --Tag     --Color
{"jude", "I WELCOME YOU", Color(27, 155, 224, 255) },
{"friend", "ROODAY's Friend", Color(25, 25, 255, 255) },
{"punished", "DUNCE", Color(0, 255, 0, 255) },
{"yolo", "420 BLAZIN!!!", Color(252, 179, 20, 255) },
{"vadmin", "ROODMIN+", Color(174, 93, 179, 255) },
{"vhidden", "VIP*", Color(133, 100, 135, 255) },
{"vip+", "VIP+", Color(174, 93, 179, 255) },
{"vip", "VIP", Color(133, 100, 135, 255) },
{"temphost", "SUBSTITOODAY", Color(255, 0, 0, 255) },
{"hello", "WORLD", Color(2, 82, 4, 255) },
{"sir", "SUPREME OVERLORD", Color(255, 0, 0, 255) },
{"rumbler", "KING OF FUNTIMES", Color(255, 119, 0, 255) },
{"koch", "MR. DISCIPLINE", Color(194, 0, 194, 255) },
{"noct", "THE NOCTOWL", Color(255, 46, 154, 255) },
{"hidden", "USER*", Color(0, 255, 0, 255) },
{"snarf", "SNARF SNARF", Color(194, 0, 194, 255) },
{"rock", "ROCKY", Color(0, 255, 213, 255) },
{"user", "USER", Color(0, 255, 0, 255) },
{"admin", "ROODMIN", Color(255, 238, 0, 255) },
{"superadmin", "OWNER", Color(255, 0, 0, 255) },
{"owner", "OWNER", Color(0, 255, 0, 255) }
}

hook.Add("OnPlayerChat", "Tags", function(ply, Text, Team, PlayerIsDead)
	for k,v in pairs(Tags) do
		if ply:IsUserGroup(v[1]) then
			if Team then
					if ply:Alive() then
						chat.AddText(Color(0, 204, 0, 255), "{TEAM} ", v[3], v[2], Color(50, 50, 50, 255), "| ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
					else
						chat.AddText(Color(255, 0, 0, 255), "*DEAD*", Color(0, 204, 0, 255), "{TEAM} ", v[3], v[2], Color(50, 50, 50, 255), "| ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
					end
					return true
			end
			if ply:IsPlayer() then
				if ply:Alive() then
					chat.AddText(Color(255, 0, 0, 255), "", v[3], v[2], Color(50, 50, 50, 255), "| ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
					return true
				elseif !ply:Alive() then
					chat.AddText(Color(255, 0, 0, 255), "*DEAD* ", v[3], v[2], Color(50, 50, 50, 255), "| ", v[3], ply:Nick(), color_white, ": ", Color(255, 255, 255, 255), Text)
					return true
				end
			end
		end
	end
end)