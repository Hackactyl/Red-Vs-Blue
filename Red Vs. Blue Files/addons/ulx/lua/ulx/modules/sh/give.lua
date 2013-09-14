local CATEGORY_NAME = "Utility"

function ulx.give(ply, targets, weap)

	local affected_plys = {}
        local weapp = weap
        local fuckoffrumbler = true -- set to true when he spams c4
	for i = 1, #targets do
		local v = targets[i]
		if not v:IsValid() then
			print("You can't give the server console a weapon!.")
		else
			if weap == "weapon_ttt_lemonvomit" then
				if not (ply:IsUserGroup("trusted assman") or ply:IsUserGroup("ca$h") or ply:IsUserGroup("superadmin")) then
					weap = "mcmangos"
					weapp = "mcmangos"
				end
				weapp = "mcmangos"
			elseif weap == "mcmangos" then
				weapp = "My son ideaot, he fucking died RIP."
			elseif string.find(weap,"npc_") ~= nil then
				ULib.tsayError(ply,"Don't fucking give NPCs")
                        elseif fuckoffrumbler and ply:SteamID() == "STEAM_0:0:43018199" and v:SteamID() == "STEAM_0:0:43018199" and weap == "weapon_ttt_c4" then
                                ULib.tsayError(ply,"Do you never learn or what")
                                weap = "fucking_nothing"
                                weapp = "fucking_nothing"
                        end
			if v:IsSpec() or not v:Alive() then
				ULib.tsayError(ply,"My son ideaot, he fucking died RIP.")
			else
				v:Give(weap)
				table.insert( affected_plys, v )
			end
		end
	end

	ulx.fancyLogAdmin( ply, true, "#A gave #T #s.", affected_plys, weapp )
end
local give = ulx.command(CATEGORY_NAME, "ulx give", ulx.give, "!give", false)
give:addParam{ type = ULib.cmds.PlayersArg }
give:addParam{ type = ULib.cmds.StringArg, hint = "name of weapon / item" }
give:defaultAccess(ULib.ACCESS_ADMIN)
give:help("Give the player a weapon / item.")
