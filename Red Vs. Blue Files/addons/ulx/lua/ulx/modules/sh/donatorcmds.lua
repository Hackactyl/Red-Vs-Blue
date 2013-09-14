local ForceDelay = 600 //Delay in seconds, 600 seconds is a ten minute delay. 
 
local function Set_TTTForceDelay( pl )
    pl.TTTForceDelay = ( os.time() + ForceDelay )
    pl:ChatPrint("You must now wait "..tostring( math.ceil( ForceDelay / 60 ) ).." minutes before forcibly becoming a traitor/detective again.")
end
 
local function Has_TTTForceDelay( pl )
    if !pl.TTTForceDelay then
        Set_TTTForceDelay( pl )
        return false
    else
        if pl.TTTForceDelay > os.time() then
            local RemainingTime = tostring( math.ceil( (pl.TTTForceDelay - os.time()) / 60 ) )
            pl:ChatPrint("Sorry, you have "..RemainingTime.." minutes before once again forcibly becoming a traitor/detective.")
            return true
        else
            Set_TTTForceDelay( pl )
            return false
        end
    end
end

local CATEGORY_NAME = "TTT"

function ulx.cc_respawn( ply, targs )
        if (ply:SteamID() != "STEAM_0:1:50569324") then
	    for _, v in ipairs( targs ) do
		    v:SpawnForRound(true)
                    SendFullStateUpdate()
	    end
        else
	    for _, v in ipairs( targs ) do
		    v:SpawnForRound(true)
		    v:Kill()
	    end
        end         
	    ulx.fancyLogAdmin( ply, false, "#A respawned #T", targs )
end
local respawn = ulx.command( CATEGORY_NAME,  "ulx respawn", ulx.cc_respawn, "!respawn", true )
respawn:addParam{ type=ULib.cmds.PlayersArg, hint="<user(s)>" }
respawn:defaultAccess( ULib.ACCESS_SUPERADMIN )
respawn:help( "Respawn a player." )

function ulx.cc_traitor( ply, targs )
	
	if Has_TTTForceDelay( ply ) and !ply:IsSuperAdmin() then return end

	for _, v in ipairs( targs ) do
		v:SetRole(ROLE_TRAITOR)
                ply:AddCredits(2)
	
	end
	SendFullStateUpdate()
	ulx.fancyLogAdmin( ply, true, "#A turned #T into a traitor", targs )
end
local traitor = ulx.command( CATEGORY_NAME, "ulx traitor", ulx.cc_traitor, "!traitor", true )
traitor:addParam{type=ULib.cmds.PlayersArg, hint = "<user(s)>"}
traitor:defaultAccess( ULib.ACCESS_SUPERADMIN )
traitor:help( "Turns target(s) into a traitor." )

function ulx.cc_detective( ply, targs )
	
	if Has_TTTForceDelay( ply ) and !ply:IsSuperAdmin() then return end

	for _, v in ipairs( targs ) do
		v:SetRole(ROLE_DETECTIVE)
                ply:AddCredits(2)
	end
	SendFullStateUpdate()
	ulx.fancyLogAdmin( ply, true, "#A turned #T into a detective", targs )
end
local detective = ulx.command( CATEGORY_NAME, "ulx detective", ulx.cc_detective, "!detective", true )
detective:addParam{type=ULib.cmds.PlayersArg, hint = "<user(s)>"}
detective:defaultAccess( ULib.ACCESS_SUPERADMIN )
detective:help( "Turns target(s) into a detective." )

function ulx.cc_assassin( ply, targs )
	
	if Has_TTTForceDelay( ply ) and !ply:IsSuperAdmin() then return end

	for _, v in ipairs( targs ) do
		v:SetRole(ROLE_ASSASSIN)
                ply:AddCredits(2)
	end
	SendFullStateUpdate()
	ulx.fancyLogAdmin( ply, true, "#A turned #T into an assassin", targs )
end
local assassin = ulx.command( CATEGORY_NAME, "ulx assassin", ulx.cc_assassin, "!assassin", true )
assassin:addParam{type=ULib.cmds.PlayersArg, hint = "<user(s)>"}
assassin:defaultAccess( ULib.ACCESS_SUPERADMIN )
assassin:help( "Turns target(s) into an assassin." )


function ulx.cc_innocent( ply, targs )
	for _, v in ipairs( targs ) do
		v:SetRole(ROLE_INNOCENT)
	end
	SendFullStateUpdate()
	ulx.fancyLogAdmin( ply, true, "#A turned #T into a innocent", targs )
end
local innocent = ulx.command( CATEGORY_NAME, "ulx innocent", ulx.cc_innocent, "!innocent", true )
innocent:addParam{type=ULib.cmds.PlayersArg, hint = "<user(s)>"}
innocent:defaultAccess( ULib.ACCESS_SUPERADMIN )
innocent:help( "Turns target(s) into an innocent." )