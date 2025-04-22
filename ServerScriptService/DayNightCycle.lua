local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- Time settings (in seconds of real time)
-- Day = 12 in-game hours spread over 5 real minutes (300 seconds)
-- Night = 12 in-game hours spread over 2.5 real minutes (150 seconds)
local dayDuration = 300
local nightDuration = 150
local fullDayCycle = 24 -- 24 in-game hours

-- Calculates how much in-game time should pass each frame,
-- based on whether it's currently day or night
local function getTimeStep(currentTime)
	if currentTime >= 6 and currentTime < 18 then
		-- From 6 to 18 (daytime), pass 12 in-game hours in 300 seconds
		return 12 / dayDuration * RunService.Heartbeat:Wait()
	else
		-- From 18 to 6 (nighttime), pass 12 in-game hours in 150 seconds
		return 12 / nightDuration * RunService.Heartbeat:Wait()
	end
end

-- Updates the Lighting.ClockTime every frame to simulate smooth time progression
local function updateTime()
	local currentTime = Lighting.ClockTime
	local step = getTimeStep(currentTime)

	local newTime = currentTime + step
	if newTime >= fullDayCycle then
		newTime -= fullDayCycle -- Wrap around once it passes 24 hours
	end

	Lighting.ClockTime = newTime
end

-- Connect the updateTime function to the Heartbeat event (runs every frame)
RunService.Heartbeat:Connect(updateTime)
