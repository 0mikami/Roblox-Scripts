local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local CarnageGUI = Instance.new("ScreenGui")
CarnageGUI.IgnoreGuiInset = true
CarnageGUI.Name = "random"
CarnageGUI.ResetOnSpawn = false
CarnageGUI.Parent = CoreGui

local function MainBox()
	local MainBox = Instance.new("Frame")
	MainBox.Name = "MainBox"
	MainBox.AnchorPoint = Vector2.new(0.5, 0.5)
	MainBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainBox.BorderSizePixel = 0
	MainBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainBox.Size = UDim2.new(0, 800, 0, 500)
	MainBox.Parent = CarnageGUI

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = MainBox

	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.AnchorPoint = Vector2.new(0.5, 0)
	TopBar.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.5, 0, 0, 0)
	TopBar.Size = UDim2.new(1, 0, 0, 25)
	TopBar.Parent = MainBox

	local UICorner2 = Instance.new("UICorner")
	UICorner2.CornerRadius = UDim.new(0, 5)
	UICorner2.Parent = TopBar

	local OpenButton = Instance.new("TextButton")
	OpenButton.Name = "OpenButton"
	OpenButton.AnchorPoint = Vector2.new(1, 0.5)
	OpenButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	OpenButton.BackgroundTransparency = 1
	OpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OpenButton.BorderSizePixel = 0
	OpenButton.Position = UDim2.new(1, 0, 0.5, 0)
	OpenButton.Size = UDim2.new(1, 0, 1, 0)
	OpenButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
	OpenButton.Font = Enum.Font.Arial
	OpenButton.Text = "+"
	OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	OpenButton.TextScaled = true
	OpenButton.TextSize = 15
	OpenButton.TextStrokeTransparency = 0
	OpenButton.TextWrapped = true
	OpenButton.Parent = TopBar

	return MainBox
end
