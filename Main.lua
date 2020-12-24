local library = loadstring(game:HttpGet("https://pastebinp.com/raw/jSZi3y5w", true))()
local window = library:AddWindow("Discord to Roblox Account Checker")
local tab = window:AddTab("Checker")

local console = tab:AddConsole({
    ["y"] = 200,
    ["source"] = "Logs",
    ["readonly"] = true,
    ["full"] = false
})

local box = tab:AddTextBox("Enter DiscordID", function(text)

    local link = "https://verify.eryn.io/api/user/"..text
local anal = game:service("HttpService"):JSONDecode(game:HttpGet(link))
if anal.status:lower() ~= "ok" then
	console:Log("Can`t Find This User")
	console:Log("--------------------------------")
else
	local folowers = game:service("HttpService"):JSONDecode(game:HttpGet("https://friends.roblox.com/v1/users/"..anal.robloxId.."/followers/count"))
	local friends = game:service("HttpService"):JSONDecode(game:HttpGet("https://friends.roblox.com/v1/users/"..anal.robloxId.."/friends/count"))
	local online = game:service("HttpService"):JSONDecode(game:HttpGet("https://api.roblox.com/users/"..anal.robloxId.."/onlinestatus"))
	console:Log("DiscordID: "..text)
    console:Log("Roblox Username: "..anal.robloxUsername)
    console:Log("Roblox ID: "..anal.robloxId)
    console:Log("Profile URL: https://www.roblox.com/users/"..anal.robloxId)
    console:Log("Followers: "..folowers.count)
    console:Log("Friends: "..friends.count)
    console:Log("Online: "..tostring(online.IsOnline))
    if online.IsOnline == true then
    	console:Log("Status: "..online.LastLocation)
    end
    if online.PlaceId ~= nil then
    	console:Log("Place Id: "..online.PlaceId)
    end
    console:Log("--------------------------------")
end
end)
