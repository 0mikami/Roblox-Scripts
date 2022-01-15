local Success, Error = pcall(function()
	local CarnageLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/0mikami/Roblox-Scripts/main/CarnageLibrary.lua"))()

	local MainBox, GuiActive, NavigationBar, CurrentPagePointer = CarnageLibrary:MainBox()

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local PlayerPageFrame, PlayerPageButton = CarnageLibrary:NewPage("Player")
	PlayerPageFrame.Parent = MainBox
	PlayerPageButton.Parent = NavigationBar

	local PlayerPageFirstSection = CarnageLibrary:NewSection()
	PlayerPageFirstSection.Parent = PlayerPageFrame

	local PlayerPageSecondSection = CarnageLibrary:NewSection()
	PlayerPageSecondSection.Parent = PlayerPageFrame

	local PlayerPageThirdSection = CarnageLibrary:NewSection()
	PlayerPageThirdSection.Parent = PlayerPageFrame

	----------------------------------------------------------------------------------------------------

	local MovementFeatureFrame = CarnageLibrary:NewFeature("Movement")
	MovementFeatureFrame.Parent = PlayerPageFirstSection

	local WalkSpeedRB, WalkSpeedRBActive = CarnageLibrary:NewRadioButton("Walk Speed")
	WalkSpeedRB.Parent = MovementFeatureFrame

	local WalkSpeedSHF, WalkSpeedSP, WalkSpeedSTB, WalkSpeedSN = CarnageLibrary:NewSlider("Speed", 16, 200)
	WalkSpeedSHF.Parent = MovementFeatureFrame

	local PseudoWalkSpeedRB, PseudoWalkSpeedRBActive = CarnageLibrary:NewRadioButton("Pseudo Walk Speed")
	PseudoWalkSpeedRB.Parent = MovementFeatureFrame

	local PseudoWalkSpeedSHF, PseudoWalkSpeedSP, PseudoWalkSpeedSTB, PseudoWalkSpeedSN = CarnageLibrary:NewSlider("Speed", 16, 200)
	PseudoWalkSpeedSHF.Parent = MovementFeatureFrame

	local JumpPowerRB, JumpPowerRBActive = CarnageLibrary:NewRadioButton("Jump Power")
	JumpPowerRB.Parent = MovementFeatureFrame

	local JumpPowerSHF, JumpPowerSP, JumpPowerSTB, JumpPowerSN = CarnageLibrary:NewSlider("JumpPower", 50, 500)
	JumpPowerSHF.Parent = MovementFeatureFrame

	local PseudoJumpPowerRB, PseudoJumpPowerRBActive = CarnageLibrary:NewRadioButton("Pseudo Jump Power")
	PseudoJumpPowerRB.Parent = MovementFeatureFrame

	local PseudoJumpPowerSHF, PseudoJumpPowerSP, PseudoJumpPowerSTB, PseudoJumpPowerSN = CarnageLibrary:NewSlider("JumpPower", 50, 500)
	PseudoJumpPowerSHF.Parent = MovementFeatureFrame

	local FlyRB, FlyRBActive = CarnageLibrary:NewRadioButton("Fly")
	FlyRB.Parent = MovementFeatureFrame

	local FlySHF, FlySP, FlySTB, FlySN = CarnageLibrary:NewSlider("Speed", 50, 200)
	FlySHF.Parent = MovementFeatureFrame

	----------------------------------------------------------------------------------------------------

	local ChatLogsFeatureFrame = CarnageLibrary:NewFeature("Chat Logs")
	ChatLogsFeatureFrame.Parent = PlayerPageSecondSection

	local ChatLogsEnabledRB, ChatLogsEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	ChatLogsEnabledRB.Parent = ChatLogsFeatureFrame

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local VisualPageFrame, VisualPageButton = CarnageLibrary:NewPage("Visuals")
	VisualPageFrame.Parent = MainBox
	VisualPageButton.Parent = NavigationBar

	local VisualPageFirstSection = CarnageLibrary:NewSection()
	VisualPageFirstSection.Parent = VisualPageFrame

	----------------------------------------------------------------------------------------------------

	local LightingFeatureFrame = CarnageLibrary:NewFeature("Lighting")
	LightingFeatureFrame.Parent = VisualPageFirstSection

	local NoFogRB, NoFogRBActive = CarnageLibrary:NewRadioButton("No Fog")
	NoFogRB.Parent = LightingFeatureFrame

	local FullBrightRB, FullBrightRBActive = CarnageLibrary:NewRadioButton("Full Bright")
	FullBrightRB.Parent = LightingFeatureFrame

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local EspPageFrame, EspPageButton = CarnageLibrary:NewPage("ESP")
	EspPageFrame.Parent = MainBox
	EspPageButton.Parent = NavigationBar

	local EspPageFirstSection = CarnageLibrary:NewSection()
	EspPageFirstSection.Parent = EspPageFrame

	local EspPageSecondSection = CarnageLibrary:NewSection()
	EspPageSecondSection.Parent = EspPageFrame

	local EspPageThirdSection = CarnageLibrary:NewSection()
	EspPageThirdSection.Parent = EspPageFrame

	----------------------------------------------------------------------------------------------------

	local PlayerEspFeatureFrame = CarnageLibrary:NewFeature("Player Esp")
	PlayerEspFeatureFrame.Parent = EspPageFirstSection

	local PlayerEspEnabledRB, PlayerEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	PlayerEspEnabledRB.Parent = PlayerEspFeatureFrame

	local PlayerEspShowGameNameRB, PlayerEspShowGameNameRBActive = CarnageLibrary:NewRadioButton("Show Game Name")
	PlayerEspShowGameNameRB.Parent = PlayerEspFeatureFrame

	local PlayerEspShowGuildRB, PlayerEspShowGuildRBActive = CarnageLibrary:NewRadioButton("Show Guild")
	PlayerEspShowGuildRB.Parent = PlayerEspFeatureFrame

	local PlayerEspShowHealthRB, PlayerEspShowHealthRBActive = CarnageLibrary:NewRadioButton("Show Health")
	PlayerEspShowHealthRB.Parent = PlayerEspFeatureFrame

	local PlayerEspShowDistanceRB, PlayerEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	PlayerEspShowDistanceRB.Parent = PlayerEspFeatureFrame

	local PlayerEspDistanceSHF, PlayerEspDistanceSP, PlayerEspDistanceSTB, PlayerEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	PlayerEspDistanceSHF.Parent = PlayerEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local MobEspFeatureFrame = CarnageLibrary:NewFeature("Mob Esp")
	MobEspFeatureFrame.Parent = EspPageFirstSection

	local MobEspEnabledRB, MobEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	MobEspEnabledRB.Parent = MobEspFeatureFrame

	local MobEspShowHealthRB, MobEspShowHealthRBActive = CarnageLibrary:NewRadioButton("Show Health")
	MobEspShowHealthRB.Parent = MobEspFeatureFrame

	local MobEspShowDistanceRB, MobEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	MobEspShowDistanceRB.Parent = MobEspFeatureFrame

	local MobEspDistanceSHF, MobEspDistanceSP, MobEspDistanceSTB, MobEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	MobEspDistanceSHF.Parent = MobEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local NPCEspFeatureFrame = CarnageLibrary:NewFeature("NPC Esp")
	NPCEspFeatureFrame.Parent = EspPageFirstSection

	local NPCEspEnabledRB, NPCEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	NPCEspEnabledRB.Parent = NPCEspFeatureFrame

	local NPCEspShowDistanceRB, NPCEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	NPCEspShowDistanceRB.Parent = NPCEspFeatureFrame

	local NPCEspDistanceSHF, NPCEspDistanceSP, NPCEspDistanceSTB, NPCEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	NPCEspDistanceSHF.Parent = NPCEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local ObjectEspFeatureFrame = CarnageLibrary:NewFeature("Item Esp")
	ObjectEspFeatureFrame.Parent = EspPageSecondSection

	local ObjectEspEnabledRB, ObjectEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	ObjectEspEnabledRB.Parent = ObjectEspFeatureFrame

	local ObjectEspShowDistanceRB, ObjectEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	ObjectEspShowDistanceRB.Parent = ObjectEspFeatureFrame

	local ObjectEspChestCB, ObjectEspChestCBActive = CarnageLibrary:NewCheckboxButton("Chest")
	ObjectEspChestCB.Parent = ObjectEspFeatureFrame

	local ObjectEspArtifactCB, ObjectEspArtifactCBActive = CarnageLibrary:NewCheckboxButton("Artifact")
	ObjectEspArtifactCB.Parent = ObjectEspFeatureFrame

	local ObjectEspLootBagCB, ObjectEspLootBagCBActive = CarnageLibrary:NewCheckboxButton("Loot Bag")
	ObjectEspLootBagCB.Parent = ObjectEspFeatureFrame

	local ObjectEspDistanceSHF, ObjectEspDistanceSP, ObjectEspDistanceSTB, ObjectEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	ObjectEspDistanceSHF.Parent = ObjectEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local IngredientEspFeatureFrame = CarnageLibrary:NewFeature("Ingredient Esp")
	IngredientEspFeatureFrame.Parent = EspPageSecondSection

	local IngredientEspEnabledRB, IngredientEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	IngredientEspEnabledRB.Parent = IngredientEspFeatureFrame

	local IngredientEspShowDistanceRB, IngredientEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	IngredientEspShowDistanceRB.Parent = IngredientEspFeatureFrame

	local IngredientEspDistanceSHF, IngredientEspDistanceSP, IngredientEspDistanceSTB, IngredientEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	IngredientEspDistanceSHF.Parent = IngredientEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local OreEspFeatureFrame = CarnageLibrary:NewFeature("Ore Esp")
	OreEspFeatureFrame.Parent = EspPageSecondSection

	local OreEspEnabledRB, OreEspEnabledRBActive = CarnageLibrary:NewRadioButton("Enabled")
	OreEspEnabledRB.Parent = OreEspFeatureFrame

	local OreEspShowDistanceRB, OreEspShowDistanceRBActive = CarnageLibrary:NewRadioButton("Show Distance")
	OreEspShowDistanceRB.Parent = OreEspFeatureFrame

	local OreEspDistanceSHF, OreEspDistanceSP, OreEspDistanceSTB, OreEspDistanceSN = CarnageLibrary:NewSlider("Distance", 5000, 20000)
	OreEspDistanceSHF.Parent = OreEspFeatureFrame

	----------------------------------------------------------------------------------------------------

	local EspPageKeybindsFeature = CarnageLibrary:NewFeature("Keybinds")
	EspPageKeybindsFeature.Parent = EspPageThirdSection

	local PlayerEspKeybindSetter = CarnageLibrary:NewKeybindSetter("Player Esp", PlayerEspEnabledRBActive)
	PlayerEspKeybindSetter.Parent = EspPageKeybindsFeature

	local MobEspKeybindSetter = CarnageLibrary:NewKeybindSetter("Mob Esp", MobEspEnabledRBActive)
	MobEspKeybindSetter.Parent = EspPageKeybindsFeature

	local NPCEspKeybindSetter = CarnageLibrary:NewKeybindSetter("NPC Esp", NPCEspEnabledRBActive)
	NPCEspKeybindSetter.Parent = EspPageKeybindsFeature

	local ObjectEspKeybindSetter = CarnageLibrary:NewKeybindSetter("Item Esp", ObjectEspEnabledRBActive)
	ObjectEspKeybindSetter.Parent = EspPageKeybindsFeature

	local IngredientEspKeybindSetter = CarnageLibrary:NewKeybindSetter("Ingredient Esp", IngredientEspEnabledRBActive)
	IngredientEspKeybindSetter.Parent = EspPageKeybindsFeature

	local OreEspKeybindSetter = CarnageLibrary:NewKeybindSetter("Ore Esp", OreEspEnabledRBActive)
	OreEspKeybindSetter.Parent = EspPageKeybindsFeature

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local SettingPageFrame, SettingPageButton = CarnageLibrary:NewPage("Settings")
	SettingPageFrame.Parent = MainBox
	SettingPageButton.Parent = NavigationBar

	local SettingPageFirstSection = CarnageLibrary:NewSection()
	SettingPageFirstSection.Parent = SettingPageFrame

	local GuiOptionsFeatureFrame = CarnageLibrary:NewFeature("GUI Options")
	GuiOptionsFeatureFrame.Parent = SettingPageFirstSection

	local GuiToggleKeybindSetter = CarnageLibrary:NewKeybindSetter("GUI Toggle", GuiActive)
	GuiToggleKeybindSetter.Parent = GuiOptionsFeatureFrame

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputservice = game:GetService("UserInputService")

	local LocalPlayer = Players.LocalPlayer
	local LocalCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local LocalRootPart = LocalCharacter:WaitForChild("HumanoidRootPart")
	local LocalHumanoid = LocalCharacter:WaitForChild("Humanoid")
	local Camera = workspace.CurrentCamera

	LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
		LocalCharacter = NewCharacter
		LocalRootPart = LocalCharacter:WaitForChild("HumanoidRootPart")
		LocalHumanoid = LocalCharacter:WaitForChild("Humanoid")
	end)

	local function RoundNumber(Number)
		return math.round(Number)
	end

	local function MagnitudeCheck(Object1, Object2)
		return (Object1.Position - Object2.Position).Magnitude
	end

	local function IsTableEmpty(Table)
		return next(Table) == nil
	end

	local function GetPlayerInfo(Player)
		local LeaderStats = Player:WaitForChild("leaderstats")
		local FirstName = LeaderStats:WaitForChild("FirstName")
		local LastName = LeaderStats:WaitForChild("LastName")
		local Guild = LeaderStats:WaitForChild("Guild").Value

		local GameName = FirstName.Value.." "..LastName.Value
		local UserName = Player.Name

		return GameName, UserName, Guild
	end

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local ChatLogsBox, ChatTable, AddChatText = CarnageLibrary:ChatLogs()

	local function InitializeChatLogs()
		local PlayerList = Players:GetPlayers()

		for PlayerIndex = 1, #PlayerList do
			local Player = PlayerList[PlayerIndex]
			local GameName, UserName = GetPlayerInfo(Player)

			Player.Chatted:Connect(function(Chat)
				AddChatText(GameName, UserName, Chat)

				if #ChatTable > 100 then
					ChatTable[1]:Destroy()
					table.remove(ChatTable, 1)
				end
			end)
		end
	end

	InitializeChatLogs()

	if ChatLogsEnabledRBActive.Value then
		ChatLogsBox.Visible = true
	else
		ChatLogsBox.Visible = false
	end

	ChatLogsEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			ChatLogsBox.Visible = true
		else
			ChatLogsBox.Visible = false
		end
	end)

	Players.PlayerAdded:Connect(function(Player)
		local GameName, UserName = GetPlayerInfo(Player)

		Player.Chatted:Connect(function(Chat)
			AddChatText(GameName, UserName, Chat)

			if #ChatTable > 100 then
				ChatTable[1]:Destroy()
				table.remove(ChatTable, 1)
			end
		end)
	end)

	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	local PlayerConnections = {}
	local PlayerTable = {}
	local MobTable = {}
	local NPCTable = {}
	local ObjectTable = {}
	local IngredientTable = {}
	local OreTable = {}

	local LiveFolder = workspace.Live
	local NPCFolder = workspace.NPCs
	local ThrownFolder = workspace.Thrown
	local IngredientFolder = workspace.Ingredients

	----------------------------------------------------------------------------------------------------

	local function CreateConnectionTable(ConnectionTable, ConnectionType, RenderStepConnection, InstanceConnection, EspConnection)
		local Table = {
			["RenderStepConnection"] = RenderStepConnection,
			[ConnectionType.."Instance"] = InstanceConnection,
			[ConnectionType.."Esp"] = EspConnection
		}

		table.insert(ConnectionTable, Table)
	end

	local function ClearConnectionTable(ConnectionTable, ConnectionType, InstanceConnection)
		if InstanceConnection then
			for Index = 1, #ConnectionTable do
				if ConnectionTable[Index] then
					if ConnectionTable[Index][ConnectionType.."Instance"] == InstanceConnection then
						if ConnectionTable[Index]["RenderStepConnection"] then
							ConnectionTable[Index]["RenderStepConnection"]:Disconnect()
						end

						if ConnectionTable[Index][ConnectionType.."Esp"] then
							ConnectionTable[Index][ConnectionType.."Esp"]:Remove()
							ConnectionTable[Index][ConnectionType.."Esp"] = nil
						end

						ConnectionTable[Index][ConnectionType.."Instance"] = nil

						table.remove(ConnectionTable, Index)

						break
					end
				end
			end
		else
			for Index = 1, #ConnectionTable do
				if ConnectionTable[Index] then
					if ConnectionTable[Index]["RenderStepConnection"] then
						ConnectionTable[Index]["RenderStepConnection"]:Disconnect()
					end

					if ConnectionTable[Index][ConnectionType.."Esp"] then
						ConnectionTable[Index][ConnectionType.."Esp"]:Remove()
						ConnectionTable[Index][ConnectionType.."Esp"] = nil
					end

					ConnectionTable[Index][ConnectionType.."Instance"] = nil

					table.remove(ConnectionTable, Index)
				end
			end
		end
	end

	local function CreateEspText()
		local EspText = Drawing.new("Text")
		EspText.Visible = true
		EspText.Color = Color3.new(1,1,1)
		EspText.Size = 18
		EspText.Center = true
		EspText.Outline = true
		EspText.OutlineColor = Color3.new(0,0,0)

		return EspText
	end

	local function FormatEspText(Type, Text, Distance, Health, MaxHealth, GameName, UserName, Guild)
		if Text ~= "" then
			Text = Text.."\n"
		end
		if Distance then
			if Health and MaxHealth then
				local HealthPercentage = RoundNumber((Health/MaxHealth) * 100)

				if Type == "Player" then
					if GameName and UserName and Guild then
						if PlayerEspShowGameNameRBActive.Value then
							Text = Text.."["..GameName.."]".."\n"
						end
						Text = Text..UserName.."\n"
						if PlayerEspShowGuildRBActive.Value then
							if Guild ~= "" then
								Text = Text..Guild.."\n"
							end
						end
					end

					if PlayerEspShowHealthRBActive.Value then
						Text = Text.."["..tostring(Health).."/"..tostring(MaxHealth).."]".."["..tostring(HealthPercentage).."%".."]"
						Text = Text.."\n"
					end
				elseif Type == "Mob" then
					Text = string.gsub(Text, "%.", "")
					Text = string.gsub(Text, "_", " ")
					Text = string.gsub(Text, "%d+", "")
					Text = string.upper(Text)

					if MobEspShowHealthRBActive.Value then
						Text = Text.."["..tostring(Health).."/"..tostring(MaxHealth).."]".."["..tostring(HealthPercentage).."%".."]"
						Text = Text.."\n"
					end
				end
			end
			if Type == "Player" then
				if PlayerEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			elseif Type == "Mob" then
				if MobEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			elseif Type == "NPC" then
				if NPCEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			elseif Type == "Object" then
				if ObjectEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			elseif Type == "Ingredient" then
				if IngredientEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			elseif Type == "Ore" then
				if OreEspShowDistanceRBActive.Value then
					Text = Text.."["..tostring(Distance).."]"
				end
			end
		end

		return Text
	end

	local function UpdateEsp(Type, Name, Esp, Part, Character, GameName, UserName, Guild)
		local Distance = nil
		local Health = nil
		local MaxHealth = nil

		if Part then
			local Position, OnScreen = Camera:WorldToScreenPoint(Part.Position)
			Distance = RoundNumber(MagnitudeCheck(Part, LocalRootPart))

			if Type == "Object" then
				if ObjectEspEnabledRBActive.Value then
					if MagnitudeCheck(Part, LocalRootPart) < ObjectEspDistanceSN and OnScreen then
						Esp.Visible = true
						Esp.Position = Vector2.new(Position.X, Position.Y - 25)

						if Part.Name == "HoldForge" then
							if not ObjectEspArtifactCBActive.Value then
								Esp.Visible = false
							end
						elseif Part.Name == "LootDrop" or Part.Name == "BagDrop" then
							if not ObjectEspLootBagCBActive.Value then
								Esp.Visible = false
							end
						elseif Part.Name == "RootPart" then
							if not ObjectEspChestCBActive.Value then
								Esp.Visible = false
							end
						end
					else
						Esp.Visible = false
					end
				else
					Esp.Visible = false
				end
			elseif Type == "Ingredient" then
				if IngredientEspEnabledRBActive.Value then
					if MagnitudeCheck(Part, LocalRootPart) < IngredientEspDistanceSN and OnScreen then
						Esp.Visible = true
						Esp.Position = Vector2.new(Position.X, Position.Y - 25)
					else
						Esp.Visible = false
					end
				else
					Esp.Visible = false
				end
			elseif Type == "Ore" then
				if OreEspEnabledRBActive.Value then
					if MagnitudeCheck(Part, LocalRootPart) < OreEspDistanceSN and OnScreen then
						Esp.Visible = true
						Esp.Position = Vector2.new(Position.X, Position.Y - 25)
					else
						Esp.Visible = false
					end
				else
					Esp.Visible = false
				end
			end

			if Character then
				if Character:FindFirstChild("Humanoid") then
					Health = RoundNumber(Character.Humanoid.Health)
					MaxHealth = RoundNumber(Character.Humanoid.MaxHealth)
				end

				if Type == "Mob" then
					if MobEspEnabledRBActive.Value then
						if MagnitudeCheck(Part, LocalRootPart) < MobEspDistanceSN and OnScreen then
							Esp.Visible = true
							Esp.Position = Vector2.new(Position.X, Position.Y - 30)
						else
							Esp.Visible = false
						end
					else
						Esp.Visible = false
					end
				elseif Type == "NPC" then
					if NPCEspEnabledRBActive.Value then
						if MagnitudeCheck(Part, LocalRootPart) < NPCEspDistanceSN and OnScreen then
							Esp.Visible = true
							Esp.Position = Vector2.new(Position.X, Position.Y - 30)
						else
							Esp.Visible = false
						end
					else
						Esp.Visible = false
					end
				elseif Type == "Player" then
					if GameName and UserName and Guild then
						if PlayerEspEnabledRBActive.Value then
							if MagnitudeCheck(Part, LocalRootPart) < PlayerEspDistanceSN and OnScreen then
								Esp.Visible = true
								Esp.Position = Vector2.new(Position.X, Position.Y - 50)
							else
								Esp.Visible = false
							end
						else
							Esp.Visible= false
						end
					end
				end
			end

			if not OnScreen then
				Esp.Visible = false
			end
		end

		Esp.Text = FormatEspText(Type, Name, Distance, Health, MaxHealth, GameName, UserName, Guild)
	end

	local function CreateEsp(Type, Name, Part, Character, GameName, UserName, Guild)
		local Esp = CreateEspText()

		local OriginalOwner = ""

		local RenderStepConnection = RunService.RenderStepped:Connect(function()
			if Type == "Object" then
				if Part:FindFirstChild("OriginalOwner") and OriginalOwner == "" then
					OriginalOwner = Part.OriginalOwner.Value
				end
				if OriginalOwner ~= "" then
					if Name == "Loot" then
						Name = OriginalOwner.."'s Loot"
					elseif Name == "Death Loot" then
						Name = OriginalOwner.."'s Death Loot"
					end
				end
			end

			UpdateEsp(Type, Name, Esp, Part, Character, GameName, UserName, Guild)
		end)

		return Esp, RenderStepConnection
	end

	----------------------------------------------------------------------------------------------------

	local function CreateInitialPlayerEsp()
		local PlayerChildren = Players:GetPlayers()

		for PlayerIndex = 1, #PlayerChildren do
			local Player = PlayerChildren[PlayerIndex]

			if Player ~= LocalPlayer then
				local Character = Player.Character
				local GameName, UserName, Guild = GetPlayerInfo(Player)

				if Character then
					if Character:FindFirstChild("HumanoidRootPart") then
						local HumanoidRootPart = Character.HumanoidRootPart

						ClearConnectionTable(PlayerTable, "Player", Character)

						local Esp, RenderStepConnection = CreateEsp("Player", "", HumanoidRootPart, Character, GameName, UserName, Guild)

						CreateConnectionTable(PlayerTable, "Player", RenderStepConnection, Character, Esp)
					end

					Character.ChildAdded:Connect(function(Child)
						if PlayerEspEnabledRBActive.Value then
							if Child.Name == "HumanoidRootPart" then
								ClearConnectionTable(PlayerTable, "Player", Character)

								local Esp, RenderStepConnection = CreateEsp("Player", "", Child, Character, GameName, UserName, Guild)

								CreateConnectionTable(PlayerTable, "Player", RenderStepConnection, Character, Esp)
							end
						end
					end)

					Character.ChildRemoved:Connect(function(Child)
						if Child.Name == "HumanoidRootPart" then
							ClearConnectionTable(PlayerTable, "Player", Character)
						end
					end)
				end

				Player.CharacterAdded:Connect(function(Character)
					if PlayerEspEnabledRBActive.Value then
						local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")	

						ClearConnectionTable(PlayerTable, "Player", Character)

						local Esp, RenderStepConnection = CreateEsp("Player", "", HumanoidRootPart, Character, GameName, UserName, Guild)

						CreateConnectionTable(PlayerTable, "Player", RenderStepConnection, Character, Esp)
					end
				end)

				Player.CharacterRemoving:Connect(function(Character)
					ClearConnectionTable(PlayerTable, "Player", Character)
				end)
			end
		end
	end

	if PlayerEspEnabledRBActive.Value then
		CreateInitialPlayerEsp()
	end

	PlayerEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialPlayerEsp()
		else
			while not IsTableEmpty(PlayerTable) do
				ClearConnectionTable(PlayerTable, "Player")
			end
		end
	end)

	Players.PlayerAdded:Connect(function(Player)
		if PlayerEspEnabledRBActive.Value then
			if Player ~= LocalPlayer then
				local GameName, UserName, Guild = GetPlayerInfo(Player)

				Player.CharacterAdded:Connect(function(Character)
					if PlayerEspEnabledRBActive.Value then
						local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

						ClearConnectionTable(PlayerTable, "Player", Character)

						local Esp, RenderStepConnection = CreateEsp("Player", "", HumanoidRootPart, Character, GameName, UserName, Guild)

						CreateConnectionTable(PlayerTable, "Player", RenderStepConnection, Character, Esp)
					end
				end)

				Player.CharacterRemoving:Connect(function(Character)
					ClearConnectionTable(PlayerTable, "Player", Character)
				end)
			end
		end
	end)

	Players.PlayerRemoving:Connect(function(Player)
		if Player ~= LocalPlayer then
		end
	end)

	----------------------------------------------------------------------------------------------------

	local function CreateInitialMobEsp()
		local MobChildren = LiveFolder:GetChildren()

		for MobIndex = 1, #MobChildren do
			local Mob = MobChildren[MobIndex]

			if Mob:FindFirstChild("HumanoidRootPart") then
				if not Players:GetPlayerFromCharacter(Mob) then
					local HumanoidRootPart = Mob.HumanoidRootPart

					ClearConnectionTable(MobTable, "Mob", Mob)

					local Esp, RenderStepConnection = CreateEsp("Mob", Mob.Name, HumanoidRootPart, Mob)

					CreateConnectionTable(MobTable, "Mob", RenderStepConnection, Mob, Esp)
				end
			end
		end
	end

	if MobEspEnabledRBActive.Value then
		CreateInitialMobEsp()
	end

	MobEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialMobEsp()
		else
			while not IsTableEmpty(MobTable) do
				ClearConnectionTable(MobTable, "Mob")
			end
		end
	end)

	LiveFolder.DescendantAdded:Connect(function(Descendant)
		if MobEspEnabledRBActive.Value then
			if Descendant.Name == "HumanoidRootPart" then
				local Mob = Descendant.Parent

				if not Players:GetPlayerFromCharacter(Mob) then
					ClearConnectionTable(MobTable, "Mob", Mob)

					local Esp, RenderStepConnection = CreateEsp("Mob", Mob.Name, Descendant, Mob)

					CreateConnectionTable(MobTable, "Mob", RenderStepConnection, Mob, Esp)
				end
			end
		end
	end)

	LiveFolder.ChildRemoved:Connect(function(Child)
		if Child:FindFirstChild("HumanoidRootPart") then
			ClearConnectionTable(MobTable, "Mob", Child)
		end
	end)

	----------------------------------------------------------------------------------------------------

	local function CreateInitialNPCEsp()
		local NPCChildren = NPCFolder:GetChildren()

		for NPCIndex = 1, #NPCChildren do
			local NPC = NPCChildren[NPCIndex]

			if NPC:FindFirstChild("HumanoidRootPart") then
				local HumanoidRootPart = NPC.HumanoidRootPart

				ClearConnectionTable(NPCTable, "NPC", NPC)

				local Esp, RenderStepConnection = CreateEsp("NPC", NPC.Name, HumanoidRootPart, NPC)

				CreateConnectionTable(NPCTable, "NPC", RenderStepConnection, NPC, Esp)
			end
		end
	end

	if NPCEspEnabledRBActive.Value then
		CreateInitialNPCEsp()
	end

	NPCEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialNPCEsp()
		else
			while not IsTableEmpty(NPCTable) do
				ClearConnectionTable(NPCTable, "NPC")
			end
		end
	end)

	NPCFolder.DescendantAdded:Connect(function(Descendant)
		if NPCEspEnabledRBActive.Value then
			if Descendant.Name == "HumanoidRootPart" then
				local NPC = Descendant.Parent

				ClearConnectionTable(NPCTable, "NPC", NPC)

				local Esp, RenderStepConnection = CreateEsp("NPC", NPC.Name, Descendant, NPC)

				CreateConnectionTable(NPCTable, "NPC", RenderStepConnection, NPC, Esp)
			end
		end
	end)

	NPCFolder.ChildRemoved:Connect(function(Child)
		if Child:FindFirstChild("HumanoidRootPart") then
			ClearConnectionTable(NPCTable, "NPC", Child)
		end
	end)

	----------------------------------------------------------------------------------------------------

	local function CreateInitialObjectEsp()
		local ObjectChildren = ThrownFolder:GetChildren()

		for ObjectIndex = 1, #ObjectChildren do
			local Object = ObjectChildren[ObjectIndex]

			if Object:IsA("Model") or Object:IsA("BasePart") then
				local ObjectInstance = nil
				local ObjectName = ""

				if Object.Name == "PieceofForge" then
					if Object:FindFirstChild("HoldForge") then
						ObjectInstance = Object.HoldForge
						ObjectName = "Piece Of Forge"
					end
				end
				if Object.Name == "Model" then
					if Object:FindFirstChild("LootDrop") then
						ObjectInstance = Object.LootDrop
						ObjectName = "Loot"
					elseif Object:FindFirstChild("RootPart") then
						ObjectInstance = Object.RootPart
						ObjectName = "Chest"
					end
				end
				if Object.Name == "BagDrop" then
					ObjectInstance = Object
					ObjectName = "Death Loot"
				end

				if ObjectInstance then
					ClearConnectionTable(ObjectTable, "Object", ObjectInstance)

					local Esp, RenderStepConnection = CreateEsp("Object", ObjectName, ObjectInstance)

					CreateConnectionTable(ObjectTable, "Object", RenderStepConnection, ObjectInstance, Esp)
				end
			end
		end	
	end

	if ObjectEspEnabledRBActive.Value then
		CreateInitialObjectEsp()
	end

	ObjectEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialObjectEsp()
		else
			while not IsTableEmpty(ObjectTable) do
				ClearConnectionTable(ObjectTable, "Object")
			end
		end
	end)

	ThrownFolder.DescendantAdded:Connect(function(Descendant)
		if ObjectEspEnabledRBActive.Value then
			if Descendant:IsA("BasePart") then
				local ObjectInstance = nil
				local ObjectName = ""

				if Descendant.Name == "RootPart" then
					if Descendant:FindFirstAncestor("Model") then
						ObjectInstance = Descendant
						ObjectName = "Chest"
					end
				end
				if Descendant.Name == "HoldForge" then
					if Descendant:FindFirstAncestor("PieceofForge") then
						ObjectInstance = Descendant
						ObjectName = "Piece Of Forge"
					end
				end
				if Descendant.Name == "BagDrop" then
					ObjectInstance = Descendant
					ObjectName = "Death Loot"
				end
				if Descendant.Name == "LootDrop" then
					if Descendant:FindFirstAncestor("Model") then
						ObjectInstance = Descendant
						ObjectName = "Loot"
					end
				end

				if ObjectInstance then
					ClearConnectionTable(ObjectTable, "Object", ObjectInstance)

					local Esp, RenderStepConnection = CreateEsp("Object", ObjectName, ObjectInstance)

					CreateConnectionTable(ObjectTable, "Object", RenderStepConnection, ObjectInstance, Esp)
				end
			end
		end
	end)

	ThrownFolder.DescendantRemoving:Connect(function(Descendant)
		if Descendant:IsA("BasePart") then
			ClearConnectionTable(ObjectTable, "Object", Descendant)
		end
	end)

	----------------------------------------------------------------------------------------------------

	local function CreateInitialIngredientEsp()
		local IngredientChildren = IngredientFolder:GetChildren()

		for IngredientIndex = 1, #IngredientChildren do
			if IngredientChildren[IngredientIndex]:IsA("BasePart") then
				if not IngredientChildren[IngredientIndex]:FindFirstChild("Pickaxe") then
					local Ingredient = IngredientChildren[IngredientIndex]

					ClearConnectionTable(IngredientTable, "Ingredient", Ingredient)

					local Esp, RenderStepConnection = CreateEsp("Ingredient", Ingredient.Name, Ingredient)

					CreateConnectionTable(IngredientTable, "Ingredient", RenderStepConnection, Ingredient, Esp)
				end
			end
		end
	end

	if IngredientEspEnabledRBActive.Value then
		CreateInitialIngredientEsp()
	end

	IngredientEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialIngredientEsp()
		else
			while not IsTableEmpty(IngredientTable) do
				ClearConnectionTable(IngredientTable, "Ingredient")
			end
		end
	end)

	IngredientFolder.ChildAdded:Connect(function(Child)
		if IngredientEspEnabledRBActive.Value then
			if Child:IsA("BasePart") then
				if not Child:FindFirstChild("Pickaxe") then
					ClearConnectionTable(IngredientTable, "Ingredient", Child)

					local Esp, RenderStepConnection = CreateEsp("Ingredient", Child.Name, Child)

					CreateConnectionTable(IngredientTable, "Ingredient", RenderStepConnection, Child, Esp)
				end
			end
		end
	end)

	IngredientFolder.ChildRemoved:Connect(function(Child)
		if Child:IsA("BasePart") then
			if not Child:FindFirstChild("Pickaxe") then
				ClearConnectionTable(IngredientTable, "Ingredient", Child)
			end
		end
	end)

	----------------------------------------------------------------------------------------------------

	local function CreateInitialOreEsp()
		local OreChildren = IngredientFolder:GetChildren()

		for OreIndex = 1, #OreChildren do
			if OreChildren[OreIndex]:IsA("BasePart") then
				if OreChildren[OreIndex]:FindFirstChild("Pickaxe") then
					local Ore = OreChildren[OreIndex]

					ClearConnectionTable(OreTable, "Ore", Ore)

					local Esp, RenderStepConnection = CreateEsp("Ore", Ore.Name, Ore)

					CreateConnectionTable(OreTable, "Ore", RenderStepConnection, Ore, Esp)
				end
			end
		end
	end

	if OreEspEnabledRBActive.Value then
		CreateInitialOreEsp()
	end

	OreEspEnabledRBActive.Changed:Connect(function(Value)
		if Value then
			CreateInitialOreEsp()
		else
			while not IsTableEmpty(OreTable) do
				ClearConnectionTable(OreTable, "Ore")
			end
		end
	end)

	IngredientFolder.ChildAdded:Connect(function(Child)
		if OreEspEnabledRBActive.Value then
			if Child:IsA("BasePart") then
				if Child:FindFirstChild("Pickaxe") then
					ClearConnectionTable(OreTable, "Ore", Child)

					local Esp, RenderStepConnection = CreateEsp("Ore", Child.Name, Child)

					CreateConnectionTable(OreTable, "Ore", RenderStepConnection, Child, Esp)
				end
			end
		end
	end)

	IngredientFolder.ChildRemoved:Connect(function(Child)
		if Child:IsA("BasePart") then
			if Child:FindFirstChild("Pickaxe") then
				ClearConnectionTable(OreTable, "Ore", Child)
			end
		end
	end)

	----------------------------------------------------------------------------------------------------
end)
print(Error)
