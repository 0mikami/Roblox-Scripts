local CarnageLibrary = {}

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local CarnageGUI = Instance.new("ScreenGui")
CarnageGUI.IgnoreGuiInset = true
CarnageGUI.Name = "random"
CarnageGUI.ResetOnSpawn = false
CarnageGUI.Parent = PlayerGui

function CarnageLibrary:MainBox()
	local MainBox = Instance.new("Frame")
	MainBox.Name = "MainBox"
	MainBox.AnchorPoint = Vector2.new(0.5, 0.5)
	MainBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainBox.BorderSizePixel = 0
	MainBox.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainBox.Size = UDim2.new(0, 800, 0, 600)
	MainBox.Parent = CarnageGUI

	local MainBoxCorner = Instance.new("UICorner")
	MainBoxCorner.CornerRadius = UDim.new(0, 10)
	MainBoxCorner.Parent = MainBox

	local TopBar = Instance.new("Frame")
	TopBar.Name = "TopBar"
	TopBar.AnchorPoint = Vector2.new(0.5, 0)
	TopBar.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.5, 0, 0, 0)
	TopBar.Size = UDim2.new(1, 0, 0, 25)
	TopBar.Parent = MainBox

	local TopBarCorner = Instance.new("UICorner")
	TopBarCorner.CornerRadius = UDim.new(0, 5)
	TopBarCorner.Parent = TopBar
	
	local TitleText = Instance.new("TextLabel")
	TitleText.Name = "TitleText"
	TitleText.AnchorPoint = Vector2.new(0, 0.5)
	TitleText.AutomaticSize = Enum.AutomaticSize.X
	TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.BackgroundTransparency = 1.000
	TitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleText.BorderSizePixel = 0
	TitleText.Position = UDim2.new(0, 0, 0.5, 0)
	TitleText.Size = UDim2.new(0, 0, 1, 0)
	TitleText.Font = Enum.Font.Arial
	TitleText.Text = "CARNAGE"
	TitleText.TextColor3 = Color3.fromRGB(0, 255, 0)
	TitleText.TextScaled = true
	TitleText.TextSize = 15.000
	TitleText.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.TextWrapped = true
	TitleText.Parent = TopBar
	
	local TitleTextPadding = Instance.new("UIPadding")
	TitleTextPadding.PaddingBottom = UDim.new(0, 5)
	TitleTextPadding.PaddingLeft = UDim.new(0, 5)
	TitleTextPadding.PaddingRight = UDim.new(0, 5)
	TitleTextPadding.PaddingTop = UDim.new(0, 5)
	TitleTextPadding.Parent = TitleText
		
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
	
	local NavigationBar = Instance.new("Frame")
	NavigationBar.Name = "NavigationBar"
	NavigationBar.AnchorPoint = Vector2.new(0.5, 0)
	NavigationBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NavigationBar.BackgroundTransparency = 1.000
	NavigationBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NavigationBar.BorderSizePixel = 0
	NavigationBar.Position = UDim2.new(0.5, 0, 0, 30)
	NavigationBar.Size = UDim2.new(1, -5, 0, 30)
	NavigationBar.Parent = MainBox
	
	TopBar.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			local RelativeXPosition = (Input.Position.X - MainBox.AbsolutePosition.X) / MainBox.Size.X.Offset
			local RelativeYPosition = (Input.Position.Y - MainBox.AbsolutePosition.Y) / MainBox.Size.Y.Offset
			
			MainBox.AnchorPoint = Vector2.new(RelativeXPosition,RelativeYPosition)
			
			RunService:BindToRenderStep("MoveGuiToMouse",10,function()
				local MouseLocation = UserInputService:GetMouseLocation()
				
				MainBox.Position = UDim2.fromOffset(MouseLocation.X,MouseLocation.Y)
			end)
		end
	end)
	TopBar.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			RunService:UnbindFromRenderStep("MoveGuiToMouse")
		end
	end)
	
	return MainBox
end

return CarnageLibrary
