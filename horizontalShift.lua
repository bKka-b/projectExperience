local ts = game:GetService("TweenService")
local weld1 = script.Parent.Flowerline1.positioner
local weld3 = script.Parent.Flowerline3.positioner
local endPos1 = script.Parent.Flowerline1.endPos
local endPos3 = script.Parent.Flowerline3.endPos
local run = true


local function moveItem(item, wp)
	local ti = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0)
	--local partProp = { Position = wp.Position }
	local partProp = {CFrame = wp.CFrame }
	local tween = ts:Create(item, ti, partProp)
	
	tween:Play()
	wait(2)
end

while run do
moveItem(weld1, endPos1)
moveItem(weld3, endPos3)
	
	wait(7)
end