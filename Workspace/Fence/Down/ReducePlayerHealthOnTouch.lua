-- Reference to the part this script is attached to
local part = script.Parent

-- Connects a function to the 'Touched' event of the part
part.Touched:Connect(function(hit)
	-- Tries to find a Humanoid in the parent of the object that touched the part
	local humanoid = hit.Parent:FindFirstChild("Humanoid")

	-- If a Humanoid is found, reduce its health by 0.5
	if humanoid then
		humanoid.Health = humanoid.Health - 0.5
	end
end)
