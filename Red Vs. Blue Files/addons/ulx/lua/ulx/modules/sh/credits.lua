local CATEGORY_NAME = "TTT"

function ulx.cc_credits( ply, targs )

	for _, v in ipairs( targs ) do
		ply:AddCredits(100)
	end
	SendFullStateUpdate()
	ulx.fancyLogAdmin( ply, true, "#A gave #T credits", targs )
end
local credits = ulx.command( CATEGORY_NAME, "ulx credits", ulx.cc_credits, "!credits", true )
credits:addParam{type=ULib.cmds.PlayersArg, hint = "<user(s)>"}
credits:defaultAccess( ULib.ACCESS_SUPERADMIN )
credits:help( "gives 100 credits" )