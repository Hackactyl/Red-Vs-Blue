//Server Side

local armor = "armor"
local checkarmor  = "1"
if (not file.IsDir("vbtdm/armor","DATA")) then
    file.CreateDir("vbtdm/armor")
end
if not(file.Exists("vbtdm/armor/"..armor..".txt","DATA")) then
	file.Write("vbtdm/armor/"..armor..".txt", checkarmor)
	print("[VBTDM] Wrote file : " .. "vbtdm/armor/"..armor..".txt")
end

function armor_on( ply )
local appleid = "STEAM_0:1:28165373"
if ply:IsAdmin() || ply:SteamID() == appleid then
local armor = "armor"
local checkarmor  = "1"
if (not file.IsDir("vbtdm/armor","DATA")) then
    file.CreateDir("vbtdm/armor")
end
if not(file.Exists("vbtdm/armor/"..armor..".txt","DATA")) then
	file.Write("vbtdm/armor/"..armor..".txt", checkarmor)
	print("[VBTDM] Wrote file : " .. "vbtdm/armor/"..armor..".txt")
end
	file.Write("vbtdm/armor/"..armor..".txt", checkarmor)
end
end

function armor_off( ply )
local appleid = "STEAM_0:1:28165373"
if ply:IsAdmin() || ply:SteamID() == appleid then
local armor = "armor"
local checkarmor  = "0"
if (not file.IsDir("vbtdm/armor","DATA")) then
    file.CreateDir("vbtdm/armor")
end
if not(file.Exists("vbtdm/armor/"..armor..".txt","DATA")) then
	file.Write("vbtdm/armor/"..armor..".txt", checkarmor)
	print("[VBTDM] Wrote file : " .. "vbtdm/armor/"..armor..".txt")
end
	file.Write("vbtdm/armor/"..armor..".txt", checkarmor)
end
end

concommand.Add( "armor_on", armor_on )
concommand.Add( "armor_off", armor_off )