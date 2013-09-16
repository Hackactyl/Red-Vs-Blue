if CLIENT then return end

// Do not touch. Class Tables
WeaponTable_ClassOne={}
WeaponTable_ClassTwo={}
WeaponTable_ClassThree={}
WeaponAmmoTable_ClassOne={}
WeaponAmmoTable_ClassTwo={}
WeaponAmmoTable_ClassThree={}


// Class One
WeaponTable_ClassOne[1] = ("weapon_pistol")
WeaponTable_ClassOne[2] = ("weapon_shotgun")
WeaponAmmoTable_ClassOne[1] = {"Pistol",36}
WeaponAmmoTable_ClassOne[2] = {"Buckshot",24}

// Class Two
WeaponTable_ClassTwo[1] = ("weapon_357")
WeaponTable_ClassTwo[2] = ("weapon_stunstick")
WeaponAmmoTable_ClassTwo[1] = {"357",8}

// Class Three
WeaponTable_ClassThree[1] = ("weapon_pistol")
WeaponTable_ClassThree[2] = ("weapon_smg1")
WeaponAmmoTable_ClassThree[1] = {"Pistol",36}
WeaponAmmoTable_ClassThree[2] = {"SMG1",90}


// DO NOT EDIT ANYTHING BELOW, UNLESS YOU KNOW WHAT YOU ARE DOING.

--Set up folders and file
if (not file.IsDir("vbtdm","DATA")) then
    file.CreateDir("vbtdm")
end
if (not file.IsDir("vbtdm/classes","DATA")) then
    file.CreateDir("vbtdm/classes")
end
if (not(file.Exists("vbtdm/classes/users.txt","DATA"))) then
	file.Write("vbtdm/classes/users.txt","")
	print("[VBTDM] Wrote file : " .. "vbtdm/classes/users.txt")
end

--Add a player to the file is they don't exist yet
function AddClassPlayer(ply)
	if ply:IsBot() then return end
	local data = file.Read("vbtdm/classes/users.txt","DATA")
	local id = ply:UniqueID()
	local name = ply:Name()
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	if string.find(data,id) ~=  nil then return end
	file.Append("vbtdm/classes/users.txt",id .. ",0," .. name .. "\n")
end
hook.Add("PlayerInitialSpawn","AddClassPlayer",AddClassPlayer)

function Class_1(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/classes/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddClassPlayer(ply) end
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
	info[2] = 1
	local name = ply:Name()   --update their name in case they've changed it
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	local lineNew = info[1] .. "," .. info[2] .. "," .. name
	data = string.Replace(data, lineOld, lineNew)
	file.Write("vbtdm/classes/users.txt",data)
end

function Class_2(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/classes/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddClassPlayer(ply) end
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
	info[2] = 2
	local name = ply:Name()   --update their name in case they've changed it
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	local lineNew = info[1] .. "," .. info[2] .. "," .. name
	data = string.Replace(data, lineOld, lineNew)
	file.Write("vbtdm/classes/users.txt",data)
end

function Class_3(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/classes/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddClassPlayer(ply) end
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
	info[2] = 3
	local name = ply:Name()   --update their name in case they've changed it
	name = string.Replace(name,","," ") -- replace any commas in their name with spaces so they don't mess up the data reading
	local lineNew = info[1] .. "," .. info[2] .. "," .. name
	data = string.Replace(data, lineOld, lineNew)
	file.Write("vbtdm/classes/users.txt",data)
end

function PlayerSpawnClasses(ply)
	if ply:IsBot() or ply:IsNPC() then return end
	local data = file.Read("vbtdm/classes/users.txt","DATA")
	local id = ply:UniqueID()
	if string.find(data,id) == nil then 
	AddClassPlayer(ply) end
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
	local playergetclasses = tonumber(info[2])
	
		// weapons
		if playergetclasses == 0 then
		if ply:IsValid() then
		if ply:Team() != 9 then
				ply:StripAmmo()
				ply:StripWeapons()
		umsg.Start( "vb_no_class", ply)
		umsg.End()
		end
		end
		end
		
		if playergetclasses == 1 then
		if ply:IsValid() then
		if ply:Team() != 9 then
				ply:StripAmmo()
				ply:StripWeapons()
			for k,v in pairs(WeaponTable_ClassOne) do
			local Weapon = tostring(v)
				ply:Give( Weapon )
			end
		end
		end
		end
		if playergetclasses == 2 then
		if ply:IsValid() then
		if ply:Team() != 9 then
				ply:StripAmmo()
				ply:StripWeapons()
			for k,v in pairs(WeaponTable_ClassTwo) do
			local Weapon = tostring(v)
				ply:Give( Weapon )
			end
		end
		end
		end
		if playergetclasses == 3 then
		if ply:IsValid() then
		if ply:Team() != 9 then
				ply:StripAmmo()
				ply:StripWeapons()
			for k,v in pairs(WeaponTable_ClassThree) do
			local Weapon = tostring(v)
				ply:Give( Weapon )
			end
		end
		end
		end

		// Ammo
		if playergetclasses == 1 then
		if ply:IsValid() then
		if ply:Team() != 9 then
			for r,s in pairs(WeaponAmmoTable_ClassOne) do
			local Weaponammo = tostring(s[1])
			local Weaponammonum = tonumber(s[2])	
				ply:GiveAmmo( Weaponammonum, Weaponammo )
			end
		end
		end
		end
		if playergetclasses == 2 then
		if ply:IsValid() then
		if ply:Team() != 9 then
			for r,s in pairs(WeaponAmmoTable_ClassTwo) do
			local Weaponammo = tostring(s[1])
			local Weaponammonum = tonumber(s[2])
				ply:GiveAmmo( Weaponammonum, Weaponammo )
			end
		end
		end
		end
		if playergetclasses == 3 then
		if ply:IsValid() then
		if ply:Team() != 9 then
			for r,s in pairs(WeaponAmmoTable_ClassThree) do
			local Weaponammo = tostring(s[1])
			local Weaponammonum = tonumber(s[2])
				ply:GiveAmmo( Weaponammonum, Weaponammo )
			end
		end
		end
		end
end
hook.Add("PlayerSpawn","PlayerSpawnClass",PlayerSpawnClasses)


concommand.Add( "Class_1", Class_1 )
concommand.Add( "Class_2", Class_2 )
concommand.Add( "Class_3", Class_3 )