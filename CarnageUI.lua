local CarnageLibrary = {}

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local CarnageGUI = Instance.new("ScreenGui")
CarnageGUI.IgnoreGuiInset = true
CarnageGUI.Name = HttpService:GenerateGUID()
CarnageGUI.ResetOnSpawn = false
CarnageGUI.Parent = CoreGui

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
	
	local NavigationBarListLayout = Instance.new("UIListLayout")
	NavigationBarListLayout.FillDirection = Enum.FillDirection.Horizontal
	NavigationBarListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	NavigationBarListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	NavigationBarListLayout.Padding = UDim.new(0, 5)
	NavigationBarListLayout.Parent = NavigationBar
	
	local CurrentPage = Instance.new("ObjectValue")
	CurrentPage.Name = "CurrentPage"
	CurrentPage.Value = nil
	CurrentPage.Parent = MainBox
	
	CurrentPage.Changed:Connect(function(Value)
		CurrentPage.Value.Visible = true
	end)
	
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

function CarnageLibrary:NewPage()
	local PageFrame = Instance.new("Frame")
	PageFrame.AnchorPoint = Vector2.new(0.5, 1)
	PageFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	PageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PageFrame.BorderSizePixel = 0
	PageFrame.Position = UDim2.new(0.5, 0, 1, -5)
	PageFrame.Visible = false
	PageFrame.Size = UDim2.new(1, -10, 1, -70)
	
	local SectionPadding = Instance.new("UIPadding")
	SectionPadding.PaddingBottom = UDim.new(0, 10)
	SectionPadding.PaddingLeft = UDim.new(0, 10)
	SectionPadding.PaddingRight = UDim.new(0, 10)
	SectionPadding.PaddingTop = UDim.new(0, 10)
	SectionPadding.Parent = PageFrame

	local SectionListLayout = Instance.new("UIListLayout")
	SectionListLayout.FillDirection = Enum.FillDirection.Horizontal
	SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SectionListLayout.Padding = UDim.new(0, 10)
	SectionListLayout.Parent = PageFrame
	
	local PageButton = Instance.new("TextButton")
	PageButton.Name = "PageButton"
	PageButton.AnchorPoint = Vector2.new(0, 0.5)
	PageButton.AutomaticSize = Enum.AutomaticSize.X
	PageButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	PageButton.BackgroundTransparency = 1
	PageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PageButton.BorderSizePixel = 0
	PageButton.Position = UDim2.new(0, 0, 0.5, 0)
	PageButton.Size = UDim2.new(0, 0, 1, 0)
	PageButton.AutoButtonColor = false
	PageButton.Font = Enum.Font.Arial
	PageButton.Text = "Page"
	PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PageButton.TextSize = 14.000
	PageButton.TextStrokeTransparency = 0.000
	
	local PageButtonCorner = Instance.new("UICorner")
	PageButtonCorner.CornerRadius = UDim.new(0, 10)
	PageButtonCorner.Parent = PageButton
	
	local PageButtonPadding = Instance.new("UIPadding")
	PageButtonPadding.PaddingLeft = UDim.new(0, 5)
	PageButtonPadding.PaddingRight = UDim.new(0, 5)
	PageButtonPadding.Parent = PageButton
	
	local PageButtonPointer = Instance.new("ObjectValue")
	PageButtonPointer.Name = "PageButton"
	PageButtonPointer.Value = PageButton
	PageButtonPointer.Parent = PageFrame
	
	PageButton.MouseButton1Click:Connect(function()
		local MainBox = CarnageGUI:FindFirstChild("MainBox")
		local CurrentPage = MainBox:FindFirstChild("CurrentPage")
		
		if CurrentPage.Value then
			local CurrentPageButton = CurrentPage.Value:FindFirstChild("PageButton")
			CurrentPageButton.Value.BackgroundTransparency = 1
			CurrentPage.Value.Visible = false
		end
		
		PageButton.BackgroundTransparency = 0
		CurrentPage.Value = PageFrame
	end)
	
	return PageFrame,PageButton
end

function CarnageLibrary:NewSection()
	local Section = Instance.new("ScrollingFrame")
	Section.Active = true
	Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Section.BackgroundTransparency = 1.000
	Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Section.BorderSizePixel = 0
	Section.Size = UDim2.new(0, 250, 1, 0)
	Section.CanvasSize = UDim2.new(0, 0, 0, 0)
	Section.ScrollBarThickness = 0
	Section.ScrollingDirection = Enum.ScrollingDirection.Y
	
	local SectionListLayout = Instance.new("UIListLayout")
	SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SectionListLayout.Padding = UDim.new(0, 10)
	SectionListLayout.Parent = Section
	
	return Section
end

function CarnageLibrary:NewFeature()
	local FeatureFrame = Instance.new("Frame")
	FeatureFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	FeatureFrame.AutomaticSize = Enum.AutomaticSize.Y
	FeatureFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	FeatureFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FeatureFrame.ClipsDescendants = true
	FeatureFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	FeatureFrame.Size = UDim2.new(0, 250, 0, 25)

	local FeaturePadding = Instance.new("UIPadding")
	FeaturePadding.PaddingBottom = UDim.new(0, 10)
	FeaturePadding.PaddingLeft = UDim.new(0, 10)
	FeaturePadding.PaddingRight = UDim.new(0, 10)
	FeaturePadding.PaddingTop = UDim.new(0, 10)
	FeaturePadding.Parent = FeatureFrame

	local FeatureListLayout = Instance.new("UIListLayout")
	FeatureListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	FeatureListLayout.Padding = UDim.new(0, 10)
	FeatureListLayout.Parent = FeatureFrame
	
	local FeatureTitle = Instance.new("TextLabel")
	FeatureTitle.Name = "FeatureTitle"
	FeatureTitle.AnchorPoint = Vector2.new(0.5, 0)
	FeatureTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FeatureTitle.BackgroundTransparency = 1.000
	FeatureTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FeatureTitle.BorderSizePixel = 0
	FeatureTitle.Size = UDim2.new(1, 0, 0, 16)
	FeatureTitle.Font = Enum.Font.SourceSans
	FeatureTitle.Text = "TITLE"
	FeatureTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	FeatureTitle.TextSize = 15.000
	FeatureTitle.TextStrokeTransparency = 0.500
	FeatureTitle.Parent = FeatureFrame

	return FeatureFrame, FeatureTitle
end

function CarnageLibrary:NewButton()
	local Button = Instance.new("TextButton")
	Button.Name = "Button"
	Button.Active = false
	Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Size = UDim2.new(1, 0, 0, 16)
	Button.Font = Enum.Font.SourceSans
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextSize = 16.000
	Button.TextStrokeTransparency = 0.500
	Button.TextXAlignment = Enum.TextXAlignment.Left
	
	local CheckboxFrame = Instance.new("Frame")
	CheckboxFrame.Name = "CheckboxFrame"
	CheckboxFrame.AnchorPoint = Vector2.new(1, 0.5)
	CheckboxFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	CheckboxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckboxFrame.BorderSizePixel = 0
	CheckboxFrame.Position = UDim2.new(1, 0, 0.5, 0)
	CheckboxFrame.Size = UDim2.new(1, 0, 1, 0)
	CheckboxFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CheckboxFrame.Parent = Button
	
	local CheckboxFrameCorner = Instance.new("UICorner")
	CheckboxFrameCorner.CornerRadius = UDim.new(1, 0)
	CheckboxFrameCorner.Parent = CheckboxFrame
	
	local Check = Instance.new("Frame")
	Check.Name = "Check"
	Check.AnchorPoint = Vector2.new(0.5, 0.5)
	Check.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Check.BorderSizePixel = 0
	Check.Position = UDim2.new(0.5, 0, 0.5, 0)
	Check.Size = UDim2.new(0.5, 0, 0.5, 0)
	Check.Transparency = 1
	Check.Parent = CheckboxFrame
	
	local CheckCorner = Instance.new("UICorner")
	CheckCorner.CornerRadius = UDim.new(1, 0)
	CheckCorner.Parent = Check
	
	local ButtonActive = Instance.new("BoolValue")
	ButtonActive.Name = "ButtonActive"
	ButtonActive.Value = false
	ButtonActive.Parent = Button
	
	Button.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			if ButtonActive.Value then
				ButtonActive.Value = false
				Check.Transparency = 1
			else
				ButtonActive.Value = true
				Check.Transparency = 0
			end
		end
	end)
	
	return Button, ButtonActive
end

function CarnageLibrary:NewSlider()
	local SliderFrame = Instance.new("Frame")
	SliderFrame.Name = "SliderFrame"
	SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderFrame.BorderSizePixel = 0
	SliderFrame.Size = UDim2.new(1, 0, 0, 16)
	
	local SliderFrameCorner = Instance.new("UICorner")
	SliderFrameCorner.CornerRadius = UDim.new(0.25, 0)
	SliderFrameCorner.Parent = SliderFrame
	
	local SliderText = Instance.new("TextLabel")
	SliderText.Name = "SliderText"
	SliderText.AnchorPoint = Vector2.new(0.5, 0.5)
	SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderText.BackgroundTransparency = 1.000
	SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderText.BorderSizePixel = 0
	SliderText.Position = UDim2.new(0.5, 0, 0.5, 0)
	SliderText.Size = UDim2.new(1, 0, 1, 0)
	SliderText.Font = Enum.Font.Arial
	SliderText.Text = "Placeholder"
	SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
	SliderText.TextSize = 15.000
	SliderText.TextStrokeTransparency = 0.500
	SliderText.ZIndex = 2
	SliderText.Parent = SliderFrame
	
	local SliderBar = Instance.new("Frame")
	SliderBar.Name = "SliderBar"
	SliderBar.AnchorPoint = Vector2.new(0, 0.5)
	SliderBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	SliderBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderBar.BorderSizePixel = 0
	SliderBar.Position = UDim2.new(0, 0, 0.5, 0)
	SliderBar.Size = UDim2.new(0.5, 0, 1, 0)
	SliderBar.Parent = SliderFrame
	
	local SliderBarCorner = Instance.new("UICorner")
	SliderBarCorner.CornerRadius = UDim.new(0.25, 0)
	SliderBarCorner.Parent = SliderBar
	
	local SliderPercentage = Instance.new("NumberValue")
	SliderPercentage.Name = "SliderPercentage"
	SliderPercentage.Value = 1
	SliderPercentage.Parent = SliderFrame
	
	SliderFrame.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			RunService:BindToRenderStep("MoveSliderToMouse",10,function()
				local MouseLocation = UserInputService:GetMouseLocation()
				local RelativeXPosition = math.clamp((MouseLocation.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
				
				SliderBar.Size = UDim2.fromScale(RelativeXPosition,1)
				SliderPercentage.Value = RelativeXPosition
			end)
		end
	end)
	
	SliderFrame.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			RunService:UnbindFromRenderStep("MoveSliderToMouse")
		end
	end)
	
	return SliderFrame, SliderPercentage
end

return CarnageLibrary
