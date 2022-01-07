local CarnageLibrary = {}

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local CarnageGUI = Instance.new("ScreenGui")
CarnageGUI.IgnoreGuiInset = true
CarnageGUI.Name = HttpService:GenerateGUID()
CarnageGUI.ResetOnSpawn = false
syn.protect_gui(CarnageGUI)
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

	local TitleText = Instance.new("TextButton")
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

	local GuiActive = Instance.new("BoolValue")
	GuiActive.Name = "Active"
	GuiActive.Value = true
	GuiActive.Parent = MainBox

	GuiActive.Changed:Connect(function(Value)
		if Value then
			MainBox.Visible = true
		else
			MainBox.Visible = false
		end
	end)

	local CurrentPagePointer = Instance.new("ObjectValue")
	CurrentPagePointer.Name = "CurrentPage"
	CurrentPagePointer.Value = nil
	CurrentPagePointer.Parent = MainBox

	local CurrentPage = CurrentPagePointer.Value

	CurrentPagePointer.Changed:Connect(function(NewPage)
		if CurrentPage and CurrentPage ~= NewPage then
			local OldPageButton = CurrentPage:FindFirstChild("PageButtonPointer").Value

			CurrentPage.Visible = false
			OldPageButton.BackgroundTransparency = 1
		end

		local NewPageButton = NewPage:FindFirstChild("PageButtonPointer").Value

		NewPage.Visible = true
		NewPageButton.BackgroundTransparency = 0

		CurrentPage = NewPage
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

	return MainBox, GuiActive, NavigationBar, CurrentPagePointer
end

function CarnageLibrary:NewBox(BoxName, BoxSize)
	local Box = Instance.new("Frame")
	Box.Name = "Box"
	Box.AnchorPoint = Vector2.new(0.5, 0.5)
	Box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Box.BorderSizePixel = 0
	Box.Position = UDim2.new(0.5, 0, 0.5, 0)
	Box.Size = BoxSize or UDim2.new(0, 500, 0, 300)
	Box.ZIndex = 5
	Box.Parent = CarnageGUI

	local BoxListLayout = Instance.new("UIListLayout")
	BoxListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	BoxListLayout.Padding = UDim.new(0, 5)
	BoxListLayout.Parent = Box

	local BoxPadding = Instance.new("UIPadding")
	BoxPadding.PaddingBottom = UDim.new(0, 10)
	BoxPadding.PaddingLeft = UDim.new(0, 10)
	BoxPadding.PaddingRight = UDim.new(0, 10)
	BoxPadding.PaddingTop = UDim.new(0, 10)
	BoxPadding.Parent = Box

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Box

	Box.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			local RelativeXPosition = (Input.Position.X - Box.AbsolutePosition.X) / Box.Size.X.Offset
			local RelativeYPosition = (Input.Position.Y - Box.AbsolutePosition.Y) / Box.Size.Y.Offset

			Box.AnchorPoint = Vector2.new(RelativeXPosition,RelativeYPosition)

			RunService:BindToRenderStep("MoveGuiToMouse",10,function()
				local MouseLocation = UserInputService:GetMouseLocation()

				Box.Position = UDim2.fromOffset(MouseLocation.X,MouseLocation.Y)
			end)
		end
	end)

	Box.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			RunService:UnbindFromRenderStep("MoveGuiToMouse")
		end
	end)

	return Box
end

function CarnageLibrary:NewScrollFrame()
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Active = true
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ScrollingFrame.BackgroundTransparency = 0.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
	ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 40, 40)
	ScrollingFrame.ScrollBarThickness = 5
	ScrollingFrame.ZIndex = 5

	local ScrollingFrameListLayout = Instance.new("UIListLayout")
	ScrollingFrameListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ScrollingFrameListLayout.Padding = UDim.new(0, 5)
	ScrollingFrameListLayout.Parent = ScrollingFrame

	local ScrollingFramePadding = Instance.new("UIPadding")
	ScrollingFramePadding.PaddingBottom = UDim.new(0, 5)
	ScrollingFramePadding.PaddingLeft = UDim.new(0, 5)
	ScrollingFramePadding.PaddingRight = UDim.new(0, 5)
	ScrollingFramePadding.PaddingTop = UDim.new(0, 5)
	ScrollingFramePadding.Parent = ScrollingFrame

	return ScrollingFrame
end

function CarnageLibrary:NewPage(PageText)
	local PageFrame = Instance.new("Frame")
	PageFrame.Name = PageText or "Page"
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
	PageButton.AutomaticSize = Enum.AutomaticSize.X
	PageButton.Active = false
	PageButton.AnchorPoint = Vector2.new(0, 0.5)
	PageButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	PageButton.BackgroundTransparency = 1.000
	PageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PageButton.BorderSizePixel = 0
	PageButton.Position = UDim2.new(0, 0, 0.5, 0)
	PageButton.Size = UDim2.new(0, 0, 0.75, 0)
	PageButton.AutoButtonColor = false
	PageButton.Font = Enum.Font.Arial
	PageButton.Text = PageText or "Page"
	PageButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	PageButton.TextSize = 15.000
	PageButton.TextStrokeTransparency = 0.000

	local PageButtonCorner = Instance.new("UICorner")
	PageButtonCorner.CornerRadius = UDim.new(0, 10)
	PageButtonCorner.Parent = PageButton

	local PageButtonPadding = Instance.new("UIPadding")
	PageButtonPadding.PaddingLeft = UDim.new(0, 5)
	PageButtonPadding.PaddingRight = UDim.new(0, 5)
	PageButtonPadding.Parent = PageButton

	local PageButtonPointer = Instance.new("ObjectValue")
	PageButtonPointer.Name = "PageButtonPointer"
	PageButtonPointer.Value = PageButton
	PageButtonPointer.Parent = PageFrame

	local MainBox = CarnageGUI:FindFirstChild("MainBox")
	local CurrentPage = MainBox:FindFirstChild("CurrentPage")

	PageButton.MouseButton1Click:Connect(function()
		CurrentPage.Value = PageFrame
	end)

	return PageFrame, PageButton
end

function CarnageLibrary:NewSection()
	local Section = Instance.new("ScrollingFrame")
	Section.Name = "Section"
	Section.Active = true
	Section.AutomaticCanvasSize = Enum.AutomaticSize.Y
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

function CarnageLibrary:NewFeature(FeatureText)
	local FeatureFrame = Instance.new("Frame")
	FeatureFrame.Name = FeatureText or "Feature"
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
	FeatureTitle.Text = FeatureText or "Feature"
	FeatureTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	FeatureTitle.TextSize = 20.000
	FeatureTitle.TextStrokeTransparency = 0.000
	FeatureTitle.Parent = FeatureFrame

	return FeatureFrame
end

function CarnageLibrary:NewRadioButton(RadioButtonText)
	local RadioButton = Instance.new("TextButton")
	RadioButton.Name = RadioButtonText or "RadioButton"
	RadioButton.Active = false
	RadioButton.AnchorPoint = Vector2.new(0.5,0)
	RadioButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RadioButton.BackgroundTransparency = 1.000
	RadioButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RadioButton.BorderSizePixel = 0
	RadioButton.Size = UDim2.new(1, 0, 0, 16)
	RadioButton.Font = Enum.Font.Arial
	RadioButton.Text = RadioButtonText or "RadioButton"
	RadioButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	RadioButton.TextSize = 15.000
	RadioButton.TextStrokeTransparency = 0.500
	RadioButton.TextXAlignment = Enum.TextXAlignment.Left

	local RadioButtonFrame = Instance.new("Frame")
	RadioButtonFrame.Name = "RadioButtonFrame"
	RadioButtonFrame.AnchorPoint = Vector2.new(1, 0.5)
	RadioButtonFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	RadioButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RadioButtonFrame.BorderSizePixel = 0
	RadioButtonFrame.Position = UDim2.new(1, 0, 0.5, 0)
	RadioButtonFrame.Size = UDim2.new(0.75, 0, 0.75, 0)
	RadioButtonFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	RadioButtonFrame.Parent = RadioButton

	local RadioButtonFrameCorner = Instance.new("UICorner")
	RadioButtonFrameCorner.CornerRadius = UDim.new(1, 0)
	RadioButtonFrameCorner.Parent = RadioButtonFrame

	local RadioButtonCircle = Instance.new("Frame")
	RadioButtonCircle.Name = "RadioButtonCircle"
	RadioButtonCircle.AnchorPoint = Vector2.new(0.5, 0.5)
	RadioButtonCircle.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	RadioButtonCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RadioButtonCircle.BorderSizePixel = 0
	RadioButtonCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
	RadioButtonCircle.Size = UDim2.new(0.5, 0, 0.5, 0)
	RadioButtonCircle.Transparency = 1
	RadioButtonCircle.Parent = RadioButtonFrame

	local RadioButtonCircleCorner = Instance.new("UICorner")
	RadioButtonCircleCorner.CornerRadius = UDim.new(1, 0)
	RadioButtonCircleCorner.Parent = RadioButtonCircle

	local RadioButtonActive = Instance.new("BoolValue")
	RadioButtonActive.Name = "RadioButtonActive"
	RadioButtonActive.Value = false
	RadioButtonActive.Parent = RadioButton

	RadioButtonActive.Changed:Connect(function(Value)
		if Value then
			RadioButtonCircle.Transparency = 0
		else
			RadioButtonCircle.Transparency = 1
		end
	end)

	RadioButton.MouseButton1Click:Connect(function()
		if RadioButtonActive.Value then
			RadioButtonActive.Value = false
			RadioButtonCircle.Transparency = 1
		else
			RadioButtonActive.Value = true
			RadioButtonCircle.Transparency = 0
		end
	end)

	return RadioButton, RadioButtonActive
end

function CarnageLibrary:NewCheckboxButton(CheckboxButtonText)
	local CheckboxButton = Instance.new("TextButton")
	CheckboxButton.Name = CheckboxButtonText or "CheckboxButton"
	CheckboxButton.Active = false
	CheckboxButton.AnchorPoint = Vector2.new(0.5, 0)
	CheckboxButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CheckboxButton.BackgroundTransparency = 1.000
	CheckboxButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckboxButton.BorderSizePixel = 0
	CheckboxButton.Size = UDim2.new(1, 0, 0, 16)
	CheckboxButton.Font = Enum.Font.Arial
	CheckboxButton.Text = CheckboxButtonText or "Checkbox"
	CheckboxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CheckboxButton.TextSize = 15.000
	CheckboxButton.TextStrokeTransparency = 0.000
	CheckboxButton.TextXAlignment = Enum.TextXAlignment.Left

	local CheckboxButtonFrame = Instance.new("Frame")
	CheckboxButtonFrame.Name = "CheckboxButtonFrame"
	CheckboxButtonFrame.AnchorPoint = Vector2.new(1, 0.5)
	CheckboxButtonFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	CheckboxButtonFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckboxButtonFrame.BorderSizePixel = 0
	CheckboxButtonFrame.Position = UDim2.new(1, 0, 0.5, 0)
	CheckboxButtonFrame.Size = UDim2.new(0.75, 0, 0.75, 0)
	CheckboxButtonFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	CheckboxButtonFrame.Parent = CheckboxButton

	local CheckboxButtonTick = Instance.new("Frame")
	CheckboxButtonTick.Name = "CheckboxButtonTick"
	CheckboxButtonTick.AnchorPoint = Vector2.new(0.5, 0.5)
	CheckboxButtonTick.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
	CheckboxButtonTick.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CheckboxButtonTick.BorderSizePixel = 0
	CheckboxButtonTick.Position = UDim2.new(0.5, 0, 0.5, 0)
	CheckboxButtonTick.Size = UDim2.new(0.5, 0, 0.5, 0)
	CheckboxButtonTick.Transparency = 1
	CheckboxButtonTick.Parent = CheckboxButtonFrame

	local CheckboxButtonActive = Instance.new("BoolValue")
	CheckboxButtonActive.Name = "CheckboxButtonActive"
	CheckboxButtonActive.Value = false
	CheckboxButtonActive.Parent = CheckboxButton

	CheckboxButtonActive.Changed:Connect(function(Value)
		if Value then
			CheckboxButtonTick.Transparency = 0
		else
			CheckboxButtonTick.Transparency = 1
		end
	end)

	CheckboxButton.MouseButton1Click:Connect(function()
		if CheckboxButtonActive.Value then
			CheckboxButtonActive.Value = false
			CheckboxButtonTick.Transparency = 1
		else
			CheckboxButtonActive.Value = true
			CheckboxButtonTick.Transparency = 0
		end
	end)

	return CheckboxButton, CheckboxButtonActive
end

function CarnageLibrary:NewSlider(SliderFrameText)
	local SliderHolderFrame = Instance.new("Frame")
	SliderHolderFrame.Name = SliderFrameText or "SliderHolderFrameFrame"
	SliderHolderFrame.AnchorPoint = Vector2.new(0.5, 0)
	SliderHolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderHolderFrame.BackgroundTransparency = 1.000
	SliderHolderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderHolderFrame.BorderSizePixel = 0
	SliderHolderFrame.Size = UDim2.new(1, 0, 0, 16)

	local SliderFrame = Instance.new("Frame")
	SliderFrame.Name = "SliderFrame"
	SliderFrame.AnchorPoint = Vector2.new(0, 0.5)
	SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderFrame.BorderSizePixel = 0
	SliderFrame.Position = UDim2.new(0, 0, 0.5, 0)
	SliderFrame.Size = UDim2.new(0.75, 0, 0, 16)
	SliderFrame.Parent = SliderHolderFrame

	local SliderFrameCorner = Instance.new("UICorner")
	SliderFrameCorner.CornerRadius = UDim.new(0.25, 0)
	SliderFrameCorner.Parent = SliderFrame

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

	local SliderTextBox = Instance.new("TextBox")
	SliderTextBox.Name = "SliderTextBox"
	SliderTextBox.AnchorPoint = Vector2.new(1, 0.5)
	SliderTextBox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	SliderTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderTextBox.BorderSizePixel = 0
	SliderTextBox.ClearTextOnFocus = false
	SliderTextBox.Position = UDim2.new(1, 0, 0.5, 0)
	SliderTextBox.Size = UDim2.new(0.224999994, 0, 1, 0)
	SliderTextBox.Font = Enum.Font.Arial
	SliderTextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	SliderTextBox.Text = ""
	SliderTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	SliderTextBox.TextScaled = true
	SliderTextBox.TextSize = 15.000
	SliderTextBox.TextWrapped = true
	SliderTextBox.Parent = SliderHolderFrame

	local SliderTextBoxCorner = Instance.new("UICorner")
	SliderTextBoxCorner.CornerRadius = UDim.new(0, 5)
	SliderTextBoxCorner.Parent = SliderTextBox	

	local SliderPercentage = Instance.new("NumberValue")
	SliderPercentage.Name = "SliderPercentage"
	SliderPercentage.Value = SliderBar.Size.X.Scale
	SliderPercentage.Parent = SliderHolderFrame

	local SliderNumber = Instance.new("NumberValue")
	SliderNumber.Name = "SliderNumber"
	SliderNumber.Parent = SliderHolderFrame

	SliderPercentage.Changed:Connect(function(Value)
		SliderBar.Size = UDim2.new(Value, 0, 1, 0)
	end)

	SliderNumber.Changed:Connect(function(Value)
		SliderTextBox.Text = tostring(Value)
	end)

	SliderTextBox.FocusLost:Connect(function(Enter,Input)
		if Enter then
			if tonumber(SliderTextBox.Text) then
				SliderNumber.Value = tonumber(SliderTextBox.Text)
			else
				SliderTextBox.Text = tostring(SliderNumber.Value)
			end
		else
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				if tonumber(SliderTextBox.Text) then
					SliderNumber.Value = tonumber(SliderTextBox.Text)
				else
					SliderTextBox.Text = tostring(SliderNumber.Value)
				end
			else
				SliderTextBox.Text = tostring(SliderNumber.Value)
			end
		end
	end)

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

	return SliderHolderFrame, SliderPercentage, SliderTextBox, SliderNumber
end

function CarnageLibrary:NewKeybindSetter(KeybindText, FeatureToBind)
	local KeybindSetter = Instance.new("TextButton")
	KeybindSetter.Name = KeybindText or "KeybindSetter"
	KeybindSetter.Active = false
	KeybindSetter.AnchorPoint = Vector2.new(0.5, 0)
	KeybindSetter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeybindSetter.BackgroundTransparency = 1.000
	KeybindSetter.BorderColor3 = Color3.fromRGB(0, 0, 0)
	KeybindSetter.BorderSizePixel = 0
	KeybindSetter.Size = UDim2.new(1, 0, 0, 16)
	KeybindSetter.Font = Enum.Font.Arial
	KeybindSetter.Text = KeybindText or "Keybind"
	KeybindSetter.TextColor3 = Color3.fromRGB(255, 255, 255)
	KeybindSetter.TextSize = 15.000
	KeybindSetter.TextStrokeTransparency = 0.000
	KeybindSetter.TextXAlignment = Enum.TextXAlignment.Left

	local Key = Instance.new("TextLabel")
	Key.Name = "Key"
	Key.AnchorPoint = Vector2.new(1, 0.5)
	Key.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	Key.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Key.BorderSizePixel = 0
	Key.Position = UDim2.new(1, 0, 0.5, 0)
	Key.Size = UDim2.new(0.225, 0, 1, 0)
	Key.Font = Enum.Font.Arial
	Key.Text = "No Key Set"
	Key.TextColor3 = Color3.fromRGB(255, 255, 255)
	Key.TextScaled = true
	Key.TextSize = 15.000
	Key.TextWrapped = true
	Key.Parent = KeybindSetter

	local KeybindSetterCorner = Instance.new("UICorner")
	KeybindSetterCorner.CornerRadius = UDim.new(0, 5)
	KeybindSetterCorner.Parent = Key

	local Feature = Instance.new("ObjectValue")
	Feature.Name = "Feature"
	Feature.Value = FeatureToBind
	Feature.Parent = KeybindSetter

	local CurrentKeybind = Instance.new("StringValue")
	CurrentKeybind.Name = "Keybind"
	CurrentKeybind.Value = ""
	CurrentKeybind.Parent = KeybindSetter

	local CurrentKeybindConnection = nil
	local KeyListener = nil

	KeybindSetter.MouseButton1Click:Connect(function()
		Key.Text = ". . ."

		local function CreateKeybind(KeyString)
			local KeybindConnection = nil

			KeybindConnection = UserInputService.InputBegan:Connect(function(Input,Typing)
				if not Typing then
					if Input.KeyCode == Enum.KeyCode[KeyString] then
						local FeatureActive = Feature.Value
						if FeatureActive.Value then
							FeatureActive.Value = false
						else
							FeatureActive.Value = true
						end
					end
				end
			end)

			return KeybindConnection
		end

		KeyListener = UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType ~= Enum.UserInputType.Keyboard or Input.KeyCode == Enum.KeyCode.Escape then
				if CurrentKeybind.Value ~= "" then
					Key.Text = CurrentKeybind.Value
				else
					Key.Text = "No Key Set"
				end

				KeyListener:Disconnect()

				return
			end

			local KeyString = tostring(Input.KeyCode)
			KeyString = string.gsub(KeyString,"Enum.KeyCode.","")

			CurrentKeybind.Value = KeyString
			Key.Text = KeyString

			if CurrentKeybindConnection then
				CurrentKeybindConnection:Disconnect()
			end

			CurrentKeybindConnection = CreateKeybind(KeyString)
			KeyListener:Disconnect()
		end)
	end)

	return KeybindSetter
end

return CarnageLibrary
