local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local localRootPart = localCharacter:WaitForChild("HumanoidRootPart")
local localHumanoid = localCharacter:WaitForChild("Humanoid")

localPlayer.CharacterAdded:Connect(function(character)
    localCharacter = character
    localRootPart = localCharacter:WaitForChild("HumanoidRootPart")
    localHumanoid = localCharacter:WaitForChild("Humanoid")
end)

local mobsFolder = workspace.Mobs
local mobsTable = {}
local target = nil
local active = false
local tool = nil

local function lookForBestSword()
    local backpack = localPlayer:WaitForChild("Backpack")
    local bestWorth = nil
    local bestPick = nil
    
    for _, sword in ipairs(backpack:GetChildren()) do
        if sword:IsA("Tool") and sword:FindFirstChildWhichIsA("Configuration") then
            local worth = sword.Config:FindFirstChild("Worth")
            if bestWorth then
                if worth.Value > bestWorth.Value then
                    bestWorth = worth
                end
            else
                bestWorth = worth
            end
        end
    end
    
    if bestWorth then
        bestPick = bestWorth.Parent.Parent
    end
    
    return bestPick
end

tool = lookForBestSword()

UserInputService.InputBegan:Connect(function(input, typing)
    if not typing then
        if input.KeyCode == Enum.KeyCode.E then
            if active then
                active = false
            else
                active = true
            end
        end
    end
end)

RunService.Stepped:Connect(function()
    if target and active then
        localRootPart.CFrame = target.CFrame * CFrame.new(0, 0, 3.5)
        if localCharacter:FindFirstChildWhichIsA("Tool") then
            mouse1click()
        else
            if localHumanoid and tool then
                localHumanoid:EquipTool(tool)
            elseif not tool or not tool.Parent then
                tool = lookForBestSword()
            end
        end
    end
end)

for _, mob in ipairs(mobsFolder:GetChildren()) do
    if mob:FindFirstChild("HumanoidRootPart") then
        mobsTable[mob] = mob
    end
end

mobsFolder.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "HumanoidRootPart" then
        mobsTable[descendant.Parent] = descendant.Parent
    end
end)

mobsFolder.ChildRemoved:Connect(function(child)
    if mobsTable[child] then
        mobsTable[child] = nil
    end
end)

while true do
    for _, mob in pairs(mobsTable) do
        if mob:FindFirstChild("HumanoidRootPart") then
            local humanoid = mob:FindFirstChild("Humanoid")
            target = mob.HumanoidRootPart
            while true do
               if not humanoid or humanoid.Health == 0 then
                    target = nil
                    break
                end
                wait()
            end
        end
    end
    wait()
end
