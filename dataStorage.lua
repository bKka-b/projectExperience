local DataStorageService = game:GetService("DataStoreService")
local RunService = game:GetService("RunService")
local players = game:GetService("Players")
local teams = game:GetService("Teams")
local dataBase = DataStorageService:GetDataStore("Data")
local sessionData = {}


local function onPlayerJoin(player)
	local leaderStats = Instance.new("Folder")
	leaderStats.Name = "leaderStats"
	leaderStats.Parent = player
	
	local stageNum = Instance.new("StringValue")
	stageNum.Name = "stageNum"
	stageNum.Parent = leaderStats
	
	
	local success = nil
	local playerData = nil
	local attempt = 1
	
	repeat
		success, playerData = pcall(function()
			return dataBase:GetAsync(player.UserId)
		end)
		attempt += 1
		if not success then
			warn(playerData)
			task.wait(3)
		end

	until success or attempt == 5
	
	if success then
		print("Connected to database")
		if not playerData then
			print("Assigning default data")
			playerData = {
				["stageNum"] = "Stage1",
			}
		end
		sessionData[player.UserId] = playerData
	else
		warn("Unable to get data for ", player.UserId)
		player:Kick("Unable to load your data. Try again later.")
	end
	
	stageNum.Value = sessionData[player.UserId].stageNum
	stageNum.Changed:Connect(function()
		sessionData[player.UserId].stageNum = stageNum.Value
	end)
	player:GetPropertyChangedSignal("Team"):Connect(function()
		stageNum.Value = player.Team.Name
		print("Checkpoint saved.")
	end)
	player.Team = game.Teams[stageNum.Value]

end


local function playerLeaving(player)
	if sessionData[player.UserId] then
		local success = nil
		local errorMsg = nil
		local attempt = 1
		
	repeat
		success, errorMsg = pcall(function()
			dataBase:SetAsync(player.UserId, sessionData[player.UserId])
		end)
			attempt += 1
			if not success then
				warn(errorMsg)
				task.wait(3)
			end
			
	until success or attempt == 5
		if success then
			print("Data saved for ", player.Name)
		else
			warn("Unable to save for ", player.Name)
		end
		
	end
end

function ServerShutdown()
	if RunService:IsStudio() then
		return
	end
	
	print("Server shutting down..")
	for i, player in ipairs(game.Players:GetPlayers()) do
		task.spawn(function()
			playerLeaving(player)
		end)
	end
end


game.Players.PlayerAdded:Connect(onPlayerJoin)
game.Players.PlayerRemoving:Connect(playerLeaving)
game:BindToClose(ServerShutdown)