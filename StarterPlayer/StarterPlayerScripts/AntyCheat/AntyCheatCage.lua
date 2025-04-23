local player = game:GetService("Players")
local localPlayer = player.LocalPlayer

-- Wait until the character is loaded
repeat wait() until localPlayer.Character
local character = localPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

-- Define the spawn cage position
local spawnCage = game.Workspace:WaitForChild("CheatCageBottom")

-- Check if the spawnCage exists, otherwise print a warning
if not spawnCage then
	warn("CheatCageBottom not found in Workspace!")
	return
end

-- Ensure PrimaryPart is set for character
if not character:FindFirstChild("HumanoidRootPart") then
	warn("HumanoidRootPart not found. Please ensure it's set as PrimaryPart for teleportation.")
	return
end

-- Correct values for WalkSpeed and JumpPower
local correctWalkSpeed = 32
local correctJumpPower = 50

-- Flag to check if teleportation is needed
local needsTeleportation = true

-- Check player stats at a regular interval (e.g., every 1 second)
while true do
	wait(1)  -- Increased wait time to reduce strain on the server

	-- If WalkSpeed is not correct, teleport player to the spawn cage
	if humanoid.WalkSpeed ~= correctWalkSpeed then
		if needsTeleportation then
			-- Teleport to cheat cage
			character:SetPrimaryPartCFrame(CFrame.new(spawnCage.Position))
			print("WalkSpeed is not correct. Teleporting to cheat cage.")
			needsTeleportation = false  -- Prevent further teleportation until we re-check
		end
	end

	-- If JumpPower is not correct, teleport player to the spawn cage
	if humanoid.JumpPower ~= correctJumpPower then
		if needsTeleportation then
			-- Teleport to cheat cage
			character:SetPrimaryPartCFrame(CFrame.new(spawnCage.Position))
			print("JumpPower is not correct. Teleporting to cheat cage.")
			needsTeleportation = false  -- Prevent further teleportation until we re-check
		end
	end

	-- Check if both WalkSpeed and JumpPower are correct
	if humanoid.WalkSpeed == correctWalkSpeed and humanoid.JumpPower == correctJumpPower then
		print("Player stats are correct.")
		needsTeleportation = true  -- Re-enable teleportation if values are corrected
	end
end
