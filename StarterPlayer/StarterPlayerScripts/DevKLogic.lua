-- Get the UserInputService to detect player inputs (keyboard, mouse, etc.)
local UserInputService = game:GetService("UserInputService")

-- Get the RemoteEvent named "AddMoney" from ReplicatedStorage
local AddMoneyEvent = game.ReplicatedStorage:WaitForChild("AddMoney")

-- Listen for when the player starts pressing a key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	
	-- If the input is processed by the game (like opening the menu), do nothing
	if gameProcessed then return end

	-- Check if the pressed key is the 'K' key
	if input.KeyCode == Enum.KeyCode.K then
		-- Fire the "AddMoney" event to the server to add money to the player
		AddMoneyEvent:FireServer()
	end
end)
