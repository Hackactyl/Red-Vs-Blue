AddCSLuaFile()
if CLIENT then
Mapvote = {}
Mapvote.guiName = "Base GUI"
Mapvote.frame = nil

Mapvote.initialize = function()

	--Include client script assets, which are located under lua/mapvote/
	for index, file in pairs( file.Find( "mapvote/cl_*.lua","LUA","nameasc" ) ) do
			include( "mapvote/"..file )
	end

	net.Receive( "mapvote_prompt", Mapvote.guiFunction )
	print( "MapVote loaded! Using - "..Mapvote.guiName )
end
hook.Add( "Initialize", "Mapvote_Initialize", Mapvote.initialize )

Mapvote.guiFunction = function()
	local maps = net.ReadTable() 
	print("Map vote started!\nMap Selection:")
	LocalPlayer():ChatPrint("Vote for the next map!")
	local mapcount = table.Count(maps)
	PrintTable(maps)
	
	Mapvote.frame = vgui.Create("DFrame") 	
	Mapvote.frame:SetPos(100, 100)              
	Mapvote.frame:SetSize(128, 39+mapcount*31)    
	Mapvote.frame:SetTitle("Mapvote") 
	Mapvote.frame:SetVisible(true)             
	Mapvote.frame:SetDraggable(true)      
	Mapvote.frame:ShowCloseButton(true)        
	Mapvote.frame:MakePopup()        
	
	for i = 1,mapcount do
		local button = vgui.Create("DButton",Mapvote.frame)
		button:SetPos(8,31*i)
		button:SetText(maps[i])
		button.DoClick = function()
			net.Start("mapvote_castvote")
			net.WriteInt(i,16) 
			net.SendToServer()
			Mapvote.frame:Close()
			end
		button:SetSize(112,30)		
	end
	Mapvote.frame:Center()
end
end