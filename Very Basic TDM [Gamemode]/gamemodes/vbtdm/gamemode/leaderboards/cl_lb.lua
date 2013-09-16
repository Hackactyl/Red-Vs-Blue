if SERVER then return end

function Leaderboards()
	--set up frame - 
	LBPanel = vgui.Create("DFrame") --Parent frame
	LBPanel:SetSize(500,700)
	LBPanel:SetTitle("VBTDM Leaderboards")
	LBPanel:Center()
	LBPanel:SetDraggable(true)
	LBPanel:ShowCloseButton(true)
	LBPanel:SetVisible(true)
	LBPanel:MakePopup()
	
	LBList = vgui.Create("DListView") --Table with players and scores
	LBList:SetParent(LBPanel)
	LBList:SetPos(25,25)
	LBList:SetSize(450,600)
	LBList:SetMultiSelect(false)
	LBList:AddColumn("Name")
	LBList:AddColumn("Kills")
	LBList:AddColumn("Deaths")
	LBList:AddColumn("K:D")

end
usermessage.Hook("LeaderboardsLB",Leaderboards)
function LBData(data)
	LBList:AddLine(data:ReadString(),data:ReadShort(),data:ReadShort(),math.Round(data:ReadFloat(),3))
    LBList:SortByColumn(2,true)
end

usermessage.Hook("LBData",LBData)

function Rank(data)
	local rank =  data:ReadShort()
	local players = data:ReadShort()
	chat.AddText(Color(200,200,0),"You are ranked " .. rank .. " out of " .. players .. " players.")
end
usermessage.Hook("RankLB",Rank)