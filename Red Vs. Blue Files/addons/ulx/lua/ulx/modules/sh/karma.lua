local CATEGORY_NAME = "Utility"
function ulx.karma( calling_ply, target_plys, amount )
for i=1, #target_plys do
if target_plys[ i ]:GetBaseKarma() < amount then
target_plys[ i ]:SetLiveKarma( amount )
end
end
ulx.fancyLogAdmin( calling_ply, "#A set the karma for #T to #i", target_plys, amount )
end
local karma = ulx.command( CATEGORY_NAME, "ulx karma", ulx.karma, "!karma" )
karma:addParam{ type=ULib.cmds.PlayersArg }
karma:addParam{ type=ULib.cmds.NumArg, min=0, max=1000, hint="karma", ULib.cmds.round }
karma:defaultAccess( ULib.ACCESS_ADMIN )
karma:help( "Changes karma on a player." )