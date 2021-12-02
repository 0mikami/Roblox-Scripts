local WorkSpace = game:GetService("Workspace")
local Players = game:GetService("Players")

local function CreateUltMeter(Character)
    local RootPart = Character:WaitForChild("HumanoidRootPart")
    local Charge = Character:WaitForChild("Charge")

    if Character:FindFirstChild("UltMeter") then
        return
    end
    
    local UltGUI = Instance.new("BillboardGui")
    UltGUI.Name = "UltMeter"
    UltGUI.Adornee = RootPart
    UltGUI.AlwaysOnTop = true
    UltGUI.ResetOnSpawn = false
    UltGUI.Size = UDim2.new(0,200,0,10)
    UltGUI.StudsOffset = Vector3.new(0,-3,0)
    UltGUI.Parent = Character
    
    local UltFrame = Instance.new("Frame")
    UltFrame.AnchorPoint = Vector2.new(0.5,0.5)
    UltFrame.BorderSizePixel = 0
    UltFrame.Position = UDim2.new(0.5,0,0.5,0)
    UltFrame.Size = UDim2.new(1,0,1,0)
    UltFrame.Parent = UltGUI
    Instance.new("UICorner").Parent = UltFrame
    
    local UltBar = Instance.new("Frame")
    UltBar.AnchorPoint = Vector2.new(0,0.5)
    UltBar.BackgroundColor3 = Color3.new(0,1,0)
    UltBar.BorderSizePixel = 0
    UltBar.Position = UDim2.new(0,0,0.5,0)
    UltBar.Size = UDim2.new(Charge.Value/100,0,1,0)
    UltBar.Parent = UltFrame
    Instance.new("UICorner").Parent = UltBar
    
    Charge.Changed:Connect(function()
        UltBar.Size = UDim2.new(Charge.Value/100,0,1,0)
        if Charge.Value/100 == 1 then
            UltBar.BackgroundColor3 = Color3.new(1,0,0)
        else
            UltBar.BackgroundColor3 = Color3.new(0,1,0)
        end
    end)
end

for i,v in pairs(Players:GetPlayers()) do
    if WorkSpace[v.Name] then
        CreateUltMeter(WorkSpace[v.Name])
    end
end

Players.PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Character)
        CreateUltMeter(Character)
    end)
end)