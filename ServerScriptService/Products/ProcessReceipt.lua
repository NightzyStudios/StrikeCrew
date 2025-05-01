local MarketPlaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local player = game.Players.LocalPlayer

local productFunctions = {}

-- 100,000 Cash
productFunctions[3277214179] = function(receipt, player)
	local stats = player:FindFirstChild("leaderstats")
	if stats then
		local cash = stats:FindFirstChild("Money")
		if cash and cash:IsA("IntValue") then
			cash.Value = cash.Value + 100000
			return true
		end
	end
	return false
end

-- 250,000 Cash
productFunctions[3277254882] = function(receipt, player)
	local stats = player:FindFirstChild("leaderstats")
	if stats then
		local cash = stats:FindFirstChild("Money")
		if cash and cash:IsA("IntValue") then
			cash.Value = cash.Value + 250000
			return true
		end
	end
	return false
end

-- 1,000,000 Cash
productFunctions[3277256763] = function(receipt, player)
	local stats = player:FindFirstChild("leaderstats")
	if stats then
		local cash = stats:FindFirstChild("Money")
		if cash and cash:IsA("IntValue") then
			cash.Value = cash.Value + 1000000
			return true
		end
	end
	return false
end

-- Handler for processing purchases
MarketPlaceService.ProcessReceipt = function(receiptInfo)
	local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		-- Player not found, try again later
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local handler = productFunctions[receiptInfo.ProductId]
	if handler then
		local success = handler(receiptInfo, player)
		if success then
			return Enum.ProductPurchaseDecision.PurchaseGranted
		else
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
	end

	return Enum.ProductPurchaseDecision.PurchaseGranted
end