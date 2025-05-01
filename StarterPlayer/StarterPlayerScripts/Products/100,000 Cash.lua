local MarketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer
local productId = 3277254882

task.wait(2)
MarketPlaceService:PromptProductPurchase(player, productId)