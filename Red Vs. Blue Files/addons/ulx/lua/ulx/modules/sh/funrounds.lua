CATEGORY_NAME = "Fun Round"

function ulx.kniferound( calling_ply, target_plys )
	for i=1, #target_plys do
		for _, v in ipairs( target_plys ) do
			v:SpawnForRound(true)
                	v:Stripweapons()
                	v:give(weapon_ttt_knife)
		end
	ulx.fancyLogAdmin( calling_ply, true, "#A Started a special knife round!", targs )
        end
ply:ChatPrint( "Rules: Anything goes, knife someone and take their knife. Use that knife. Profit!" ) 
end
local kniferound = ulx.command( CATEGORY_NAME, "ulx kniferound", ulx.kniferound, "!kniferound" )
kniferound:addParam{ type=ULib.cmds.PlayersArg }
kniferound:defaultAccess( ULib.ACCESS_ADMIN )
kniferound:help( "Initiates a special knife round for the next round." )