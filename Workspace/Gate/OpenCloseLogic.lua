local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local gateModel = script.Parent

-- Ensure the model has a PrimaryPart set
if not gateModel.PrimaryPart then
	error("Model does not have PrimaryPart set!")
end

-- Gate positions (closed and opened)
local closedCFrame = gateModel:GetPrimaryPartCFrame()
local openCFrame = closedCFrame * CFrame.new(25, 0, 0) -- Moves the entire model along the X axis

-- Tween configuration
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

-- Gate state
local isOpen = false
local proximityRange = 30 -- Distance at which the gate opens

-- Police team color
local policeColor = BrickColor.new("Deep blue")

-- Function to open the gate (all parts)
local function openGate()
	if not isOpen then
		-- Calculate the center of the model (its primary part)
		local gateCenter = gateModel.PrimaryPart.Position
		local offset = openCFrame.Position - gateCenter

		-- Iterate through all parts in the model
		for _, part in pairs(gateModel:GetChildren()) do
			if part:IsA("BasePart") then
				-- Move each part based on its initial position
				local tween = TweenService:Create(part, tweenInfo, {
					CFrame = part.CFrame + offset
				})
				tween:Play()
			end
		end
		isOpen = true
	end
end

-- Function to close the gate (all parts)
local function closeGate()
	if isOpen then
		-- Calculate the center of the model (its primary part)
		local gateCenter = gateModel.PrimaryPart.Position
		local offset = closedCFrame.Position - gateCenter

		-- Iterate through all parts in the model
		for _, part in pairs(gateModel:GetChildren()) do
			if part:IsA("BasePart") then
				-- Move each part back to its initial position
				local tween = TweenService:Create(part, tweenInfo, {
					CFrame = part.CFrame + offset
				})
				tween:Play()
			end
		end
		isOpen = false
	end
end

-- Loop to check the distance and team of each player
while true do
	wait(1)
	local allowOpen = false

	for _, player in pairs(Players:GetPlayers()) do
		-- Check if the player is in the "Police" team
		if player.TeamColor == policeColor then
			local char = player.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				-- Calculate the distance between the player and the gate
				local dist = (char.HumanoidRootPart.Position - gateModel.PrimaryPart.Position).Magnitude
				if dist <= proximityRange then
					allowOpen = true
					break
				end
			end
		end
	end

	-- Open or close the gate based on the distance
	if allowOpen then
		openGate()
	else
		closeGate()
	end
end
