 local function votekarmaDone2( t, target, time, ply, reason )
local shouldkarma = false

if t.results[ 1 ] and t.results[ 1 ] > 0 then
ulx.logUserAct( ply, target, "#A approved to reset the karma of #T (" .. (reason or "") .. ")" )
shouldkarma = true
else
ulx.logUserAct( ply, target, "#A unapproved to reset the karma of #T" )
end

if shouldkarma then
if reason and reason ~= "" then
if target:GetBaseKarma() < 1000 then
target:SetLiveKarma( 1000 )
end
else
if target:GetBaseKarma() < 1000 then
target:SetLiveKarma( 1000 )
end
end
end
end

local function votekarmaDone( t, target, time, ply, reason )
local results = t.results
local winner
local winnernum = 0
for id, numvotes in pairs( results ) do
if numvotes > winnernum then
winner = id
winnernum = numvotes
end
end

//local ratioNeeded = GetConVarNumber( "ulx_votekickSuccessratio" )
//local minVotes = GetConVarNumber( "ulx_votekickMinvotes" )
local ratioNeeded = 0.5
local minVotes = 2
local str
if winner ~= 1 or winnernum < minVotes or winnernum / t.voters < ratioNeeded then
str = "Vote results: User will not have their karma reset. (" .. (results[ 1 ] or "0") .. "/" .. t.voters .. ")"
else
str = "Vote results: User will now have their karma reset, pending admin approval. (" .. winnernum .. "/" .. t.voters .. ")"
ulx.doVote( "Accept result and karma reset for " .. target:Nick() .. "?", { "Yes", "No" }, votekarmaDone2, 30000, { ply }, true, target, time, ply, reason )
end

ULib.tsay( _, str ) -- TODO, color?
ulx.logString( str )
if isDedicatedServer() then Msg( str .. "\n" ) end
end

function ulx.votekarma( calling_ply, target_ply, reason )

if voteInProgress then
ULib.tsayError( ply, "There is already a vote in progress. Please wait for the current one to end.", true )
return
end

local msg = "Reset the karma of " .. target_ply:Nick() .. "?"
if reason and reason ~= "" then
msg = msg .. " (" .. reason .. ")"
end

ulx.doVote( msg, { "Yes", "No" }, votekarmaDone, _, _, _, target_ply, time, calling_ply, reason )
ulx.fancyLogAdmin( calling_ply, "#A started a votekarma for #T", target_ply )
end
local votekarma = ulx.command( "Voting", "ulx votekarma", ulx.votekarma, "!votekarma" )
votekarma:addParam{ type=ULib.cmds.PlayerArg }
votekarma:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_karma_reasons }
votekarma:defaultAccess( ULib.ACCESS_ADMIN )
votekarma:help( "Starts a public karma vote against target." )
//if SERVER then ulx.convar( "votekickSuccessratio", "0.6", _, ULib.ACCESS_ADMIN ) end -- The ratio needed for a votekarma to succeed
//if SERVER then ulx.convar( "votekickMinvotes", "2", _, ULib.ACCESS_ADMIN ) end -- Minimum votes needed for votekarma
