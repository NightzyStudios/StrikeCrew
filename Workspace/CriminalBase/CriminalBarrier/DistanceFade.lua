--[[
    HOW TO USE:
    As this is a client-side only effect, the module must be called from a local script or a script using the client run context
	To apply the effect to a part, it must be a BasePart

    1.
]]

local DistanceFade = {}
DistanceFade.__index = DistanceFade

-- default settings, can be overriden with custom settings by using UpdateSettings()
local DEFAULT_SETTINGS = {
	["DistanceOuter"] = 16, -- Distance at which the effect starts to appear
	["DistanceInner"] = 4, -- Distance at which the effect is fully visible
	["EffectRadius"] = 16, -- Size of the effect when in range
	["EffectRadiusMin"] = 0, -- Size of the effect when out of range
	["EdgeDistanceCalculations"] = false, -- * When set to true, distance to target is calculated from the face edges rather than the face itself. Can be more accurate in certain cases
	["Texture"] = "rbxassetid://18838056070", -- TextureId
	["TextureTransparency"] = 0, -- Transparency of the texture when in range
	["TextureTransparencyMin"] = 1, -- Transparency of the texture when out of range
	["BackgroundTransparency"] = 1, -- Transparency of the texture background when in range
	["BackgroundTransparencyMin"] = 1, -- Transparency of the texture background when out of range
	["TextureColor"] = Color3.fromRGB(255, 255, 255), -- Color of the texture
	["BackgroundColor"] = Color3.fromRGB(255, 255, 255), -- Color of the texture background
	["TextureSize"] = Vector2.new(8, 8), -- Size of the texture in studs per tile. Can potentially cause clipping issues if greater than EffectRadius * 2
	["TextureOffset"] = Vector2.new(0, 0), -- Texture offset in studs
}
