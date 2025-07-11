local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGuiService = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")

local TweenTime = 0.1
local Level = 1

local GlobalTweenInfo = TweenInfo.new(TweenTime)
local AlteredTweenInfo = TweenInfo.new(TweenTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local DropShadowID = "rbxassetid://6315539415"
local DropShadowTransparency = 0.7

local IconLibraryID = "rbxassetid://3926305904"
local IconLibraryID2 = "rbxassetid://3926307971"

local MainFont = Enum.Font.Gotham

local function GetXY(GuiObject, inputObject)
	local position = inputObject and inputObject.Position or Vector2.new(Mouse.X, Mouse.Y)
	local X, Y = position.X - GuiObject.AbsolutePosition.X, position.Y - GuiObject.AbsolutePosition.Y
	local MaxX, MaxY = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	X, Y = math.clamp(X, 0, MaxX), math.clamp(Y, 0, MaxY)
	return X, Y, X/MaxX, Y/MaxY
end

local function TitleIcon(ButtonOrNot)
	local NewTitleIcon = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewTitleIcon.Name = "TitleIcon"
	NewTitleIcon.BackgroundTransparency = 1
	NewTitleIcon.Image = IconLibraryID
	NewTitleIcon.ImageRectOffset = Vector2.new(524, 764)
	NewTitleIcon.ImageRectSize = Vector2.new(36, 36)
	NewTitleIcon.Size = UDim2.new(0,14,0,14)
	NewTitleIcon.Position = UDim2.new(1,-17,0,3)
	NewTitleIcon.Rotation = 180
	NewTitleIcon.ZIndex = Level
	return NewTitleIcon
end

local function TickIcon(ButtonOrNot)
	local NewTickIcon = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewTickIcon.Name = "TickIcon"
	NewTickIcon.BackgroundTransparency = 1
	NewTickIcon.Image = "rbxassetid://3926305904"
	NewTickIcon.ImageRectOffset = Vector2.new(312,4)
	NewTickIcon.ImageRectSize = Vector2.new(24,24)
	NewTickIcon.Size = UDim2.new(1,-6,1,-6)
	NewTickIcon.Position = UDim2.new(0,3,0,3)
	NewTickIcon.ZIndex = Level
	return NewTickIcon
end

local function DropdownIcon(ButtonOrNot)
	local NewDropdownIcon = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewDropdownIcon.Name = "DropdownIcon"
	NewDropdownIcon.BackgroundTransparency = 1
	NewDropdownIcon.Image = IconLibraryID2
	NewDropdownIcon.ImageRectOffset = Vector2.new(324,364)
	NewDropdownIcon.ImageRectSize = Vector2.new(36,36)
	NewDropdownIcon.Size = UDim2.new(0,16,0,16)
	NewDropdownIcon.Position = UDim2.new(1,-18,0,2)
	NewDropdownIcon.ZIndex = Level
	return NewDropdownIcon
end

local function SearchIcon(ButtonOrNot)
	local NewSearchIcon = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewSearchIcon.Name = "SearchIcon"
	NewSearchIcon.BackgroundTransparency = 1
	NewSearchIcon.Image = IconLibraryID
	NewSearchIcon.ImageRectOffset = Vector2.new(964,324)
	NewSearchIcon.ImageRectSize = Vector2.new(36,36)
	NewSearchIcon.Size = UDim2.new(0,16,0,16)
	NewSearchIcon.Position = UDim2.new(0,2,0,2)
	NewSearchIcon.ZIndex = Level
	return NewSearchIcon
end

local function RoundBox(CornerRadius, ButtonOrNot)
	local NewRoundBox = Instance.new(ButtonOrNot and "ImageButton" or "ImageLabel")
	NewRoundBox.BackgroundTransparency = 1
	NewRoundBox.Image = "rbxassetid://3570695787"
	NewRoundBox.SliceCenter = Rect.new(100,100,100,100)
	NewRoundBox.SliceScale = math.clamp((CornerRadius or 5) * 0.01, 0.01, 1)
	NewRoundBox.ScaleType = Enum.ScaleType.Slice
	NewRoundBox.ZIndex = Level
	return NewRoundBox
end

local function DropShadow(CornerRadius)
	local NewDropShadow = Instance.new("ImageLabel")
	NewDropShadow.Name = "DropShadow"
	NewDropShadow.BackgroundTransparency = 1
	NewDropShadow.Image = DropShadowID
	NewDropShadow.ImageTransparency = DropShadowTransparency
	NewDropShadow.ScaleType = Enum.ScaleType.Slice
	NewDropShadow.SliceCenter = Rect.new(100, 100, 100, 100)
	NewDropShadow.SliceScale = math.clamp((CornerRadius or 5) * 0.02, 0.01, 1)
	NewDropShadow.Size = UDim2.new(1, 10, 1, 10)
	NewDropShadow.Position = UDim2.new(0, -5, 0, -5)
	NewDropShadow.ZIndex = Level
	return NewDropShadow
end

local function Frame()
	local NewFrame = Instance.new("Frame")
	NewFrame.BorderSizePixel = 0
	NewFrame.ZIndex = Level
	return NewFrame
end

local function ScrollingFrame()
	local NewScrollingFrame = Instance.new("ScrollingFrame")
	NewScrollingFrame.BackgroundTransparency = 1
	NewScrollingFrame.BorderSizePixel = 0
	NewScrollingFrame.ScrollBarThickness = 0
	NewScrollingFrame.ZIndex = Level
	return NewScrollingFrame
end

local function TextButton(Text, Size)
	local NewTextButton = Instance.new("TextButton")
	NewTextButton.Text = Text
	NewTextButton.AutoButtonColor = false
	NewTextButton.Font = MainFont
	NewTextButton.TextColor3 = Color3.fromRGB(255,255,255)
	NewTextButton.BackgroundTransparency = 1
	NewTextButton.TextSize = Size or 12
	NewTextButton.Size = UDim2.new(1,0,1,0)
	NewTextButton.ZIndex = Level
	return NewTextButton
end

local function TextBox(Text, Size)
	local NewTextBox = Instance.new("TextBox")
	NewTextBox.Text = Text
	NewTextBox.Font = MainFont
	NewTextBox.TextColor3 = Color3.fromRGB(255,255,255)
	NewTextBox.BackgroundTransparency = 1
	NewTextBox.TextSize = Size or 12
	NewTextBox.Size = UDim2.new(1,0,1,0)
	NewTextBox.ZIndex = Level
	return NewTextBox
end

local function TextLabel(Text, Size)
	local NewTextLabel = Instance.new("TextLabel")
	NewTextLabel.Text = Text
	NewTextLabel.Font = MainFont
	NewTextLabel.TextColor3 = Color3.fromRGB(255,255,255)
	NewTextLabel.BackgroundTransparency = 1
	NewTextLabel.TextSize = Size or 12
	NewTextLabel.Size = UDim2.new(1,0,1,0)
	NewTextLabel.ZIndex = Level
	return NewTextLabel
end

local function Tween(GuiObject, Dictionary)
	local TweenBase = TweenService:Create(GuiObject, GlobalTweenInfo, Dictionary)
	TweenBase:Play()
	return TweenBase
end

local UILibrary = {}

function UILibrary.Load(GUITitle)
	local TargetedParent = RunService:IsStudio() and Player:WaitForChild("PlayerGui") or CoreGuiService
	
	local FindOldInstance = TargetedParent:FindFirstChild(GUITitle)
	
	if FindOldInstance then
		FindOldInstance:Destroy()
	end
	
	local NewInstance, ContainerFrame, ContainerShadow, MainFrame
	
	NewInstance = Instance.new("ScreenGui")
	NewInstance.Name = GUITitle
	NewInstance.Parent = TargetedParent
	
	ContainerFrame = Frame()
	ContainerFrame.Name = "ContainerFrame"
	ContainerFrame.Size = UDim2.new(0,500,0,300)
	ContainerFrame.Position = UDim2.new(0.5,-250,0.5,-150)
	ContainerFrame.BackgroundTransparency = 1
	ContainerFrame.Parent = NewInstance
	
	ContainerShadow = DropShadow(5)
	ContainerShadow.Parent = MainFrame
	
	Level += 1
	
	MainFrame = RoundBox(5)
	MainFrame.ClipsDescendants = true
	MainFrame.Name = "MainFrame"
	MainFrame.Size = UDim2.new(1,-50,1,-30)
	MainFrame.Position = UDim2.new(0,25,0,15)
	MainFrame.ImageColor3 = Color3.fromRGB(30,30,30)
	MainFrame.Parent = ContainerFrame
	
	local MenuBar, DisplayFrame, TitleBar
	
	MenuBar = ScrollingFrame()
	MenuBar.Name = "MenuBar"
	MenuBar.BackgroundTransparency = 0.7
	MenuBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
	MenuBar.Size = UDim2.new(0,100,0,235)
	MenuBar.Position = UDim2.new(0,5,0,30)
	MenuBar.CanvasSize = UDim2.new(0,0,0,0)
	MenuBar.Parent = MainFrame
	
	DisplayFrame = RoundBox(5)
	DisplayFrame.Name = "Display"
	DisplayFrame.ImageColor3 = Color3.fromRGB(20,20,20)
	DisplayFrame.Size = UDim2.new(1,-115,0,235)
	DisplayFrame.Position = UDim2.new(0,110,0,30)
	DisplayFrame.Parent = MainFrame
	
	TitleBar = RoundBox(5)
	TitleBar.Name = "TitleBar"
	TitleBar.ImageColor3 = Color3.fromRGB(40,40,40)
	TitleBar.Size = UDim2.new(1,-10,0,20)
	TitleBar.Position = UDim2.new(0,5,0,5)
	TitleBar.Parent = MainFrame
	
	Level += 1
	
	local MinimiseButton, TitleButton
	local MinimiseToggle = true
	
	MinimiseButton = TitleIcon(true)
	MinimiseButton.Name = "Minimise"
	MinimiseButton.Parent = TitleBar
	
	TitleButton = TextButton(GUITitle, 14)
	TitleButton.Name = "TitleButton"
	TitleButton.Size = UDim2.new(1,-20,1,0)
	TitleButton.Parent = TitleBar
	
	MinimiseButton.MouseButton1Down:Connect(function()
		MinimiseToggle = not MinimiseToggle
		if not MinimiseToggle then
			Tween(MainFrame, {Size = UDim2.new(1,-50,0,30)})
			Tween(MinimiseButton, {Rotation = 0})
			Tween(ContainerShadow, {ImageTransparency = 1})
		else
			Tween(MainFrame, {Size = UDim2.new(1,-50,1,-30)})
			Tween(MinimiseButton, {Rotation = 180})
			Tween(ContainerShadow, {ImageTransparency = DropShadowTransparency})
		end
	end)
	
	TitleButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local dragStart = input.Position
			local startPos = ContainerFrame.Position
			
			local dragConnection
			dragConnection = UserInputService.InputChanged:Connect(function(inputChanged)
				if inputChanged.UserInputType == Enum.UserInputType.MouseMovement or inputChanged.UserInputType == Enum.UserInputType.Touch then
					local delta = inputChanged.Position - dragStart
					ContainerFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				end
			end)
			
			local endConnection
			endConnection = UserInputService.InputEnded:Connect(function(inputEnded)
				if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 or inputEnded.UserInputType == Enum.UserInputType.Touch then
					if dragConnection then dragConnection:Disconnect() end
					if endConnection then endConnection:Disconnect() end
				end
			end)
		end
	end)
	
	Level += 1
	
	local MenuListLayout
	
	MenuListLayout = Instance.new("UIListLayout")
	MenuListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	MenuListLayout.Padding = UDim.new(0,5)
	MenuListLayout.Parent = MenuBar
	
	local TabCount = 0
	
	local TabLibrary = {}
	
	function TabLibrary.AddPage(PageTitle)
		
		local PageContainer = RoundBox(5)
		PageContainer.Name = PageTitle
		PageContainer.Size = UDim2.new(1,0,0,20)
		PageContainer.LayoutOrder = TabCount
		PageContainer.ImageColor3 = (TabCount == 0) and Color3.fromRGB(50,50,50) or Color3.fromRGB(40,40,40)
		PageContainer.Parent = MenuBar
		
		local PageButton = TextButton(PageTitle, 14)
		PageButton.Name = PageTitle.."Button"
		PageButton.TextTransparency = (TabCount == 0) and 0 or 0.5
		PageButton.Parent = PageContainer
		
		PageButton.MouseButton1Down:Connect(function()
			spawn(function()
				for _, Button in next, MenuBar:GetChildren() do
					if Button:IsA("GuiObject") then
						local IsButton = string.find(Button.Name:lower(), PageContainer.Name:lower())
						local Button2 = Button:FindFirstChild(Button.Name.."Button")
						Tween(Button, {ImageColor3 = IsButton and Color3.fromRGB(50,50,50) or Color3.fromRGB(40,40,40)})
						Tween(Button2, {TextTransparency = IsButton and 0 or 0.5})
					end
				end
			end)
			spawn(function()
				for _, Display in next, DisplayFrame:GetChildren() do
					if Display:IsA("GuiObject") then
						Display.Visible = string.find(Display.Name:lower(), PageContainer.Name:lower())
					end
				end
			end)
		end)
		
		local DisplayPage = ScrollingFrame()
		DisplayPage.Visible = (TabCount == 0)
		DisplayPage.Name = PageTitle
		DisplayPage.Size = UDim2.new(1,0,1,0)
		DisplayPage.Parent = DisplayFrame
		
		TabCount += 1
		
		local DisplayList = Instance.new("UIListLayout")
		DisplayList.SortOrder = Enum.SortOrder.LayoutOrder
		DisplayList.Padding = UDim.new(0,5)
		DisplayList.Parent = DisplayPage
		
		DisplayList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			local Y1 = DisplayList.AbsoluteContentSize.Y
			local Y2 = DisplayPage.AbsoluteWindowSize.Y
			DisplayPage.CanvasSize = UDim2.new(0,0,(Y1/Y2)+0.05,0)
		end)
		
		local DisplayPadding = Instance.new("UIPadding")
		DisplayPadding.PaddingBottom = UDim.new(0,5)
		DisplayPadding.PaddingTop = UDim.new(0,5)
		DisplayPadding.PaddingLeft = UDim.new(0,5)
		DisplayPadding.PaddingRight = UDim.new(0,5)
		DisplayPadding.Parent = DisplayPage
		
		local PageLibrary = {}
		
		function PageLibrary.AddButton(Text, Callback, Parent, Underline)
			local ButtonContainer = Frame()
			ButtonContainer.Name = Text.."BUTTON"
			ButtonContainer.Size = UDim2.new(1,0,0,20)
			ButtonContainer.BackgroundTransparency = 1
			ButtonContainer.Parent = Parent or DisplayPage
			
			local ButtonForeground = RoundBox(5)
			ButtonForeground.Name = "ButtonForeground"
			ButtonForeground.Size = UDim2.new(1,0,1,0)
			ButtonForeground.ImageColor3 = Color3.fromRGB(35,35,35)
			ButtonForeground.Parent = ButtonContainer
			
			if Underline then
				local TextSize = TextService:GetTextSize(Text, 12, Enum.Font.Gotham, Vector2.new(0,0))
			
				local BottomEffect = Frame()
				BottomEffect.Size = UDim2.new(0,TextSize.X,0,1)
				BottomEffect.Position = UDim2.new(0.5,(-TextSize.X/2)-1,1,-1)
				BottomEffect.BackgroundColor3 = Color3.fromRGB(255,255,255)
				BottomEffect.BackgroundTransparency = 0.5
				BottomEffect.Parent = ButtonForeground
			end
			
			local HiddenButton = TextButton(Text, 12)
			HiddenButton.Parent = ButtonForeground
			
			HiddenButton.MouseButton1Down:Connect(function()
				Callback()
				Tween(ButtonForeground, {ImageColor3 = Color3.fromRGB(45,45,45)})
				Tween(HiddenButton, {TextTransparency = 0.5})
				wait(TweenTime)
				Tween(ButtonForeground, {ImageColor3 = Color3.fromRGB(35,35,35)})
				Tween(HiddenButton, {TextTransparency = 0})
			end)

			return ButtonContainer
		end
		
		function PageLibrary.AddLabel(Text)
			local LabelContainer = Frame()
			LabelContainer.Name = Text.."LABEL"
			LabelContainer.Size = UDim2.new(1,0,0,20)
			LabelContainer.BackgroundTransparency = 1
			LabelContainer.Parent = DisplayPage
			
			local LabelForeground = RoundBox(5)
			LabelForeground.Name = "LabelForeground"
			LabelForeground.ImageColor3 = Color3.fromRGB(45,45,45)
			LabelForeground.Size = UDim2.new(1,0,1,0)
			LabelForeground.Parent = LabelContainer
			
			local HiddenLabel = TextLabel(Text, 12)
			HiddenLabel.Parent = LabelForeground
		end
		
		function PageLibrary.AddDropdown(Text, ConfigurationArray, Callback)
			local DropdownArray = ConfigurationArray or {}
			local DropdownToggle = false
			
			local DropdownContainer = Frame()
			DropdownContainer.Name = Text.."DROPDOWN"
			DropdownContainer.Size = UDim2.new(1,0,0,20)
			DropdownContainer.BackgroundTransparency = 1
			DropdownContainer.Parent = DisplayPage
			
			local DropdownForeground = RoundBox(5)
			DropdownForeground.ClipsDescendants = true
			DropdownForeground.ImageColor3 = Color3.fromRGB(35,35,35)
			DropdownForeground.Size = UDim2.new(1,0,1,0)
			DropdownForeground.Parent = DropdownContainer
			
			local DropdownExpander = DropdownIcon(true)
			DropdownExpander.Parent = DropdownForeground
			
			local DropdownLabel = TextLabel(Text, 12)
			DropdownLabel.Size = UDim2.new(1,0,0,20)
			DropdownLabel.Parent = DropdownForeground
			
			local DropdownFrame = Frame()
			DropdownFrame.Position = UDim2.new(0,0,0,20)
			DropdownFrame.BackgroundTransparency = 1
			DropdownFrame.Parent = DropdownForeground
			
			local function RecreateOptions(options)
				DropdownArray = options
				for _, child in ipairs(DropdownFrame:GetChildren()) do
					child:Destroy()
				end

				local DropdownList = Instance.new("UIListLayout")
				DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
				DropdownList.Parent = DropdownFrame

				for OptionIndex, Option in ipairs(DropdownArray) do
					local button = PageLibrary.AddButton(Option, function()
						Callback(Option)
						DropdownLabel.Text = Text..": "..Option
						-- Close dropdown on selection
						DropdownToggle = false
						Tween(DropdownContainer, {Size = UDim2.new(1,0,0,20)})
						Tween(DropdownExpander, {Rotation = 0})
					end, DropdownFrame, false)
					button.LayoutOrder = OptionIndex
				end
				local elementCount = #DropdownArray
				DropdownFrame.Size = UDim2.new(1,0,0,elementCount * 20)
				
				if DropdownToggle then
					Tween(DropdownContainer, {Size = UDim2.new(1,0,0,20 + (elementCount * 20))})
				end
			end
			
			RecreateOptions(ConfigurationArray)

			DropdownExpander.MouseButton1Down:Connect(function()
				DropdownToggle = not DropdownToggle
				local elementCount = #DropdownArray
				Tween(DropdownContainer, {Size = DropdownToggle and UDim2.new(1,0,0,20 + (elementCount * 20)) or UDim2.new(1,0,0,20)})
				Tween(DropdownExpander, {Rotation = DropdownToggle and 135 or 0})
			end)
			
			local API = {}
			function API:Update(newOptions)
				RecreateOptions(newOptions)
				DropdownLabel.Text = Text -- Reset label
			end
			
			return API
		end
		
		function PageLibrary.AddColourPicker(Text, DefaultColour, Callback)
			local DefaultColour = DefaultColour or Color3.fromRGB(255,255,255)
			
			local ColourDictionary = {
				white = Color3.fromRGB(255,255,255),
				black = Color3.fromRGB(0,0,0),
				red = Color3.fromRGB(255,0,0),
				green = Color3.fromRGB(0,255,0),
				blue = Color3.fromRGB(0,0,255)
			}
			
			if typeof(DefaultColour) == "table" then
				DefaultColour = Color3.fromRGB(DefaultColour[1] or 255, DefaultColour[2] or 255, DefaultColour[3] or 255)
			elseif typeof(DefaultColour) == "string" then
				DefaultColour = ColourDictionary[DefaultColour:lower()] or ColourDictionary["white"]
			end
			
			local PickerContainer = Frame()
			PickerContainer.ClipsDescendants = true
			PickerContainer.Size = UDim2.new(1,0,0,20)
			PickerContainer.Name = Text.."COLOURPICKER"
			PickerContainer.BackgroundTransparency = 1
			PickerContainer.Parent = DisplayPage
			
			local ColourTracker = Instance.new("Color3Value")
			ColourTracker.Value = DefaultColour
			ColourTracker.Parent = PickerContainer
			
			local PickerLeftSide, PickerRightSide, PickerFrame = RoundBox(5), RoundBox(5), RoundBox(5)
			
			PickerLeftSide.Size = UDim2.new(1,-22,1,0)
			PickerLeftSide.ImageColor3 = Color3.fromRGB(35,35,35)
			PickerLeftSide.Parent = PickerContainer
			
			PickerRightSide.Size = UDim2.new(0,20,1,0)
			PickerRightSide.Position = UDim2.new(1,-20,0,0)
			PickerRightSide.ImageColor3 = DefaultColour
			PickerRightSide.Parent = PickerContainer
			
			PickerFrame.ImageColor3 = Color3.fromRGB(35,35,35)
			PickerFrame.Size = UDim2.new(1,-22,0,60)
			PickerFrame.Position = UDim2.new(0,0,0,20)
			PickerFrame.Parent = PickerContainer
			
			local PickerList = Instance.new("UIListLayout")
			PickerList.SortOrder = Enum.SortOrder.LayoutOrder
			PickerList.Parent = PickerFrame
			
			local RedPicker = PageLibrary.AddSlider("R", {Min = 0, Max = 255, Def = ColourTracker.Value.R * 255}, function(Value)
				ColourTracker.Value = Color3.fromRGB(Value, ColourTracker.Value.G * 255, ColourTracker.Value.B * 255)
				Callback(ColourTracker.Value)
			end, PickerFrame)
			
			local BluePicker = PageLibrary.AddSlider("G", {Min = 0, Max = 255, Def = ColourTracker.Value.G * 255}, function(Value)
				ColourTracker.Value = Color3.fromRGB(ColourTracker.Value.R * 255, Value, ColourTracker.Value.B * 255)
				Callback(ColourTracker.Value)
			end, PickerFrame)
			
			local GreenPicker = PageLibrary.AddSlider("B", {Min = 0, Max = 255, Def = ColourTracker.Value.B * 255}, function(Value)
				ColourTracker.Value = Color3.fromRGB(ColourTracker.Value.R * 255, ColourTracker.Value.G * 255, Value)
				Callback(ColourTracker.Value)
			end, PickerFrame)
			
			local EffectLeft, EffectRight = Frame(), Frame()
			
			EffectLeft.BackgroundColor3 = Color3.fromRGB(35,35,35)
			EffectLeft.Position = UDim2.new(1,-5,0,0)
			EffectLeft.Size = UDim2.new(0,5,1,0)
			EffectLeft.Parent = PickerLeftSide
			
			EffectRight.BackgroundColor3 = DefaultColour
			EffectRight.Size = UDim2.new(0,5,1,0)
			EffectRight.Parent = PickerRightSide
			
			local PickerLabel = TextLabel(Text, 12)
			PickerLabel.Size = UDim2.new(1,0,0,20)
			PickerLabel.Parent = PickerLeftSide
			
			ColourTracker:GetPropertyChangedSignal("Value"):Connect(function()
				local NewValue = ColourTracker.Value
				EffectRight.BackgroundColor3 = NewValue
				PickerRightSide.ImageColor3 = NewValue
			end)
			
			local PickerToggle = false
			
			local PickerButton = TextButton("")
			PickerButton.Parent = PickerRightSide
			
			PickerButton.MouseButton1Down:Connect(function()
				PickerToggle = not PickerToggle
				Tween(PickerContainer, {Size = PickerToggle and UDim2.new(1,0,0,80) or UDim2.new(1,0,0,20)})
			end)
		end
		
		function PageLibrary.AddSlider(Text, ConfigurationDictionary, Callback, Parent)
			local Configuration = ConfigurationDictionary
			local Minimum = Configuration.Minimum or Configuration.minimum or Configuration.Min or Configuration.min
			local Maximum = Configuration.Maximum or Configuration.maximum or Configuration.Max or Configuration.max
			local Default = Configuration.Default or Configuration.default or Configuration.Def or Configuration.def
			
			if Minimum > Maximum then
				local StoreValue = Minimum
				Minimum = Maximum
				Maximum = StoreValue
			end
			
			Default = math.clamp(Default, Minimum, Maximum)
			
			local DefaultScale = Default/Maximum
			
			local SliderContainer = Frame()
			SliderContainer.Name = Text.."SLIDER"
			SliderContainer.Size = UDim2.new(1,0,0,20)
			SliderContainer.BackgroundTransparency = 1
			SliderContainer.Parent = Parent or DisplayPage
			
			local SliderForeground = RoundBox(5)
			SliderForeground.Name = "SliderForeground"
			SliderForeground.ImageColor3 = Color3.fromRGB(35,35,35)
			SliderForeground.Size = UDim2.new(1,0,1,0)
			SliderForeground.Parent = SliderContainer
			
			local SliderButton = TextButton(Text..": "..Default)
			SliderButton.Size = UDim2.new(1,0,1,0)
			SliderButton.ZIndex = 6
			SliderButton.Parent = SliderForeground
			
			local SliderFill = RoundBox(5)
			SliderFill.Size = UDim2.new(DefaultScale,0,1,0)
			SliderFill.ImageColor3 = Color3.fromRGB(70,70,70)
			SliderFill.ZIndex = 5
			SliderFill.ImageTransparency = 0.7
			SliderFill.Parent = SliderButton
			
			local function updateSlider(input)
				local _, _, XScale, _ = GetXY(SliderButton, input)
				local Value = math.floor(Minimum + ((Maximum - Minimum) * XScale))
				Callback(Value)
				SliderButton.Text = Text..": "..tostring(Value)
				local TargetSize = UDim2.new(XScale, 0, 1, 0)
				Tween(SliderFill, {Size = TargetSize})
			end

			SliderButton.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Tween(SliderFill, {ImageTransparency = 0.5})
					updateSlider(input)
					
					local moveConnection, endConnection
					
					moveConnection = UserInputService.InputChanged:Connect(function(inputChanged)
						if inputChanged.UserInputType == Enum.UserInputType.MouseMovement or inputChanged.UserInputType == Enum.UserInputType.Touch then
						   updateSlider(inputChanged)
						end
					end)
					
					endConnection = UserInputService.InputEnded:Connect(function(inputEnded)
						if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 or inputEnded.UserInputType == Enum.UserInputType.Touch then
							Tween(SliderFill, {ImageTransparency = 0.7})
							if moveConnection then moveConnection:Disconnect() end
							if endConnection then endConnection:Disconnect() end
						end
					end)
				end
			end)
		end
		
		function PageLibrary.AddToggle(Text, Default, Callback)
			local ThisToggle = Default or false
			
			local ToggleContainer = Frame()
			ToggleContainer.Name = Text.."TOGGLE"
			ToggleContainer.Size = UDim2.new(1,0,0,20)
			ToggleContainer.BackgroundTransparency = 1
			ToggleContainer.Parent = DisplayPage
			
			local ToggleLeftSide, ToggleRightSide, EffectFrame, RightTick = RoundBox(5), RoundBox(5), Frame(), TickIcon()
			local FlatLeft, FlatRight = Frame(), Frame()
			
			ToggleLeftSide.Size = UDim2.new(1,-22,1,0)
			ToggleLeftSide.ImageColor3 = Color3.fromRGB(35,35,35)
			ToggleLeftSide.Parent = ToggleContainer
			
			ToggleRightSide.Position = UDim2.new(1,-20,0,0)
			ToggleRightSide.Size = UDim2.new(0,20,1,0)
			ToggleRightSide.ImageColor3 = Color3.fromRGB(45,45,45)
			ToggleRightSide.Parent = ToggleContainer
			
			FlatLeft.BackgroundColor3 = Color3.fromRGB(35,35,35)
			FlatLeft.Size = UDim2.new(0,5,1,0)
			FlatLeft.Position = UDim2.new(1,-5,0,0)
			FlatLeft.Parent = ToggleLeftSide
			
			FlatRight.BackgroundColor3 = Color3.fromRGB(45,45,45)
			FlatRight.Size = UDim2.new(0,5,1,0)
			FlatRight.Parent = ToggleRightSide
			
			EffectFrame.BackgroundColor3 = ThisToggle and Color3.fromRGB(0,255,109) or Color3.fromRGB(255,160,160)
			EffectFrame.Position = UDim2.new(1,-22,0.2,0)
			EffectFrame.Size = UDim2.new(0,2,0.6,0)
			EffectFrame.Parent = ToggleContainer
			
			RightTick.ImageTransparency = ThisToggle and 0 or 1
			RightTick.Parent = ToggleRightSide
			
			local ToggleButton = TextButton(Text, 12)
			ToggleButton.Name = "ToggleButton"
			ToggleButton.Size = UDim2.new(1,0,1,0)
			ToggleButton.Parent = ToggleLeftSide
			
			ToggleButton.MouseButton1Down:Connect(function()
				ThisToggle = not ThisToggle
				Tween(EffectFrame, {BackgroundColor3 = ThisToggle and Color3.fromRGB(0,255,109) or Color3.fromRGB(255,160,160)})
				Tween(RightTick, {ImageTransparency = ThisToggle and 0 or 1})
				Callback(ThisToggle)
			end)	
		end
		
		return PageLibrary
	end
	
	TabLibrary.ContainerFrame = ContainerFrame
	return TabLibrary
end

return UILibrary
