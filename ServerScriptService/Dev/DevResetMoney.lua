-- Server script that listens for a remote event and resets the player's money

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ResetMoneyEvent = Instance.new("RemoteEvent")
ResetMoneyEvent.Name = "ResetMoney"
ResetMoneyEvent.Parent = ReplicatedStorage

ResetMoneyEvent.OnServerEvent:Connect(function(player)
	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end

	local money = stats:FindFirstChild("Money")
	if not money then return end

	money.Value = 3000
	print(player.Name .. "'s money was reset to 3000.")
end)
