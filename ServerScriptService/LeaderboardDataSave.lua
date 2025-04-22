-- Get access to Roblox DataStore service and the specific DataStore for player money
local DataStoreService = game:GetService("DataStoreService")
local MoneyDataStore = DataStoreService:GetDataStore("PlayerMoney")

-- This function runs when a player joins the game
game.Players.PlayerAdded:Connect(function(player)

	-- Create the "leaderstats" folder and the "Money" IntValue for tracking money
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 3000 -- Default starting value for money
	money.Parent = leaderstats

	-- Try to load the player's saved money value from the DataStore
	local success, result = pcall(function()
		return MoneyDataStore:GetAsync(player.UserId .. "-money")
	end)

	-- If data was loaded successfully, set the player's money value, else print an error
	if success and result ~= nil then
		money.Value = result
	elseif not success then
		warn("Error loading data: " .. result)
	end

	-- Store the last saved value to check for changes in money
	local lastSavedValue = money.Value

	-- Start a background task to check for changes in money value and auto-save every second
	task.spawn(function()
		while player.Parent do
			task.wait(1) -- Check every second

			-- Save if the money value has changed since the last save
			if money.Value ~= lastSavedValue then
				local saveSuccess, saveError = pcall(function()
					MoneyDataStore:SetAsync(player.UserId .. "-money", money.Value)
				end)

				-- If save succeeds, update last saved value and print confirmation, else show an error
				if saveSuccess then
					lastSavedValue = money.Value
					print("Money auto-saved:", money.Value)
				else
					warn("Auto-save error: " .. saveError)
				end
			end
		end
	end)
end)

-- This function runs when a player leaves the game and saves their money
game.Players.PlayerRemoving:Connect(function(player)
	-- Try to save the player's money one last time before they leave
	local success, errorMessage = pcall(function()
		MoneyDataStore:SetAsync(player.UserId .. "-money", player.leaderstats.Money.Value)
	end)

	-- If saving fails, print an error message
	if not success then
		warn("Error saving data on leave: " .. errorMessage)
	end
end)
