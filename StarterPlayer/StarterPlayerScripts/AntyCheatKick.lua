local player = game:GetService("Players")
local localPlayer = player.LocalPlayer

-- Wait until the character is loaded
repeat wait() until localPlayer.Character
local humanoid = localPlayer.Character:WaitForChild("Humanoid")

-- Check player stats at a regular interval (e.g., every 0.5 seconds)
while true do
	wait(0.5)  -- Adjusted wait time to optimize performance

	-- If Humanoid or its properties are not available, skip this iteration
	if not humanoid or not humanoid.Parent then
		continue
	end

	-- Check if WalkSpeed and JumpPower are within expected limits
	if humanoid.WalkSpeed > 32 or humanoid.JumpPower > 50 then
		-- Print for debugging purposes to show current values
		print("Suspicious values detected! WalkSpeed:", humanoid.WalkSpeed, "JumpPower:", humanoid.JumpPower)

		-- Forcefully kick the player for exploiting
		localPlayer:Kick("Exploiting! WalkSpeed or JumpPower exceeded limits.")
		break  -- Exit the loop after kicking the player
	end
end
