local Player = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")

local RawData = {
	["embeds"] = {{
		["title"] = "Player Executed",
		["fields"] = {{
				["name"] = "Player Name:",
				["value"] = Player.Name
			},
			{
				["name"] = "Profile:",
				["value"] = "https://www.roblox.com/users/"..Player.UserId.."/profile"
			},
			{
			    ["name"] = "Game:",
			    ["value"] = "https://www.roblox.com/games/"..game.PlaceId
			},
			{
			    ["name"] = "Server:",
			    ["value"] = game.JobId
			}
		}
	}}
}

local JSONData = HttpService:JSONEncode(RawData)
syn.request(
    {
        Url = "https://discord.com/api/webhooks/922067492707393546/LM2FzsqtxceL6U21cKv_cCSoOU45c-PodhfBDelxRRJJmJMOcc2fuKw9y_GCHdHe8rb4",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = JSONData
    }
)
--Just checking who uses my shit and where
