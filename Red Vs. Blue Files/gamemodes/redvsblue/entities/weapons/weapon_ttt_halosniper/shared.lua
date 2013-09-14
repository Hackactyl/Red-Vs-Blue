if SERVER then

   AddCSLuaFile( "shared.lua" )
end

SWEP.HoldType			= "ar2"


if CLIENT then

   SWEP.PrintName			= "Halo Sniper"
   SWEP.Slot				= 2
   SWEP.ViewModelFOV	= "70"
   
end


SWEP.Base				= "weapon_tttbase"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AutoSpawnable = false
SWEP.Kind = WEAPON_HEAVY
SWEP.ViewModelFlip		= false

SWEP.Drawammo 			= true
SWEP.DrawCrosshair 		= false

SWEP.Weight				= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Delay			= 1.2
SWEP.Primary.Recoil			= 8
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "357"
SWEP.Primary.Damage = 50
SWEP.Primary.Cone = 0.005
SWEP.Primary.ClipSize = 5
SWEP.Primary.ClipMax = 20
SWEP.Primary.DefaultClip = 5
SWEP.AmmoEnt = "item_ammo_357_ttt"
SWEP.ViewModel			= "models/weapons/v_halo_sniper.mdl"
SWEP.WorldModel			= "models/weapons/w_halo_sniper.mdl"
SWEP.AllowDrop = true

SWEP.Primary.Sound = Sound( "hsniper/sniperfire1.wav" )


function SWEP:SecondaryAttack()
	self.Weapon:SetNextSecondaryFire(CurTime() + 1.0)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1.0)
	if SERVER then self.Owner:EmitSound(Sound("weapons/ar_impact.wav")) end
	if SERVER then self.Owner:EmitSound(Sound("hsniper/snipermelee.wav")) end
	local ang = self.Owner:GetAimVector()
	local spos = self.Owner:GetShootPos()

	local trace = {}
	trace.start = spos
	trace.endpos = spos + (ang * 150)
	trace.filter = self.Owner

	local tr = util.TraceLine(trace)

	if tr.HitNonWorld then
		local bullet = {}
		bullet.Num=5
		bullet.Src = self.Owner:GetShootPos()
		bullet.Dir= self.Owner:GetAimVector()
		bullet.Spread = Vector(0.15,0.15,0.15)
		bullet.Tracer = 0
		bullet.Force = 0
		bullet.Damage = 15
		self.Owner:FireBullets(bullet)
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

	elseif tr.HitWorld then
		self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
	elseif !tr.Hit then
		self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		end
end


function SWEP:Reload()
    if ( self:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
      self.Weapon:DefaultReload( ACT_VM_RELOAD );
      self.Weapon:EmitSound(Sound("hsniper/sniperreloadempty.wav"))
    end
end

function SWEP:Deploy()
	self.Weapon:EmitSound(Sound("hsniper/sniperdraw.wav"))
end
