local MarketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer
local productId = 3277256763

task.wait(10)
MarketPlaceService:PromptProductPurchase(player, productId)