local DistanceFade = require(script.DistanceFade)

-- initiate a new distancefade using .new() constructor
local distanceFade = DistanceFade.new()
local distanceFadeSettings = {
	["DistanceOuter"] = 36,
	["DistanceInner"] = 4,
	["EffectRadius"] = 20,
	["EffectRadiusMin"] = 16,
	["EdgeDistanceCalculations"] = true,
	["Texture"] = "rbxassetid://18852397345",
	["TextureTransparency"] = 0.65,
	["BackgroundTransparency"] = 0.9,
	["TextureColor"] = Color3.fromRGB(255, 0, 4),
	["BackgroundColor"] = Color3.fromRGB(255, 0, 4),
	["TextureSize"] = Vector2.new(20, 16),
	["TextureOffset"] = Vector2.new(10, 4),
	["Brightness"] = 3,
}
-- update distancefade with initial customization settings
distanceFade:UpdateSettings(distanceFadeSettings)

-- add faces to apply the effect to
local folder = script.Parent
distanceFade:AddFace(folder:WaitForChild("barrier"), Enum.NormalId.Front)
distanceFade:AddFace(folder.barrier, Enum.NormalId.Back)

game:GetService("RunService").Heartbeat:Connect(function()
	distanceFade:Step()
end)
