//ROODAY
local freezespeed = 2500
local removespeed = 5000
hook.Add("Think","AMB_CrashCatcher",function()
        for k, ent in pairs(ents.FindByClass("prop_ragdoll")) do
                if IsValid(ent) then
                        if ent.player_ragdoll then
                                local velo = ent:GetVelocity( ):Length()
                                local ply = false
                                if IsValid(ent:GetOwner()) then
                                        ply = ent:GetOwner()
                                end    
                                if velo >= removespeed then
                                        if ply != false then
                                                game.ConsoleCommand("ulx slay \"" .. ply:GetName() .. "\" \n")
                                                PrintMessage(HUD_PRINTTALK, "[Autoslay] " .. ply:GetName() .. " was auto-slain for moving too fast.")
                                        end
                                        ent:Remove()
                                        ServerLog("[!CRASHCATCHER!] It seems a ragdoll's speed was ("..velo.."). IT SHALL EXIST NO LONGER!\n")
                                        local messageToShow = "[CRASH PREVENTION] A ragdoll was removed to prevent server crashing. It was "
                                        if CORPSE.GetFound(ent, true) then
                                                PrintMessage(HUD_PRINTTALK, messageToShow .. "an unID'd body. The Traitors are laughing at your misfortune.")
                                        else
                                                PrintMessage(HUD_PRINTTALK, messageToShow .. ent:GetNWString("nick") .. "'s body. Hope you got DNA!")
                                        end
                                elseif velo >= freezespeed then
                                        AMB_KillVelocity(ent)
                                        ServerLog("[!CRASHCATCHER!] It seems a ragdoll's speed was ("..velo.."). IT SHALL MOVE NO FURTHER! \n")
										local messageToShow = "[CRASH PREVENTION] It seems a ragdoll was moving too fast and upset ROODAY. FREEZE, RAGDOLL!"
                                end
                        end
                end
        end
end)
 
function AMB_SetSubPhysMotionEnabled(ent, enable)
        if not IsValid(ent) then return end
   
        ent:SetVelocity(vector_origin)
       
        if !(enable) then
                ent:SetColor(Color(255,0,255,255))
        else
                ent:SetColor(Color(255,255,255,255))
        end
       
        if !(enable) then
                if IsValid(ent:GetOwner()) then
                        ent:GetOwner():GetWeapon("weapon_zm_carry"):Reset(false)
                end
                --ent:SetPos(ent:GetPos()+Vector(0,0,50))
        end
 
        for i=0, ent:GetPhysicsObjectCount()-1 do
                local subphys = ent:GetPhysicsObjectNum(i)
                if IsValid(subphys) then
                        subphys:EnableMotion(enable)
                        if !(enable) then
                                subphys:SetVelocity(vector_origin)
                                subphys:SetMass(subphys:GetMass()*20)
                        end
                        if enable then
                                subphys:SetMass(subphys:GetMass()/20)
                                subphys:Wake()
                        end
                end
        end
       
       
       
        ent:SetVelocity(vector_origin)
       
end
 
function AMB_KillVelocity(ent)
   AMB_SetSubPhysMotionEnabled(ent, false)
   timer.Simple(3, function() AMB_SetSubPhysMotionEnabled(ent, true) end)
end