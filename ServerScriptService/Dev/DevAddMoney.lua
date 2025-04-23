-- Get the RemoteEvent named "AddMoney" from ReplicatedStorage
local AddMoneyEvent = game.ReplicatedStorage:WaitForChild("AddMoney")

-- Listen for when the event is fired from the client
AddMoneyEvent.OnServerEvent:Connect(function(player)

	-- Find the "leaderstats" folder in the player
	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end -- If "leaderstats" does not exist, do nothing

	-- Find the "Money" value inside the leaderstats folder
	local money = stats:FindFirstChild("Money")
	if not money then return end -- If "Money" does not exist, do nothing

	-- Increase the player's money by 1000
	money.Value += 1000
	
	-- Print the updated money value to the output for confirmation
	print(player.Name .. " added 1000$ — new balance: " .. money.Value)
end)
