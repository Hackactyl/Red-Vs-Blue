include( "admin_buttons.lua" )
include( "vote_button.lua" )

local PANEL = {}

/*---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------*/
function PANEL:Init()

	self.InfoLabels = {}
	self.InfoLabels[ 1 ] = {}
	self.InfoLabels[ 2 ] = {}
	self.InfoLabels[ 3 ] = {}
	
	self.btnKick = vgui.Create( "suiplayerkickbutton", self )
	self.btnBan = vgui.Create( "suiplayerbanbutton", self )
	self.btnPBan = vgui.Create( "suiplayerpermbanbutton", self )
	
	self.VoteButtons = {}

	self.VoteButtons[8] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[8]:SetUp( "silkicons/star", "smile", "I like this player!" )
	
	self.VoteButtons[7] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[7]:SetUp( "silkicons/heart", "love", "I love this player!" )

	self.VoteButtons[6] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[6]:SetUp( "silkicons/star", "gold_star", "Wow! Gold star for you!" )

	self.VoteButtons[5] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[5]:SetUp( "info", "informative", "This player is very informative!" )
	
	self.VoteButtons[4] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[4]:SetUp( "silkicons/user", "friendly", "This player is very friendly!" )

	self.VoteButtons[3] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[3]:SetUp( "silkicons/exclamation", "naughty", "This player is naughty!" )
	
	self.VoteButtons[2] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[2]:SetUp( "gmod_logo", "god", "You are my GOD!" )
	
	self.VoteButtons[1] = vgui.Create( "suispawnmenuvotebutton", self )
	self.VoteButtons[1]:SetUp( "gmod_logo", "gay", "This player is GAY!" )

end

/*---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------*/

surface.CreateFont( "suiscoreboardcardinfo",{font="DefaultSmall", size=12, weight=0, antialiasing=true})
function PANEL:SetInfo( column, k, v )

	if ( !v || v == "" ) then v = "N/A" end

	if ( !self.InfoLabels[ column ][ k ] ) then
	
		self.InfoLabels[ column ][ k ] = {}
		self.InfoLabels[ column ][ k ].Key 	= vgui.Create( "DLabel", self )
		self.InfoLabels[ column ][ k ].Value 	= vgui.Create( "DLabel", self )
		self.InfoLabels[ column ][ k ].Key:SetText( k )
		self.InfoLabels[ column ][ k ].Key:SetColor(Color(0,0,0,255))
		self.InfoLabels[ column ][ k ].Key:SetFont("suiscoreboardcardinfo")
		self:InvalidateLayout()
	
	end
	
	self.InfoLabels[ column ][ k ].Value:SetText( v )
	self.InfoLabels[ column ][ k ].Value:SetColor(Color(0,0,0,255))
	self.InfoLabels[ column ][ k ].Value:SetFont("suiscoreboardcardinfo")
	return true

end


/*---------------------------------------------------------
   Name: UpdatePlayerData
---------------------------------------------------------*/
function PANEL:SetPlayer( ply )

	self.Player = ply
	self:UpdatePlayerData()

end

/*---------------------------------------------------------
   Name: UpdatePlayerData
---------------------------------------------------------*/
function PANEL:UpdatePlayerData()

	if (!self.Player) then return end
	if ( !self.Player:IsValid() ) then return end
	
	self:InvalidateLayout()

end

/*---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------*/
function PANEL:ApplySchemeSettings()
	for _k, column in pairs( self.InfoLabels ) do
		for k, v in pairs( column ) do
				v.Key:SetFGColor( 50, 50, 50, 255 )
				v.Value:SetFGColor( 80, 80, 80, 255 )	
		end
	
	end

end

/*---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------*/
function PANEL:Think()

	if ( self.PlayerUpdate && self.PlayerUpdate > CurTime() ) then return end
	self.PlayerUpdate = CurTime() + 0.25
	
	self:UpdatePlayerData()

end

/*---------------------------------------------------------
   Name: PerformLayout
---------------------------------------------------------*/
function PANEL:PerformLayout()	

	local x = 5

	for column, column in pairs( self.InfoLabels ) do
	
		local y = 0
		local RightMost = 0
	
		for k, v in pairs( column ) do
	
			v.Key:SetPos( x, y )
			v.Key:SizeToContents()
			
			v.Value:SetPos( x + 60 , y )
			v.Value:SizeToContents()
			
			y = y + v.Key:GetTall() + 2
			
			RightMost = math.max( RightMost, v.Value.x + v.Value:GetWide() )
		
		end
		
		//x = RightMost + 10
		if(x<100) then
		x = x + 205
		else
		x = x + 115
		end
	
	end
	
	if ( !self.Player  || !self.Player:IsAdmin() || !self.Player == !LocalPlayer() || !LocalPlayer():IsAdmin() ) then 
		self.btnKick:SetVisible( false )
		self.btnBan:SetVisible( false )
		self.btnPBan:SetVisible( false )
	
	else
	
		self.btnKick:SetVisible( true )
		self.btnBan:SetVisible( true )
		self.btnPBan:SetVisible( true )
	
		self.btnKick:SetPos( self:GetWide() - 175, 85 - (22 * 2) )
		self.btnKick:SetSize( 46, 20 )

		self.btnBan:SetPos( self:GetWide() - 175, 85 - (22 * 1) )
		self.btnBan:SetSize( 46, 20 )
		
		self.btnPBan:SetPos( self:GetWide() - 175, 85 - (22 * 0) )
		self.btnPBan:SetSize( 46, 20 )
	
	end
	
	for k, v in ipairs( self.VoteButtons ) do
	
		v:InvalidateLayout()
		if(k<9) then
			v:SetPos( self:GetWide() -  k * 28, 0 )
		end
		v:SetSize( 20, 32 )
	
	end
	
end

function PANEL:Paint(w,h)
	return true
end


vgui.Register( "suiscoreplayerinfocard", PANEL, "Panel" )