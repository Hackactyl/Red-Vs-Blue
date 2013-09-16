--[[
For this spawn system to work, these lines need to be placed in the gamemode's init.lua:

function GM:PlayerSelectSpawn( ply )
	local Team = ply:Team()
	points = ents.FindByClass("team" .. Team)
	if #points == 0 then
	points = ents.FindByClass("info_player_start")
	end
	
	return points[math.random(#points)]
end

--]]


if not(SERVER) then return end
local map = string.Replace(game.GetMap(),"_","") 	//replace any underscores or
local map = string.Replace(map,".","")	//periods, they don't work for file names
if (not file.IsDir("vbtdm/teamspawns","DATA")) then
    file.CreateDir("vbtdm/teamspawns")
end
if not(file.Exists("vbtdm/teamspawns/"..map..".txt","DATA")) then
	file.Write("vbtdm/teamspawns/"..map..".txt","")
	print("[VBTDM] Wrote file : " .. "vbtdm/teamspawns/"..map..".txt")
end
function CheckSetSpawn(ply,text,public)
	
	text = string.lower(text)
	local exp = string.Explode(" ", text)  //split it into 3 words
	
	//set a spawn
	if exp[1] == "!setspawn" then
		if not(ply:IsAdmin()) then
		umsg.Start("Error",ply)
		umsg.String("This feature is for SuperAdmins only")
		umsg.End()
		return end 
		if #exp ~= 3 then //Incorrect number or arguments for the command
			umsg.Start("Error",ply)
			umsg.String("Format command as !setspawn team_name spawn_number")
			umsg.End()
			return 
		end
		local Team = CheckTeam(exp[2])
		if not(Team) then //If CheckTeam return false -- there wasn't a team
			umsg.Start("Error",ply)
			umsg.String("That team name doesn't exist. Format command as !setspawn team_name spawn_number") 
			umsg.End()
			return
		end
		spawnnum = tonumber(exp[3])
		//If the number isn't an int between 1 and 9 
		if not(spawnnum) or spawnnum < 1 or spawnnum > 9 or spawnnum ~= math.floor(spawnnum) then
			umsg.Start("Error",ply)
			umsg.String("That's not a valid spawn number(should be 1-9). Format command as !setspawn team_name spawn_number")
			umsg.End()
			return
		end
		if (spawnnum) or spawnnum < 1 or spawnnum > 9 or spawnnum ~= math.floor(spawnnum) or (Team) or #exp ~= 3 then
		umsg.Start("Success",ply)
		umsg.String("Successfully set spawn point "..exp[3].. " for team "..exp[2])
		umsg.End()
		end
		if not(CheckCanSet(ply,Team,spawnnum)) then return end
		WriteSpawn(ply,Team,spawnnum)
	end
	
	//remove a spawn
	if exp[1] == "!removespawn" then
		if not(ply:IsAdmin()) then
		umsg.Start("Error",ply)
		umsg.String("This feature is for SuperAdmins only")
		umsg.End()
		return end 
		if #exp ~= 3 then //Incorrect number or arguments for the command
			umsg.Start("Error",ply)
			umsg.String("Format command as !removespawn team_name spawn_number")
			umsg.End()
			return 
		end
		local Team = CheckTeam(exp[2])
		if not(Team) then //If CheckTeam return false -- there wasn't a team
			umsg.Start("Error",ply)
			umsg.String("That team name doesn't exist. Format command as !removespawn team_name spawn_number") 
			umsg.End()
			return
		end
		spawnnum = tonumber(exp[3])
		//If the number isn't an int between 1 and 9 
		if not(spawnnum) or spawnnum < 1 or spawnnum > 9 or spawnnum ~= math.floor(spawnnum) then
			umsg.Start("Error",ply)
			umsg.String("That's not a valid spawn number(should be 1-9). Format command as !removespawn team_name spawn_number")
			umsg.End() 
			return
		end
		if (spawnnum) or spawnnum < 1 or spawnnum > 9 or spawnnum ~= math.floor(spawnnum) or (Team) or #exp ~= 3 then
		umsg.Start("Success",ply)
		umsg.String("Successfully removed spawn point "..exp[3].. " for team "..exp[2])
		umsg.End()
		end
		RemoveSpawn(Team,spawnnum)
	end
	
	//Reload spawns
	if exp[1] == "!reloadspawns" then
		if not(ply:IsAdmin()) then
		umsg.Start("Error",ply)
		umsg.String("This feature is for SuperAdmins only")
		umsg.End()
		else
		umsg.Start("Success",ply)
		umsg.String("Successfully reloaded spawns")
		umsg.End()
		MakeSpawns()
		return end 
	end
	
		local checkspawnmodels  = "1"
		if (not file.IsDir("vbtdm/teamspawns","DATA")) then
			file.CreateDir("vbtdm/teamspawns")
		end
		if not(file.Exists("vbtdm/teamspawns/showmodel.txt","DATA")) then
			file.Write("vbtdm/teamspawns/showmodel.txt", checkspawnmodels)
		print("[VBTDM] Wrote file: vbtdm/teamspawns/showmodel.txt")
		end
	
	//Turn Show Models On
	if exp[1] == "!showspawnson" then
		if not(ply:IsAdmin()) then
		umsg.Start("Error",ply)
		umsg.String("This feature is for SuperAdmins only")
		umsg.End()
		else
		umsg.Start("Success",ply)
		umsg.String("Spawn points are now visable")
		umsg.End()
		print("[VBTDM] Turning on spawn point models")
		local checkspawnmodels  = "1"
		if (not file.IsDir("vbtdm/teamspawns","DATA")) then
			file.CreateDir("vbtdm/teamspawns")
		end
		if not(file.Exists("vbtdm/teamspawns/showmodel.txt","DATA")) then
			file.Write("vbtdm/teamspawns/showmodel.txt", checkspawnmodels)
		print("[VBTDM] Wrote file: vbtdm/teamspawns/showmodel.txt")
		end
			file.Write("vbtdm/teamspawns/showmodel.txt", checkspawnmodels)
		MakeSpawns()
		return end
	end

	//Turn Show Models Off
	if exp[1] == "!showspawnsoff" then
		if not(ply:IsAdmin()) then
		umsg.Start("Error",ply)
		umsg.String("This feature is for SuperAdmins only")
		umsg.End()
		else
		umsg.Start("Success",ply)
		umsg.String("Spawn points are no longer visable")
		umsg.End()
		print("[VBTDM] Turning off spawn point models")
		local checkspawnmodels  = "0"
		if (not file.IsDir("vbtdm/teamspawns","DATA")) then
			file.CreateDir("vbtdm/teamspawns")
		end
		if not(file.Exists("vbtdm/teamspawns/showmodel.txt","DATA")) then
			file.Write("vbtdm/teamspawns/showmodel.txt", checkspawnmodels)
		print("[VBTDM] Wrote file: vbtdm/teamspawns/showmodel.txt")
		end
			file.Write("vbtdm/teamspawns/showmodel.txt", checkspawnmodels)
		MakeSpawns()
		return end 
		end
end

hook.Add("PlayerSay","CheckSetSpawn",CheckSetSpawn)

function CheckTeam(name)
	local teams = team.GetAllTeams()
	for k,v in pairs(teams) do
		if string.lower(team.GetName(k)) == name then
			return k
		end
	end
	return false
end

function CheckCanSet(ply,Team,spawnnum)
	return true
end

function RemoveSpawn(Team,spawnnum)
	local map = string.Replace(game.GetMap(),"_","")
	local map = string.Replace(map,".","")
	local spawns = file.Read("vbtdm/teamspawns/"..map..".txt","DATA")
	local lines = string.Explode("\n", spawns)
	for i, line in ipairs(lines) do
		local data = string.Explode(";", line)
 		local FileTeam = tonumber(data[1])
		local PointNum = tonumber(data[2])
		if FileTeam == Team and PointNum == spawnnum then
		spawns = string.Replace(spawns,line.."\n","")
		end
	end
	file.Write("vbtdm/teamspawns/" .. map .. ".txt",spawns)
	MakeSpawns()
end
function WriteSpawn(ply,Team,spawnnum)
	RemoveSpawn(Team,spawnnum)
    local vAngle = ply:GetAimVector()
    local UpAngle = tostring(vAngle:Angle())
	local pos = ply:GetPos()
//	local pyr = tostring(ply:GetAngles())
	local data = string.Explode(" ", UpAngle)
	map = string.Replace(game.GetMap(),"_","")
	map = string.Replace(map,".","")
	file.Append("vbtdm/teamspawns/"..map..".txt",Team ..";".. spawnnum .. ";" .. pos.x .. "," .. pos.y .. "," .. pos.z .. "," .. data[1] .."," .. data[2] .. "," .. data[3] .. "\n")
	MakeSpawns()
	end

function MakeSpawns()
	//if not SpawnEnts then SpawnEnts = {} end
	local Teams = nil
	Teams = table.Copy(team.GetAllTeams()) 
	local map = string.Replace(game.GetMap(),"_","")
	local map = string.Replace(map,".","")
	local spawns = file.Read("vbtdm/teamspawns/"..map..".txt","DATA")
	
 
	lines = string.Explode("\n", spawns)
	// Now let's loop through all the lines so we can split those too
	for i, line in ipairs(lines) do	
		local data = string.Explode(";", line)
		if #data ~= 3 then break end
		local Team = tonumber(data[1])
		local SpawnNum = tonumber(data[2])
		local PosString =  string.Explode(",",data[3])
		local Pos = {}
		Pos[1] = PosString[1]
		Pos[2] = PosString[2]
		Pos[3] = PosString[3]
		Pos[4] = PosString[4]
		Pos[5] = PosString[5]
		Pos[6] = PosString[6]
//		local Pos = (tonumber(PosString[1]),tonumber(PosString[2]),tonumber(PosString[3]),tonumber(PosString[4]),tonumber(PosString[5]),tonumber(PosString[6]))
//		local PosAngle =  Vector(tonumber(PosString[4]),tonumber(PosString[5]),tonumber(PosString[6]))
		if not(Teams[Team].Spawns) then
		Teams[Team].Spawns = {}
		end
		Teams[Team].Spawns[SpawnNum] = Pos // Add the pos to that team's spawns
		
	end 
	//remove old spawn points, easier than keeping a table of all of them/checking to see if they're already made
	local oldpoints = ents.FindByClass("team*")
	for _,v in pairs(oldpoints) do v:Remove() end
	
	//spawn the entities for the spawns
	
	for k,v in pairs(Teams) do  //k = team index, v= team
		if v.Spawns && #v.Spawns > 0 then
			for i,j in pairs(v.Spawns) do // i = spawn index, j = pos
				local ent = ents.Create("team"..k)
					MsgN("[VBTDM] Creating spawn point for team: "..team.GetName(k))
					MsgN("[VBTDM] X: ".. j[1])
					MsgN("[VBTDM] Y: ".. j[2])
					MsgN("[VBTDM] Z: ".. j[3])
					MsgN("[VBTDM] Pitch: ".. j[4])
					MsgN("[VBTDM] Yaw: ".. j[5])
					MsgN("[VBTDM] Roll: ".. j[6])
					ent:SetPos(Vector(j[1],j[2],j[3]))
					ent:SetAngles(Angle(tonumber(j[4]),tonumber(j[5]),tonumber(j[6])))
				local checkmodels = tonumber(file.Read("vbtdm/teamspawns/showmodel.txt","DATA"))
				if checkmodels == 1 then
					ent:SetModel("models/props_trainstation/TrackSign03.mdl")
					ent:SetColor(team.GetColor(k))
					ent:Spawn()
				end
				//local EntIndex = table.insert(SpawnEnts,ent)
				//SpawnEnts[EntIndex].Team = k
				//SpawnEnts[EntIndex].SpawnNum = i
			end
			//team.SetSpawnPoint(k,"team"..k)
		end
	end
end


function MapChange()
MakeSpawns() 
end 
hook.Add("PlayerConnect","MakeSpawns", MapChange)

timer.Create( "Spawn_Creator", 1, 1, function()
		MakeSpawns()
end)