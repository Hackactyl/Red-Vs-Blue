// Friendly Fire testng script

local ff = "friendlyfire"
local checkff  = "1"
if (not file.IsDir("vbtdm/ff","DATA")) then
    file.CreateDir("vbtdm/ff")
end
if not(file.Exists("vbtdm/ff/"..ff..".txt","DATA")) then
	file.Write("vbtdm/ff/"..ff..".txt", checkff)
	print("[VBTDM] Wrote file : " .. "vbtdm/ff/"..ff..".txt")
end

function FriendlyFireFunc( victim, ply )
local ff = "friendlyfire"
local friendlyfire = tonumber(file.Read("vbtdm/ff/"..ff..".txt","DATA"))
	if ply:IsPlayer() && victim:IsPlayer() then
	if ply == victim then
	return true
	end
		if ply:Team() == victim:Team() and friendlyfire == 0 then
			return false
		end
	end
	return true
end

hook.Add("PlayerShouldTakeDamage", "FriendlyFireTakeDamage", FriendlyFireFunc)

function ff_enable( ply )
if ply:IsAdmin()then
local ff = "friendlyfire"
local checkff  = "1"
if (not file.IsDir("vbtdm/ff","DATA")) then
    file.CreateDir("vbtdm/ff")
end
if not(file.Exists("vbtdm/ff/"..ff..".txt","DATA")) then
	file.Write("vbtdm/ff/"..ff..".txt", checkff)
	print("[VBTDM] Wrote file : " .. "vbtdm/ff/"..ff..".txt")
end
	file.Write("vbtdm/ff/"..ff..".txt", checkff)
end
end

function ff_disable( ply )
if ply:IsAdmin() then
local ff = "friendlyfire"
local checkff  = "0"
if (not file.IsDir("vbtdm/ff","DATA")) then
    file.CreateDir("vbtdm/ff")
end
if not(file.Exists("vbtdm/ff/"..ff..".txt","DATA")) then
	file.Write("vbtdm/ff/"..ff..".txt", checkff)
	print("[VBTDM] Wrote file : " .. "vbtdm/ff/"..ff..".txt")
end
	file.Write("vbtdm/ff/"..ff..".txt", checkff)
end
end

concommand.Add( "ff_enable_1", ff_enable )
concommand.Add( "ff_enable_0", ff_disable )




// Remove console command "kill"

local function BlockSuicide(ply)
	ply:ConCommand( "vb_msg_kill_self" )
	return false
end
hook.Add( "CanPlayerSuicide", "BlockSuicide", BlockSuicide )