if not(CLIENT) then return end
local function UmsgError(data)
	chat.AddText(Color(255,0,0),data:ReadString())
end

usermessage.Hook("Error",UmsgError)

local function UmsgSuccess(data)
	chat.AddText(Color(0,127,0),data:ReadString())
end

usermessage.Hook("Success",UmsgSuccess)