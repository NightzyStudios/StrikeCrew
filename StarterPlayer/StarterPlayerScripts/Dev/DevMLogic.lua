-- Local script that detects when player presses M and fires event to reset money

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ResetMoneyEvent = ReplicatedStorage:WaitForChild("ResetMoney")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.M then
		ResetMoneyEvent:FireServer()
	end
end)
