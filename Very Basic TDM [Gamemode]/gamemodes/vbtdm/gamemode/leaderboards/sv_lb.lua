AddCSLuaFile('cl_lb.lua')
if CLIENT then return end
--Set up folders and file
if (not file.IsDir("vbtdm","DATA")) then
    file.CreateDir("vbtdm")
end
if (not file.IsDir("vbtdm/leaderboards","DATA")) then
    file.CreateDir("vbtdm/leaderboards")
end
if (not(file.Exists("vbtdm/leaderboards/users.txt","DATA"))) then
	file.Write("vbtdm/leaderboards/users.txt","")
end
--Add a player to the file is they don't exist yet
function AddPlayer(ply)
	if ply:IsBot() then return end
	local data = file.Read("vbtdm/leaderboards/users.txt","DATA")
	local id = ply:UniqueID()
	local name = ply:Name()
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	if string.find(data,id) ~=  nil then return end
	file.Append("vbtdm/leaderboards/users.txt",id .. ",0,0," .. name .. "\n")
end
hook.Add("PlayerInitialSpawn","AddPlayerLB",AddPlayer)

--Add one death to the player's data
function AddDeath(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/leaderboards/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddPlayer(ply) end
	local lineStart = string.find(data,id)
	local lineEnd = string.find(data,"\n",lineStart)
	local lineOld = ""
	if lineEnd ~= nil then
		lineOld = string.sub(data,lineStart,lineEnd - 1)
	else
		--this is the last line, it doesn't have a newline character yet
		lineOld = string.sub(data,lineStart,string.len(data) - 1)
	end
	local info = string.Explode(",",lineOld)
	info[3] = tonumber(info[3]) + 1
	local name = ply:Name()   --update their name in case they've changed it
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	local lineNew = info[1] .. "," .. info[2] .. "," .. info[3] .. "," .. name
	data = string.Replace(data, lineOld, lineNew)
	file.Write("vbtdm/leaderboards/users.txt",data)
end

--Add one kill to the player's data
function AddKill(ply,tk)
	if ply:IsBot() or ply:IsNPC() then return end
	local Add
	if tk then 
		Add = -1
	else
		Add = 1
	end
	local data = file.Read("vbtdm/leaderboards/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddPlayer(ply) end
	local lineStart = string.find(data,id)
	local lineEnd = string.find(data,"\n",lineStart)
	local lineOld = ""
	if lineEnd ~= nil then
		lineOld = string.sub(data,lineStart,lineEnd - 1)
	else
		--this is the last line, it doesn't have a newline character yet
		lineOld = string.sub(data,lineStart,string.len(data) - 1)
	end
	local info = string.Explode(",",lineOld)
	info[2] = tonumber(info[2]) + Add
	local name = ply:Name() --update their name in case they've changed it
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	local lineNew = info[1] .. "," .. info[2] .. "," .. info[3] .. "," .. name
	data = string.Replace(data, lineOld, lineNew)
	file.Write("vbtdm/leaderboards/users.txt",data)
end

--when someone dies, add appropriate kill/death
function UpdateLeaderBoard(died,weapon,killer)
	if not(IsValid(died) and IsValid(killer)) then return end
	if died == killer then --they committed suicide, don't give them a kill
		AddDeath(died)
	else
		if died:Team() == killer:Team() then
			if(killer:IsPlayer()) then
				AddKill(killer,true) --they tk'd, take away a kill
			end
		else
			AddKill(killer,false)
			AddDeath(died)
		end
	end
end
hook.Add("PlayerDeath","UpdateLB",UpdateLeaderBoard)
function ShowLB(ply)
	local data = file.Read("vbtdm/leaderboards/users.txt","DATA")
	local lines = string.Explode("\n",data)
	if not(#lines > 0) then return end
	umsg.Start("LeaderboardsLB",ply)
	umsg.End()
	for i, line in ipairs(lines) do
		if line == "" then
		break
		end
		local info = string.Explode(",",line)
		local plyName = info[4]
		local kills = info[2]
		local deaths = info[3]
		local kd = 0
		if not(deaths == 0) then
			kd = kills / deaths
		end
		umsg.Start("LBData",ply)
		umsg.String(plyName)
		umsg.Short(kills)
		umsg.Short(deaths)
		umsg.Float(kd)
		umsg.End()
	end
end
function ShowRankLB(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/leaderboards/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddPlayer(ply) end
	local lineStart = string.find(data,id)
	local lineEnd = string.find(data,"\n",lineStart)
	local Line = ""
	if lineEnd ~= nil then
		Line = string.sub(data,lineStart,lineEnd - 1)
	else
		--this is the last line, it doesn't have a newline character yet
		Line = string.sub(data,lineStart,string.len(data) - 1)
	end
	local info = string.Explode(",",Line)
	local plyKills = tonumber(info[2])
	local rank = 1
	local players = 0
	local lines = string.Explode("\n",data)
	for i, line in ipairs(lines) do 
		if line == "" then break end
		local lineInfo = string.Explode(",",line)
		local kills = tonumber(lineInfo[2])
		players = players + 1
		if plyKills < kills then -- if they have less kills that someone, their rank is lower ( higher number)
			rank = rank + 1
		end
	end
	umsg.Start("RankLB",ply)
		umsg.Short(rank)
		umsg.Short(players)
	umsg.End()
end
function CheckSaidLB(ply,said)
	local words = string.Explode(" ", said)
	if words[1] == "!lbs" or words[1] == "!leaderboards" then
		ShowLB(ply)
	end
	if words[1] == "!rank" then
		ShowRankLB(ply)
	end
end
hook.Add("PlayerSay","CheckSaidLB",CheckSaidLB)