german_score = 0
us_score = 0
topteam = ""
topteamscore = 0
function hud()
if not LocalPlayer():Alive() then return end
if (LocalPlayer():GetActiveWeapon() == NULL or LocalPlayer():GetActiveWeapon() == "Camera") then return end
local client = LocalPlayer()
local health = LocalPlayer():Health()
local armor = LocalPlayer():Armor()
local stamina = LocalPlayer():GetNWInt( "Stamina" )

local mag_left = client:GetActiveWeapon():Clip1()
local mag_extra = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType())
local secondary_ammo = client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType())
local H = 0
local A = 0
local I = 0
local U = 0
local E = 0
local O = 255
local wepname = "Nothing"

local yourteam = client:Team()

local plyteamscore = 0

if (yourteam == 3) then
plyteamscore = german_score * 100
elseif (yourteam == 2) then
plyteamscore = us_score * 100
end

local plyscore = client:Frags()*100

draw.RoundedBox(8, 600, ScrH() - 75, 220, 105, Color(55,55,55,200))
draw.RoundedBox(8, 375, ScrH() - 75, 215, 100, Color(55,55,55,200))
draw.SimpleTextOutlined( "Your Team - ", "Trebuchet20", 380, ScrH() - 75, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleTextOutlined( "Your Score: "..plyscore, "Trebuchet20", 380, ScrH() - 50, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleTextOutlined( "Team Score: "..plyteamscore, "Trebuchet20", 380, ScrH() - 25, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))

draw.SimpleTextOutlined( "Top Team -", "Trebuchet20", 605, ScrH() - 75, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))

if (yourteam == 3) then
draw.SimpleTextOutlined( "Red", "Trebuchet20", 475, ScrH() - 75, Color(255,0,0,255), 0, 0, 2, Color(0,0,0,255))
elseif (yourteam == 2) then
draw.SimpleTextOutlined( "Blue", "Trebuchet20", 475, ScrH() - 75, Color(0,0,255,255), 0, 0, 2, Color(0,0,0,255))
elseif (yourteam == 1337) then
draw.SimpleTextOutlined( "NULL", "Trebuchet20", 475, ScrH() - 75, Color(255,215,0,255), 0, 0, 2, Color(0,0,0,255))
elseif (yourteam == 1) then
draw.SimpleTextOutlined( "Admin", "Trebuchet20", 475, ScrH() - 75, Color(255,0,255,255), 0, 0, 2, Color(0,0,0,255))
end

if (topteam == "Red") then
draw.SimpleTextOutlined( topteam, "Trebuchet20", 691, ScrH() - 75, Color(255,0,0,255), 0, 0, 2, Color(0,0,0,255))
elseif (topteam == "Blue") then
draw.SimpleTextOutlined( topteam, "Trebuchet20", 691, ScrH() - 75, Color(0,0,255,255), 0, 0, 2, Color(0,0,0,255))
end

draw.SimpleTextOutlined( "Team Score: "..topteamscore, "Trebuchet20", 605, ScrH() - 50, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))

if (health < 100) then
H = -20
end

if (health < 10) then
H = -40
end

draw.RoundedBox(8, 77.5, ScrH() - 107.5, 220, 45, Color(20,20,20,255	))
draw.RoundedBox(8, 77.5, ScrH() - 107.5, 215, 40, Color(55,55,55,255))
draw.RoundedBox(0, 82, ScrH() - 103.5, health*2+7, 25+7, Color(155,0,0,255))
draw.RoundedBox(0, 85, ScrH() - 100, health*2, 25, Color(255,0,0,255))
draw.SimpleTextOutlined( health, "HUDNumber5", 10 - H, ScrH() - 110, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleText("Health", "HUDNumber5", 130, ScrH() - 110, Color(0,0,0,100+health*1.55))

if (armor < 100) then
A = -20
end

if (armor < 10) then
A = -40
end

draw.RoundedBox(8, 77.5, ScrH() - 107.5 + 50, 220, 45, Color(20,20,20,255))
draw.RoundedBox(8, 77.5, ScrH() - 107.5 + 50, 215, 40, Color(55,55,55,255))
draw.RoundedBox(0, 82, ScrH() - 103.5 + 50, armor*2+7, 25+7, Color(0,0,155,255))
draw.RoundedBox(0, 85, ScrH() - 100 + 50, armor*2, 25, Color(0,0,255,255))
draw.SimpleTextOutlined( armor, "HUDNumber5", 10 - A, ScrH() - 110 + 50, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleText("Armor", "HUDNumber5", 130, ScrH() - 110 + 50, Color(0,0,0,100+armor*1.55))

draw.RoundedBox(8, 305.5, ScrH() - 182.5, 45, 170, Color(20,20,20,255))
draw.RoundedBox(8, 305.5, ScrH() - 182.5, 40, 170, Color(55,55,55,255))
draw.RoundedBox(0, 310, ScrH() - 178.5, 25+7, stamina*1.5+7, Color(0,155,0,255))
draw.RoundedBox(0, 313, ScrH() - 175, 25, stamina*1.5, Color(0,255,0,255))

if (mag_left < 10) then
I = 20
U = 45
elseif (mag_left > 9) then
U = 25
end

if (mag_extra < 10) then
E = 20
elseif (mag_extra > 99) then
E = -25
end
if (client:GetActiveWeapon():GetClass() == "weapon_crowbar") then
O = 0
wepname = "Crowbar"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_smg1") then
wepname = "Sub-Machine Gun"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_shotgun") then
wepname = "Shotgun"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_pistol") then
wepname = "Pistol"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_357") then
wepname = "Magnum"	
end


if (client:GetActiveWeapon():GetClass() == "weapon_crossbow") then
wepname = "Crossbow"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_ar2") then
wepname = "Assualt Rifle"	
end

if (client:GetActiveWeapon():GetClass() == "gmod_tool") then
wepname = "Tool Gun"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_physcannon") then
wepname = "Gravity Gun"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_slam") then
wepname = "SLAM"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_stunstick") then
wepname = "Stunstick"
O = 0	
end

if (client:GetActiveWeapon():GetClass() == "weapon_physgun") then
O = 0
wepname = "Godly Weapon!!1"	
end

if (client:GetActiveWeapon():GetClass() == "weapon_rpg") then
wepname = "Rocket Launcher"
draw.SimpleTextOutlined( wepname, "Trebuchet24", 80, ScrH() - 110 - 70, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleTextOutlined( mag_extra, "HUDNumber5", 100 - I, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
elseif (client:GetActiveWeapon():GetClass() == "weapon_frag") then
wepname = "Grenade"
draw.SimpleTextOutlined( wepname, "Trebuchet24", 80, ScrH() - 110 - 70, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleTextOutlined( mag_extra, "HUDNumber5", 100 - I, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
else
draw.SimpleTextOutlined( wepname, "Trebuchet24", 80, ScrH() - 110 - 70, Color(255,255,255,255), 0, 0, 2, Color(0,0,0,255))
draw.SimpleTextOutlined( mag_left, "HUDNumber5", 80, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
draw.SimpleTextOutlined( "/", "HUDNumber5", 125 - I, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
draw.SimpleTextOutlined( mag_extra, "HUDNumber5", 145 - I, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
draw.SimpleTextOutlined( "|", "HUDNumber5", 210 - U - E, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
draw.SimpleTextOutlined( secondary_ammo, "HUDNumber5", 230 - U - E, ScrH() - 110 - 50, Color(255,255,255,O), 0, 0, 2, Color(0,0,0,O))
end
end
hook.Add("HUDPaint", "MyHudName", hud)
 
function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)

function checktopteam(topdata)
	local t1 = topdata:ReadShort()
	if(t1 == 1) then
	topteam = "Blue"
	topteamscore = us_score * 100
	elseif(t1 == 2) then
	topteam = "Red"
	topteamscore = german_score * 100
	end
end
usermessage.Hook( "topteamscore", checktopteam )

function checkscorepoint(data)
	local a1 = data:ReadShort()
	local a2 = data:ReadShort()
	if(a2 == 2) then
	us_score = a1
	elseif(a2 == 3) then
	german_score = a1
	end
end
usermessage.Hook( "teamscoring", checkscorepoint )

function newplayerspawn(newdata)
	german_score = newdata:ReadShort()
	us_score = newdata:ReadShort()
end
usermessage.Hook( "newplayer", newplayerspawn)

function topteamreset()
	topteamscore = 0
	topteam = ""
end
usermessage.Hook( "topteamscorereset", topteamreset )