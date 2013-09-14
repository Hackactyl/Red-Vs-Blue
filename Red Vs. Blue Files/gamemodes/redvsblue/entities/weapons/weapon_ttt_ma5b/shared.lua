if SERVER then

   AddCSLuaFile( "shared.lua" )
end

SWEP.HoldType			= "ar2"


if CLIENT then

   SWEP.PrintName			= "Halo MA5B"
   SWEP.Slot				= 2
   SWEP.Slotpos                         = 1
   SWEP.ViewModelFOV	= "70"
   SWEP.CSMuzzleFlashes = true
   SWEP.DrawCrosshair   = false
   
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

SWEP.Primary.Delay			= 0.085
SWEP.Primary.Recoil			= 1.20
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.Damage = 14
SWEP.Primary.Cone = 0.06
SWEP.Primary.ClipSize = 60
SWEP.Primary.ClipMax = 120
SWEP.Primary.DefaultClip = 60
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.ViewModel			= "models/weapons/v_ma5b.mdl"
SWEP.WorldModel			= "models/weapons/w_ma5b.mdl"
SWEP.AllowDrop = true

SWEP.Primary.Sound = Sound( "weapons/aafire1.wav" )

function SWEP:Initialize()
	if (SERVER) then
		self:SetWeaponHoldType(self.HoldType)
	end
end

function SWEP:SecondaryAttack()
	self.Weapon:SetNextSecondaryFire(CurTime() + 1.0)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1.0)
	if SERVER then self.Owner:EmitSound(Sound("weapons/ar_impact.wav")) end
	if SERVER then self.Owner:EmitSound(Sound("weapons/ar_melee.wav")) end
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
function SWEP:PrimaryAttack()
	self.Weapon:EmitSound(self.Primary.Sound)
	self:ShootBullet( 0, self.Primary.NumShots, self.Primary.Cone )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

end

function SWEP:ShootBullet( damage, num_bullets, aimcone )	
	local bullet = {}
	bullet.Num 		= num_bullets
	bullet.Src 		= self.Owner:GetShootPos()
	bullet.Dir 		= self.Owner:GetAimVector()
	bullet.Spread 		= Vector( aimcone, aimcone, 0 )
	bullet.Tracer		= 5
	bullet.Force		= 0
	bullet.Damage		= 19
	bullet.AmmoType 	= self.Primary.Ammo
	self.Owner:FireBullets( bullet )
	self:ShootEffects()
	
end

function SWEP:ShootEffects()
	self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
	self.Owner:MuzzleFlash()
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
end


function SWEP:Reload()
    if ( self:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
      self.Weapon:DefaultReload( ACT_VM_RELOAD );
      self.Weapon:EmitSound(Sound("weapons/ar_reload.wav"))
    end
end

function SWEP:Deploy()
	self.Weapon:EmitSound(Sound("weapons/ar_ready.wav"))
end
