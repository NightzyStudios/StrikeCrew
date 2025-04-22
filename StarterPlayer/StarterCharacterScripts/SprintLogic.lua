-- Get the UserInputService and the local player
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

-- Get the character (or wait until it loads) and access the Humanoid
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Store default and sprint walk speeds
local normalWalkSpeed = humanoid.WalkSpeed
local sprintWalkSpeed = 36

-- When Left Shift is pressed, increase walk speed to sprint speed
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift and not gameProcessed then
		humanoid.WalkSpeed = sprintWalkSpeed
	end
end)

-- When Left Shift is released, reset walk speed to normal
UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = normalWalkSpeed
	end
end)
