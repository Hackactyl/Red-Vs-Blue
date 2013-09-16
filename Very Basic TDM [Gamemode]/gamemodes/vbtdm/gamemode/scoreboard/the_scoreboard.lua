if SERVER then
	
else

	SuiScoreBoard = nil
	
	timer.Simple( 1.5, function()
		
		function GAMEMODE:CreateScoreboard()
		
			if ( ScoreBoard ) then
			
				ScoreBoard:Remove()
				ScoreBoard = nil
				
			end
			
			SuiScoreBoard = vgui.Create( "suiscoreboard" )
			
			return true

		end

		function GAMEMODE:ScoreboardShow()
		
			if not SuiScoreBoard then
				self:CreateScoreboard()
			end

			GAMEMODE.ShowScoreboard = true
			gui.EnableScreenClicker( true )

			SuiScoreBoard:SetVisible( true )
			SuiScoreBoard:UpdateScoreboard( true )
			
			return true

		end
		
		function GAMEMODE:ScoreboardHide()
		
			GAMEMODE.ShowScoreboard = false
			gui.EnableScreenClicker( false )

			SuiScoreBoard:SetVisible( false )
			
			return true
			
		end
		
	end )
end