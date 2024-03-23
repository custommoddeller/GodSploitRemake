local startTick = tick()

if shared.GodSploitInjected then warn("GodSploit is already injected!") return end

shared.GodSploitInjected = true
Loaded = false

--local owner = ""

local gserv = function(service) return game:GetService(service) end

local GodSploit = {
	Open = {Value = false},
	UiWindows = 0,
	config = {
		OpenKeybind = {Value = "LeftControl"},
		Tweens = {Enabled = true},
		TweenSpeed = {Value = 0.1}
	},
	modules = {

	}
}

local Settings = {
	Speed = false,
	Highjump = false,
	InfiniteJump = false,
	DirectionAssist = false,
	FOVChanger = false,
	Chams = false,
	Uninject = false
}


function addDrag(obj)
	obj.Draggable = true
	obj.Selectable = true
	obj.Active = true
end

local httpService = gserv("HttpService")
local tweenService = gserv("TweenService")
local rbxanalytics = gserv("RbxAnalyticsService")
local runService = gserv("RunService")
local players = gserv("Players")
local rStorage = gserv("ReplicatedStorage")
local lplr = players.LocalPlayer
local plrGui = lplr.PlayerGui
local UIS = gserv("UserInputService")
local wearwarev2 = Instance.new("ScreenGui")

local securityName = httpService:GenerateGUID(true)
local securityId = math.random(1, 7654321)

wearwarev2:SetAttribute(securityId, true)
local GodSploitInfo = {
	GodSploitVersion = "GodSploit V2.0.0",
	Resolution = "1920x1080",
	GameId = 123,
	GameName = "BedWars"
}

uninject = function()
	shared.GodSploitInjected = false
	wearwarev2:SetAttribute(securityId, false)
	wearwarev2:Destroy()
end


function saveSettings()
	if shared.GodSploitInjected then
		local jsonencoded = httpService:JSONEncode(Settings)
		writefile("savedModulesFile.json", jsonencoded)
	end
end

function EntityNearPosition(distance)
	for _, v in players:GetPlayers() do
		if (v.Character.PrimaryPart.Position - lplr.Character.PrimaryPart.Position).magnitude < distance and v ~= lplr then return v else continue end
	end
end

local information = Instance.new("TextLabel")
information.Name = "information"
information.Parent = wearwarev2
information.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
information.BackgroundTransparency = 1.000
information.BorderColor3 = Color3.fromRGB(0, 0, 0)
information.BorderSizePixel = 0
information.Position = UDim2.new(0.00681114569, 0, 0.657749772, 0)
information.Size = UDim2.new(0.791331291, 0, 0.332962126, 0)
information.Font = Enum.Font.SourceSans
information.TextColor3 = Color3.fromRGB(255, 255, 255)
information.TextSize = 21.000
information.TextStrokeTransparency = 0.000
information.TextXAlignment = Enum.TextXAlignment.Left
information.TextYAlignment = Enum.TextYAlignment.Bottom

information.Text = GodSploitInfo.Resolution.."\n"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."\n"..game.PlaceId.."\n"..GodSploitInfo.GodSploitVersion

function updateRes() return wearwarev2.AbsoluteSize.X.."x"..wearwarev2.AbsoluteSize.Y end updateRes()
wearwarev2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
	GodSploitInfo.Resolution = updateRes()
end)

local notificationHolder = Instance.new("Frame")
local Frame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
notificationHolder.Name = "notificationHolder"
notificationHolder.Parent = wearwarev2
notificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notificationHolder.BackgroundTransparency = 1.000
notificationHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
notificationHolder.BorderSizePixel = 0
notificationHolder.Position = UDim2.new(0.800000012, 0, 0, 0)
notificationHolder.Size = UDim2.new(0.200000003, 0, 0.980487823, 0)
Frame.Parent = notificationHolder
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)
UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 5)

function CreateNotification(title, content, last)
	task.spawn(function()
		local Frame_2 = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")
		local DropShadow = Instance.new("ImageLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local TextLabel_2 = Instance.new("TextLabel")
		local TextLabel = Instance.new("TextLabel")
		Frame_2.Parent = Frame
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
		Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_2.BorderSizePixel = 0
		Frame_2.ClipsDescendants = true
		Frame_2.Position = UDim2.new(0.563591123, 0, 0.894209325, 0)
		--Frame_2.Size = UDim2.new(1, 0, 0.105999999, 0)
		Frame_2.Size = UDim2.new(0, 0, 0, 0)
		TextLabel.Parent = Frame_2
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.0199999996, 0, 0, 0)
		TextLabel.Size = UDim2.new(0.571428597, 0, 0.357894748, 0)
		TextLabel.Font = Enum.Font.Arial
		TextLabel.Text = title
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 183, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = TextLabel
		UIAspectRatioConstraint.Parent = Frame_2
		UIAspectRatioConstraint.AspectRatio = 3.463
		DropShadow.Name = "DropShadow"
		DropShadow.Parent = Frame_2
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1.000
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 6, 1, 6)
		DropShadow.ZIndex = -1
		DropShadow.Image = "rbxassetid://13350795660"
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.500
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)
		TextLabel_2.Parent = Frame_2
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_2.BorderSizePixel = 0
		TextLabel_2.Position = UDim2.new(0.019999966, 0, 0.353583455, 0)
		TextLabel_2.Size = UDim2.new(0.454010129, 0, 0.250747204, 0)
		TextLabel_2.Font = Enum.Font.Arial
		TextLabel_2.Text = content
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 21.000
		TextLabel_2.TextWrapped = true
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
		TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
		
		task.spawn(function()
		
			tweenService:Create(Frame_2, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0.105999999, 0)}):Play()
			
			task.wait(last)
			tweenService:Create(Frame_2, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
		
		end)
		
		return Frame_2
	end)
	
	
end

function CreateMainFrame(args)
	local Frame = Instance.new("Frame")
	local MainFrameHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Content = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local MainBar = Instance.new("Frame")
	local Project = Instance.new("TextLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Divider = Instance.new("Frame")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local UIStroke = Instance.new("UIStroke")
	wearwarev2.Parent = (runService:IsStudio() and game.Players.LocalPlayer:WaitForChild("PlayerGui") or game.CoreGui)
	wearwarev2.Name = securityName
	Frame.Parent = wearwarev2
	Frame.AnchorPoint = Vector2.new(0.5, 0)
	Frame.BackgroundColor3 = Color3.fromRGB(85, 85, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0, 0)
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.Visible = GodSploit.Open.Value
	MainFrameHolder.Name = "MainFrameHolder"
	MainFrameHolder.Parent = Frame
	MainFrameHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrameHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	MainFrameHolder.BackgroundTransparency = 1.000
	MainFrameHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrameHolder.BorderSizePixel = 0
	MainFrameHolder.ClipsDescendants = true
	MainFrameHolder.Position = UDim2.new(0.0751608908, 0, 0.256054848, 0)
	MainFrameHolder.Size = UDim2.new(0.11391633, 0, 0.449526161, 0)
	addDrag(MainFrameHolder)
	DropShadow.Name = "DropShadow"
	DropShadow.Parent = MainFrameHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 6, 1, 6)
	DropShadow.ZIndex = -1
	DropShadow.Image = "rbxassetid://13350795660"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)
	Content.Name = "Content"
	Content.Parent = MainFrameHolder
	Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Content.BackgroundTransparency = 0.300
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Position = UDim2.new(0, 0, 0.132013202, 0)
	Content.Size = UDim2.new(1, 0, 0.867986798, 0)
	UIListLayout.Parent = Content
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	MainBar.Name = "MainBar"
	MainBar.Parent = MainFrameHolder
	MainBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainBar.BorderSizePixel = 0
	MainBar.Size = UDim2.new(1, 0, 0.132013202, 0)
	Project.Name = "Project"
	Project.Parent = MainBar
	Project.AnchorPoint = Vector2.new(0.5, 0.5)
	Project.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Project.BackgroundTransparency = 1.000
	Project.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Project.BorderSizePixel = 0
	Project.Position = UDim2.new(0.497961104, 0, 0.500684977, 0)
	Project.Size = UDim2.new(0.647499919, 0, 0.598627925, 0)
	Project.ZIndex = 999
	Project.Font = Enum.Font.Gotham
	Project.Text = "GOD<font color=\"#ffaa00\" face=\"Gotham\">SPLOIT</font>"
	Project.TextColor3 = Color3.fromRGB(255, 255, 255)
	Project.TextScaled = true
	Project.TextSize = 14.000
	Project.TextWrapped = true
	Project.RichText = true
	UIAspectRatioConstraint.Parent = MainFrameHolder
	UIAspectRatioConstraint.AspectRatio = 0.528
	UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	Divider.Name = "Divider"
	Divider.Parent = MainFrameHolder
	Divider.AnchorPoint = Vector2.new(0, 1)
	Divider.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
	Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Divider.BorderSizePixel = 0
	Divider.Position = UDim2.new(0, 0, 0.131522745, 0)
	Divider.Size = UDim2.new(1, 0, 0.00330033014, 0)
	Divider.ZIndex = 2
	UIAspectRatioConstraint_2.Parent = Frame
	UIAspectRatioConstraint_2.AspectRatio = 2.131
	UIStroke.Parent = MainFrameHolder
	UIStroke.Color = Color3.fromRGB(255, 170, 0)
	UIStroke.Thickness = 0.6
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	return Content
end


local tabs = CreateMainFrame()

function CreateTab(options)
	local tabApi = {}
	tabApi.Enabled = false
	
	local Tab = Instance.new("TextButton")
	local Tab2 = Instance.new("TextLabel")
	Tab.Name = options.TabName
	Tab.Parent = tabs
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1.000
	Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab.BorderSizePixel = 0
	Tab.Size = UDim2.new(1, 0, 0.15209125, 0)
	Tab.Font = Enum.Font.Arial
	Tab.Text = ""
	Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tab.TextSize = 22.000
	Tab.TextWrapped = true
	
	Tab2.Parent = Tab
	Tab2.AnchorPoint = Vector2.new(0.5, 0.5)
	Tab2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab2.BackgroundTransparency = 1.000
	Tab2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab2.BorderSizePixel = 0
	Tab2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Tab2.Size = UDim2.new(0.821710944, 0, 0.550000012, 0)
	Tab2.Font = Enum.Font.Gotham
	Tab2.Text = options.TabName
	Tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Tab2.TextScaled = true
	Tab2.TextSize = 14.000
	Tab2.TextWrapped = true
	
	function tabApi.enable(val)
		if val then
			wearwarev2.Frame[options.TabName].Visible = true
			tabApi.Enabled = val
			if GodSploit.config.Tweens.Enabled then tweenService:Create(Tab2, TweenInfo.new(GodSploit.config.TweenSpeed.Value), {TextColor3 = Color3.fromRGB(255, 170, 0)}):Play() else Tab2.TextColor3 = Color3.fromRGB(187, 15, 255) end
		elseif not val then
			wearwarev2.Frame[options.TabName].Visible = false
			tabApi.Enabled = val
			if GodSploit.config.Tweens.Enabled then tweenService:Create(Tab2, TweenInfo.new(GodSploit.config.TweenSpeed.Value), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play() else Tab2.TextColor3 = Color3.fromRGB(255, 255, 255) end
		end
	end
	
	Tab.MouseButton1Click:Connect(function()
		tabApi.Enabled = not tabApi.Enabled
		tabApi.enable(tabApi.Enabled)
	end)
	
	return tabApi
end

function CreateWindow(options)
	GodSploit.UiWindows += 1
	
	local WindowApi = {}
	
	local Window = Instance.new("Frame")
	local Content = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local scroll = Instance.new("ScrollingFrame")
	local MainBar = Instance.new("Frame")
	local WindowName = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	Window.Name = options.WindowName
	Window.Parent = wearwarev2.Frame
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
	Window.BackgroundTransparency = 1.000
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(wearwarev2.Frame["MainFrameHolder"].Position.X.Scale + (0.135 * GodSploit.UiWindows), 0, wearwarev2.Frame["MainFrameHolder"].Position.Y.Scale, 0)
	Window.Size = UDim2.new(0.11391633, 0, 0.449526161, 0)
	Window.Visible = false
	Window.ZIndex = GodSploit.UiWindows
	addDrag(Window)
	Content.Name = "Content"
	Content.Parent = Window
	Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Content.BackgroundTransparency = 0.300
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.ClipsDescendants = true
	Content.Position = UDim2.new(0, 0, 0.134, 0)
	Content.Size = UDim2.new(0.99999994, 0, -0.000734500471, 0)
	Content.AnchorPoint = Vector2.new(0, 1)
	scroll.Name = "scroll"
	scroll.Parent = Content
	scroll.Active = true
	scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroll.BackgroundTransparency = 1.000
	scroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
	scroll.BorderSizePixel = 0
	scroll.Size = UDim2.new(1, 0, 1, 0)
	scroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scroll.ScrollBarThickness = 2
	UIListLayout.Parent = scroll
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	MainBar.Name = "MainBar"
	MainBar.Parent = Window
	MainBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MainBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainBar.BorderSizePixel = 0
	MainBar.Size = UDim2.new(1, 0, 0.132013202, 0)
	WindowName.Name = "WindowName"
	WindowName.Parent = MainBar
	WindowName.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0.498203486, 0, 0.478459448, 0)
	WindowName.Size = UDim2.new(0.892465413, 0, 0.598627925, 0)
	WindowName.ZIndex = 999
	WindowName.Font = Enum.Font.Gotham
	WindowName.Text = options.WindowName
	WindowName.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.TextScaled = true
	WindowName.TextSize = 14.000
	WindowName.TextWrapped = true
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = 90
	UIGradient.Parent = WindowName
	UIAspectRatioConstraint.Parent = Window
	UIAspectRatioConstraint.AspectRatio = 0.528
	UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	
	WindowApi.CreateModule = function(options)
		local ButtonApi = {}
		
		scroll.CanvasSize = UDim2.new(0,0,0,scroll.UIListLayout.AbsoluteContentSize.Y + Content.Size.Y.Offset + scroll.UIListLayout.Padding.Offset)
		Content.Size = UDim2.new(1, 0, Content.Size.Y.Scale + -0.133, 0)
		
		local Button = Instance.new("TextButton")
		local TextLabel = Instance.new("TextLabel")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UIGradient = Instance.new("UIGradient")
		Button.Name = options["Name"]
		Button.Parent = scroll
		Button.Active = false
		Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.BorderSizePixel = 0
		Button.Selectable = false
		Button.Size = UDim2.new(1, 0, 0, 45)
		Button.BackgroundTransparency = 1
		Button.Text = ""
		TextLabel.Parent = Button
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.5, 0, 0.528309822, 0)
		TextLabel.Size = UDim2.new(1, 0, 0.54957819, 0)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = options["Name"]
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.BackgroundTransparency = 1
		UIAspectRatioConstraint.Parent = Button
		UIAspectRatioConstraint.AspectRatio = 3.997
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = TextLabel
		UIGradient.Enabled = false
		local enb = GodSploit.modules[options["Name"].Enabled]
		ButtonApi.ToggleButton = function(newValue)
			enb = newValue
			
			if newValue then
				UIGradient.Enabled = true
			else
				UIGradient.Enabled = false
			end
			
			options.Callback(newValue)
			Settings[options["Name"]] = newValue
			saveSettings()
		end
		Button.MouseButton1Click:Connect(function()
			enb = not enb
			ButtonApi.ToggleButton(enb)
		end)
		
		ButtonApi.UninjectConnection = nil
		ButtonApi.UninjectConnection = wearwarev2:GetAttributeChangedSignal(securityId):Connect(function()
			if enb then ButtonApi.ToggleButton(false) end
			ButtonApi.UninjectConnection:Disconnect()
		end)

		Settings[options["Name"]] = false
		
		return ButtonApi
	end
	
	return WindowApi
end

task.spawn(function()
	local combatTab = CreateTab({
		TabName = "Combat"
	})
end)

task.spawn(function()
	local blatantTab = CreateTab({
		TabName = "Blatant"
	})
end)

task.spawn(function()
	local utilityTab = CreateTab({
		TabName = "Utility"
	})
end)

task.spawn(function()
	local worldTab = CreateTab({
		TabName = "World"
	})
end)

task.spawn(function()
	local settingsTab = CreateTab({
		TabName = "Settings"
	})
end)

task.spawn(function()
	local combatWindow = CreateWindow({
		WindowName = "Combat"
	})
	
	local oldSpeed
	local wsConnection
	local Speed = combatWindow.CreateModule({
		Name = "Speed",
		Callback = function(callback)
			if callback then
				oldSpeed = lplr.Character.Humanoid.WalkSpeed
				lplr.Character.Humanoid.WalkSpeed = oldSpeed + 25
				wsConnection = lplr.CharacterAdded:Connect(function()
					wait(3)
					oldSpeed = lplr.Character.Humanoid.WalkSpeed
					lplr.Character.Humanoid.WalkSpeed = oldSpeed + 25
				end)
			else
				lplr.Character.Humanoid.WalkSpeed = oldSpeed
				wsConnection:Disconnect()
			end
		end,
	})
end)

task.spawn(function()
	local blatantWindow = CreateWindow({
		WindowName = "Blatant"
	})
	
	local oldJump
	local hjConnection
	local Highjump = blatantWindow.CreateModule({
		Name = "Highjump",
		Callback = function(callback)
			if callback then
				oldJump = lplr.Character.Humanoid.JumpPower
				lplr.Character.Humanoid.JumpPower = oldJump + 25
				hjConnection = lplr.CharacterAdded:Connect(function()
					wait(3)
					oldJump = lplr.Character.Humanoid.JumpPower
					lplr.Character.Humanoid.JumpPower = oldJump + 25
				end)
			else
				lplr.Character.Humanoid.JumpPower = oldJump
				hjConnection:Disconnect()
			end
		end,
	})
	
	local infJumpConnection
	local InfiniteJump = blatantWindow.CreateModule({
		Name = "InfiniteJump",
		Callback = function(callback)
			if callback then
				infJumpConnection = UIS.JumpRequest:Connect(function()
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			else
				infJumpConnection:Disconnect()
			end
		end,
	})
end)

task.spawn(function()
	local utilityWindow = CreateWindow({
		WindowName = "Utility"
	})
	local target = nil
	local DirectionAssistLoop = nil
	local DirectionAssist = utilityWindow.CreateModule({
		Name = "DirectionAssist",
		Callback = function(callback)
			if callback then
				runService:BindToRenderStep("DirectionAssistLoop", 1, function()
					target = EntityNearPosition(10)
					if target ~= nil then
						lplr.Character:SetPrimaryPartCFrame(CFrame.new(lplr.Character.PrimaryPart.Position,Vector3.new(target.Character:FindFirstChild("HumanoidRootPart").Position.X,lplr.Character.PrimaryPart.Position.Y,target.Character:FindFirstChild("HumanoidRootPart").Position.Z)))
					end
				end)
			else
				target = nil
				runService:UnbindFromRenderStep("DirectionAssistLoop")
			end
		end,
	})
	local oldFOV
	local FOVChanger = utilityWindow.CreateModule({
	Name = "FOVChanger",
		Callback = function(callback)
			if callback then
				oldFOV = workspace.Camera.FieldOfView
				workspace.Camera.FieldOfView = 120
			else
				workspace.Camera.FieldOfView = oldFOV
			end
		end,
	})
	

end)

task.spawn(function()
	local worldWindow = CreateWindow({
		WindowName = "World"
	})
	
	local espHighlightObjConnection = {}
	local function addChams(player)
		local espHighlightObj = Instance.new("Highlight")
		espHighlightObj.Parent = player.Character
		espHighlightObj.Name = "espHighlightObj"
	end
	local Chams = worldWindow.CreateModule({
		Name = "Chams",
		Callback = function(callback)
			if callback then
				for _, v in players:GetPlayers() do
					addChams(v)
					
					espHighlightObjConnection[v.Name] = v.CharacterAdded:Connect(function()	
						addChams(v)
					end)
				end
				
				players.PlayerAdded:Connect(function(plr)
					addChams(plr)
					espHighlightObjConnection[plr.Name] = plr.CharacterAdded:Connect(function()
						addChams(plr)
					end)
				end)
				
				players.PlayerRemoving:Connect(function(plr)
					espHighlightObjConnection[plr.Name]:Disconnect()
				end)
			else
				for _, v in players:GetPlayers() do
					if v.Character:FindFirstChild("espHighlightObj") then
						v.Character.espHighlightObj:Destroy()
						espHighlightObjConnection[v.Name]:Disconnect()
					end
				end
			end
		end,
	})
end)

task.spawn(function()
	local settingsWindow = CreateWindow({
		WindowName = "Settings"
	})
	
	local uninjectModule = nil
	local uninjectModule = settingsWindow.CreateModule({
		Name = "Uninject",
		Callback = function(callback)
			if callback then
				uninject()
				uninjectModule.ToggleButton(false)
			end
		end,
	})
end)

function godsploitui() 
	GodSploit.Open.Value = not GodSploit.Open.Value
	if GodSploit.Open.Value then
		wearwarev2.Frame.Visible = true
	else
		wearwarev2.Frame.Visible = false 
	end
end

--if GodSploit.Open.Value == false then godsploitui() end

UIS.InputBegan:Connect(function(input)
	if not shared.GodSploitInjected then return end
	
	if input.KeyCode == Enum.KeyCode[GodSploit.config.OpenKeybind.Value] then
		godsploitui()
	end
end)

local openui = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UIStroke = Instance.new("UIStroke")
openui.Name = "openui"
openui.Parent = wearwarev2
openui.Active = false
openui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
openui.BorderColor3 = Color3.fromRGB(0, 0, 0)
openui.BorderSizePixel = 0
openui.Position = UDim2.new(0.950720549, 0, 0.549605966, 0)
openui.Selectable = false
openui.Size = UDim2.new(0.0391735733, 0, 0.0837961882, 0)
openui.Image = "rbxassetid://16296032484"
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = openui
UIAspectRatioConstraint.Parent = openui
UIAspectRatioConstraint.AspectRatio = 0.996
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 170, 0)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = openui
openui.MouseButton1Click:Connect(godsploitui)

function loadSettings()
	for v, e in httpService:JSONDecode(readfile("savedModulesFile.json")) do
		Settings[v] = e
        print(v, e)
	end
end


local endTick = tick() - startTick

CreateNotification("GodSploit","Loaded in "..tostring(endTick):sub(1, 6).." seconds", 10)
