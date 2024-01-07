local startScreen = script.Parent.Parent
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local TweenService = game:GetService("TweenService")

local playerScripts = localPlayer:WaitForChild("PlayerScripts")
local playerModule = require(playerScripts:WaitForChild("PlayerModule"))
local controls = playerModule:GetControls()


startScreen.Enabled = true
controls:Disable() 


function playButton()
	startScreen.playButton:TweenPosition(UDim2.new(0.415, 0, 1, 0), "InOut", "Quad", 1, true)
	wait(0.1)
	startScreen.title:TweenPosition(UDim2.new(0.415, 0, 1, 0), "InOut", "Quad", 1, true)
	wait(0.25)
	startScreen.background:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quad", 1, true)

	
	wait(1)
	
	startScreen.Enabled = false
	controls:Enable()
end

script.Parent.MouseButton1Click:Connect(playButton)
