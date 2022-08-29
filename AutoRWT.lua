local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

local sellEvent = ReplicatedStorage:WaitForChild("Knit")
	:WaitForChild("Services")
	:WaitForChild("TycoonService")
	:WaitForChild("RE")
	:WaitForChild("SellRats")

local tycoonFolder = workspace:WaitForChild("Tycoons")

local isOn = true

player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	rootPart = character:WaitForChild("HumanoidRootPart")
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.E then
		isOn = not isOn
	end
end)

for _, tycoon in ipairs(tycoonFolder:GetChildren()) do
	local ratFolder = tycoon:FindFirstChild("Rats")

	if ratFolder then
		coroutine.wrap(function()
			while true do
				if isOn then
					for _, rat in ipairs(ratFolder:GetChildren()) do
						while rat:FindFirstAncestor("Rats") do
							rootPart.CFrame = rat.PrimaryPart.CFrame
							sellEvent:FireServer()
							task.wait()
						end
					end
				end

				task.wait()
			end
		end)()
	end
end
