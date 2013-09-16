Thanks you for downloading my gamemode.
README VERSION = 1.2.1

This ReadMe may change every so often, so if something on this readme is not here or available at the current version, then it might be in there in the next update.
(also sorry if you're using Notepad++ and have the lua plugin for it, it might get a little hard to read)


Table of Contents:
1. Adding Weapons
2. Adding Ammo
3. Creating, Removing, Reloading Custom Spawns
4. Renaming or Changing teams
5. Extracting the Gamemode







/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\	
******************************************   ADDING WEAPON #1  ****************************************
\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/

EDIT: New Weapon Classes

We've changed things now. Now we do classes, instead of everyone having to use the same weapons, now you can select a class of weapons.
Basically the same rules apply on how to add weapons


If you want to add weapons to the gamemode, you must already have a custom weapon pack in your addons or where ever you place them.
Then you find out the weapon name (usually they have "weapon_" before the actually name of the weapon. You can also go to sandbox get the weapon from there, and look at your console for the weapon name)
After you have gotten the name of your weapon, you go to vbtdm/gamemode/Class/class_sv.lua and you will see a format like this or something like this where it say's WeaponTable:

WeaponTable_class1[1] = ("weapon_crowbar")
WeaponTable_class1[2] = ("weapon_pistol")
WeaponTable_class1[3] = ("weapon_shotgun")
WeaponTable_class1[4] = ("weapon_smg1")

You take the weapon name, and place it within the quotes (I.E:  WeaponTable[1] = ("weapon_crowbar") to WeaponTable[1] = ("weapon_real_cs_admin_weapon")) and it will work with the classes.
If you have used all four weapon slots, do no worry because you can add as many weapons as you want or can by adding another WeaponTable, such like this:

WeaponTable_class1[1] = ("weapon_crowbar")
WeaponTable_class1[2] = ("weapon_pistol")
WeaponTable_class1[3] = ("weapon_shotgun")
WeaponTable_class1[4] = ("weapon_smg1")
WeaponTable_class1[5] = ("weapon_real_cs_admin_weapon")





/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\	
******************************************   ADDING AMMO #2  ******************************************
\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/

So if you understood my how to add weapons from above, then you should be able to follow these directions. Also adding ammo is in the same file as adding weapons vbtdm/gamemode/sv_teams.lua
Due to my lack of expierence with custom weapons, I wouldn't really know how to get ammo type from custom weapons off hand so I will do my best to explain.
Inside your weapon pack, there should be something called lua/entites/weapons and in there will be all the weapons of the weapon pack. So you obviously need to know what weapon you want to use
So after you have choosen what weapon you are using(you have to repeat this process for all the weapons/ammo you want to add) you open the folder, and open a file called "shared.lua"
Inside the "shared.lua" will be something called "SWEP.Primary.Ammo", so for that you need to look at the type of ammo it is. So as an example, this is what the weapon_real_cs_five-seven file looks like:


****************
if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName 		= "FN FIVE-SEVEN"
	SWEP.ViewModelFOV		= 70
	SWEP.Slot 			= 1
	SWEP.SlotPos 		= 1
	SWEP.IconLetter 		= "u"

	killicon.AddFont("weapon_real_cs_five-seven", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ))
end
SWEP.EjectDelay			= 0.05
SWEP.Instructions 		= "Damage: 10% \nRecoil: 6% \nPrecision: 89% \nType: Semi-Automatic"
SWEP.Category			= "CS:S Realistic Weapons"		-- Swep Categorie (You can type what your want)
SWEP.Base 				= "weapon_real_base_pistol"
SWEP.HoldType		= "pistol"
SWEP.Spawnable 			= true
SWEP.AdminSpawnable 		= true
SWEP.ViewModel 			= "models/weapons/v_pist_fiveseven.mdl"
SWEP.WorldModel 			= "models/weapons/w_pist_fiveseven.mdl"
SWEP.Primary.Sound 		= Sound("Weapon_FiveSeven.Single")
SWEP.Primary.Recoil 		= 0.6
SWEP.Primary.Damage 		= 10
SWEP.Primary.NumShots 		= 1
SWEP.Primary.Cone 		= 0.011
SWEP.Primary.ClipSize 		= 20
SWEP.Primary.Delay 		= 0.13
SWEP.Primary.DefaultClip 	= 20
SWEP.Primary.Automatic 		= false
SWEP.Primary.Ammo 		= "pistol"
SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "none"
SWEP.IronSightsPos 		= Vector (4.5282, -4.7373, 3.3248)
SWEP.IronSightsAng 		= Vector (-0.4139, 0.0182, 0)
*****************


If you can read, you most likely saw this:

SWEP.Primary.Ammo 		= "pistol"

Well that is the weapon ammo type. So if you take the weapon type of ammo, you add it to this:

WeaponAmmoTable={}
WeaponAmmoTable[1] = {"Pistol",36}
WeaponAmmoTable[2] = {"Buckshot",24}
WeaponAmmoTable[3] = {"SMG1",90}
WeaponAmmoTable[4] = {"SMG1_Grenade",1}
WeaponAmmoTable[4] = {"pistol",}

You may have also noticed that I already have "Pistol" as a weapon ammo type, so if in this case you did not replace the hl2 weapons for all of your custom weapon pack you will NOT need to add "pistol"
as it is already added. Another thing to remember is that capital letters do not matter, so if it is "pistol", and then you see one of your weapon packs call it "Pistol", you will not need to add
"pistol" again as capital letters do not matter.





/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\	
***********************************   CREATING CUSTOM SPAWNS #3   **************************************
\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/

***ADDING SPAWNS:***
This should be really easy to understand.
To add a custom spawn you need to be an admin (so like use ulx, assmod, or default garrys mod admin(you can google that or something, I will not explain how to get default garrys mod admin))
Now if you are an admin, just type !setspawn TEAM_NAME SPAWN_ID, and I will provide an example on doing so

!setspawn US-Army 1
!setspawn Wehrmacht 1

Now I will break this down a little bit:
TEAM_NAME is the name of the team, so that is pretty easy to understand
SPAWN_ID is the spawn number (not in order, when you die you spawn randomly at 1-9), so if I type

!setspawn Wehrmacht 1
THEN
!setspawn Wehrmacht 2

This means that I will have two spawns for the red team. When peoeple die, it will spawn you randomly at one or the other.


***REMOVING SPAWNS:***
Now if you wanto to delete one of the spawns for a team you type this:

!removespawn US-Army 3

That will remove the third spawn from the red team. Simple to understand, correct?

BUG/GLITCH: IF WE ARE STILL AT VERSION 1.1.6, then there is a bug that will make it look like when you type 
!removespawn US-Army 4
you will look like it removed all the spawns from 4 and above, but if you type !reloadspawns or restart the map (one or the other should fix it) they should come back.


***RELOADING SPAWNS:***
If it appears that the spawns have "gltiched" or stopped working, you can type

!reloadspawns




/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\	
********************************   RENAMING OR CHANGING TEAMS #4   ************************************
\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/

(This section will be changed in the near future)

I advise you not to alter the teams in the follow ways:
Renaming them
Chaning them
Adding them
Removing them

You should only do that if you know what you are doing. I will tell you all the files you have to change if you do end up wanting to alter the teams

vbtdm/gamemode/shared.lua

vbtdm/gamemode/teams/sv_teams.lua
vbtdm/gamemode/teams/sv_teamscore.lua

vbtdm/gamemode/goal/sv_goal.lua
vbtdm/gamemode/goal/cl_goal.lua

vbtdm/gamemode/usms/cl_msg.lua
vbtdm/gamemode/usms/sv_msg.lua

vbtdm/gamemode/hud/cl_HUD.lua

vbtdm/gamemode/menus/cl_new_menu.lua

Sounds like a lot of work doesnt it? Well idk how much work it is to be honest, all I know is that it would be a lot.
Though if you just want to remove teams, you just have to alter 
vbtdm/gamemode/teams/sv_teams.lua
vbtdm/gamemode/menus/cl_new_menu.lua





/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\	
**********************************   EXTRACTING THE GAMEMODE #5   *************************************
\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/*\*/

Due to the fact that workshop is stupid, it does not let me put all the materials, models, sounds, ect in the content folder like it belongs. 
So if you ended up extracting the gamemode (you would have had to extract the gamemode to see this file, unless you are using the SVN version of it) you will need to move these folders:

materials
models
sounds

to this folder:

gamemodes/vbtdm/content/ >IN HERE<