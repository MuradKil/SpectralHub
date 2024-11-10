local player = game:GetService("Players").LocalPlayer
local weapon_attr = player:WaitForChild("WeaponsAttributes")
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
local RunService = game:GetService("RunService")

local maceMod = weapon_attr:WaitForChild("Mace")
local raygunMod = weapon_attr:WaitForChild("RayGun")
local staffMod = weapon_attr:WaitForChild("Staff")

local Fluent = loadstring(game:HttpGet("https://pastebin.com/raw/mDJ5DxJ9"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Spectral Hub",
    SubTitle = " BTSTR",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    EspTab = Window:AddTab({ Title = "Esp", Icon = "map-pin" }),
    Robots = Window:AddTab({ Title = "Robots", Icon = "bot" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Tabs.Main:AddParagraph({
        Title = "Welcome!",
        Content = "Welcome to the Spectral BTSTR\nThank You For Using Spectral Hub!"
    })
Tabs.Main:AddParagraph({
        Title = "Devs: MurKilDev, BBD4",
        Content = ""
    })

-- Player Tab
local speed = 16
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local speaker = game:GetService("Players").LocalPlayer
local Noclipping = nil

Tabs.Player:AddToggle("MyNoclip", {
       Title = "NoClip",
       Description = "",
	   Default = false,
	   Callback = function(bool)
       if bool then
		Clip = false
		wait(0.1)
		local function NoclipLoop()
		       if Clip == false and speaker.Character ~= nil then
			       for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
						child.CanCollide = false
					end
				end
			end
		end
		Noclipping = RunService.Stepped:Connect(NoclipLoop)
	else
		if Noclipping then
			Noclipping:Disconnect()
		end
		Clip = true
	end
end
})

local InfJp = Tabs.Player:AddToggle("InfJump", {Title = "Infinite Jump", Default = false})

InfJp:OnChanged(function()
    getgenv().infj = InfJp.Value
    local player = game:GetService("Players").LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if getgenv().infj and humanoid then
        _G.jpbypass = humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
            humanoid.JumpPower = 50
        end)
        _G.jumpcheck = game:GetService("UserInputService").JumpRequest:Connect(function()
            if getgenv().infj then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if _G.jpbypass then
            _G.jpbypass:Disconnect()
            _G.jpbypass = nil
        end
        if _G.jumpcheck then
            _G.jumpcheck:Disconnect()
            _G.jumpcheck = nil
        end
    end
end)

local SpeedHack = Tabs.Player:AddSlider("Speed Changer", {
    Title = "Speed",
    Description = "Change Player Speed",
    Default = 16,
    Min = 16,
    Max = 50,
    Rounding = 1,
    Callback = function(sp)
        speed = sp
    end
})

local JumpHack = Tabs.Player:AddSlider("JumpPowerChanger", {
    Title = "Jump Power",
    Description = "Change Player Jump Power",
    Default = 50,
    Min = 50,
    Max = 100,
    Rounding = 1,
    Callback = function(jp)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
    end
})

local GravityHack = Tabs.Player:AddSlider("GravityOfP", {
    Title = "Gravity",
    Description = "Change Gravity (Normal - 196.2)",
    Default = 196.2,
    Min = 0,
    Max = 196.2,
    Rounding = 1,
    Callback = function(grav)
        game.Workspace.Gravity = grav
    end
})

local OtherP = Tabs.Player:AddSection("Others")

local NoCD = Tabs.Player:AddButton({
    Title = "No Cooldown",
    Description = "No Cooldown on Weapons",
    Callback = function()
        raygunMod:SetAttribute("Cooldown", 0)
        maceMod:SetAttribute("Cooldown", 0)
        staffMod:SetAttribute("Cooldown", 0)
    end
})

local GetWeap = Tabs.Player:AddSection("Get Weapons (Beta)")

local GetSword = Tabs.Player:AddButton({
    Title = "Get Sword",
    Description = "Add Sword to your Backpack",
    Callback = function()
        local args = {
            [1] = "Weapons",
            [2] = "Sword"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetSpear = Tabs.Player:AddButton({
    Title = "Get Spear",
    Description = "Add Spear to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Spear"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetCrossbow = Tabs.Player:AddButton({
    Title = "Get Crossbow",
    Description = "Add Crossbow to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Crossbow"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetFlamethrower = Tabs.Player:AddButton({
    Title = "Get Flamethrower",
    Description = "Add Flamethrower to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Flamethrower"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetMace = Tabs.Player:AddButton({
    Title = "Get Mace",
    Description = "Add Mace to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Mace"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetStaff = Tabs.Player:AddButton({
    Title = "Get Staff",
    Description = "Add Staff to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Staff"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetRayGun = Tabs.Player:AddButton({
    Title = "Get RayGun",
    Description = "Add RayGun to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "RayGun"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})

local GetRocketLauncher = Tabs.Player:AddButton({
    Title = "Get Rocket Launcher",
    Description = "Add Rocket Launcher to your Backpack",
    Callback = function()
       local args = {
            [1] = "Weapons",
            [2] = "Rocket_Launcher"
        }

        game:GetService("ReplicatedStorage").Remotes.Shop.EquipItem:InvokeServer(unpack(args))
    end
})
-- Esp Tab(Credit to .terni)
local EspEn = Tabs.EspTab:AddToggle("Esp", {Title = "Enable Esp", Default = false })

EspEn:OnChanged(function()
    if EspEn then
        getgenv().enabled = EspEn.Value
        getgenv().filluseteamcolor = true
        getgenv().outlineuseteamcolor = true
        getgenv().fillcolor = Color3.new(0, 0, 0)
        getgenv().outlinecolor = Color3.new(1, 1, 1)
        getgenv().filltrans = 0.5
        getgenv().outlinetrans = 0

        local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
if not getgenv().enabled then
    holder:Destroy()
    return
end

if holder.Name == "Folder" then
    holder.Name = "ESPHolder"
    holder.Parent = game.CoreGui
end

if not uselocalplayer and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
    holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
end

if getgenv().enabled then 
    getgenv().enabled = false
    getgenv().enabled = true
end

while getgenv().enabled do
    task.wait()
    for _, v in pairs(game.Players:GetPlayers()) do
        local chr = v.Character
        if chr then
            local esp = holder:FindFirstChild(v.Name)
            if not esp then
                esp = Instance.new("Highlight")
                esp.Name = v.Name
                esp.Parent = holder
            end

            if not (uselocalplayer == false and v == game.Players.LocalPlayer) then
                if filluseteamcolor then
                    esp.FillColor = v.TeamColor.Color
                else
                    esp.FillColor = fillcolor 
                end

                if outlineuseteamcolor then
                    esp.OutlineColor = v.TeamColor.Color
                else
                    esp.OutlineColor = outlinecolor    
                end

                esp.FillTransparency = filltrans
                esp.OutlineTransparency = outlinetrans
                esp.Adornee = chr
                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
        end
    end
end
    else
        warn("EspEn toggle is not initialized properly.")
    end
end)
-- Robots Tab
local InsExplode = Tabs.Robots:AddButton({
    Title = "Instant Explode",
    Description = "Instant Explode",
    Callback = function()
        local player = game.Players.LocalPlayer

local function createButton()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ScreenGui"
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    local Toggle = Instance.new("TextButton")
    Toggle.Name = "Toggle"
    Toggle.Parent = ScreenGui
    Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Toggle.Position = UDim2.new(0.5, -45, 0.5, 60)
    Toggle.Size = UDim2.new(0, 90, 0, 38)
    Toggle.Font = Enum.Font.SourceSans
    Toggle.Text = "Explode!"
    Toggle.TextColor3 = Color3.fromRGB(248, 248, 248)
    Toggle.TextSize = 28.000
    Toggle.Draggable = false

    
    Toggle.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage").Remotes.Robot.LightFuse:InvokeServer()
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.Robot.Explode:InvokeServer()
    end)

    local Corner = Instance.new("UICorner")
    Corner.Name = "Corner"
    Corner.Parent = Toggle
end


local function removeButton()
    local screenGui = player:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui")
    if screenGui then
        screenGui:Destroy()
    end
end

if player.Team and player.Team.Name == "Robots" then
    createButton() -- Создаем кнопку
elseif player.Team and player.Team.Name == "Humans" then
    removeButton() -- Удаляем кнопку, если она есть
end


player:GetPropertyChangedSignal("Team"):Connect(function()
    if player.Team and player.Team.Name == "Robots" then
        createButton() -- Создаем кнопку
    elseif player.Team and player.Team.Name == "Humans" then
        removeButton() -- Удаляем кнопку, если она есть
    end
end)
    end
})

local ChangeRobots = Tabs.Robots:AddSection("Change Robots")

local DefaultRobot = Tabs.Robots:AddButton({
    Title = "Default",
    Description = "Change Robot to Default",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Default
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local SkirmisherRobot = Tabs.Robots:AddButton({
    Title = "Skirmisher",
    Description = "Change Robot to Skirmisher",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Skirmisher
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local JumperRobot = Tabs.Robots:AddButton({
    Title = "Jumper",
    Description = "Change Robot to Jumper",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Jumper
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local MarksmanRobot = Tabs.Robots:AddButton({
    Title = "Marksman",
    Description = "Change Robot to Marksman",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Marksman
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local TankRobot = Tabs.Robots:AddButton({
    Title = "Tank",
    Description = "Change Robot to Tank",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Tank
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local GhostRobot = Tabs.Robots:AddButton({
    Title = "Ghost",
    Description = "Change Robot to Ghost",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Ghost
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

local SaboteurRobot = Tabs.Robots:AddButton({
    Title = "Saboteur",
    Description = "Change Robot to Saboteur",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage").Assets.Robots.Saboteur
        }
        game:GetService("ReplicatedStorage").Remotes.Robot.Spawn:FireServer(unpack(args))
    end
})

-- Addons
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("FluentScriptHub")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- Walkspeed
local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = speed
end


player.CharacterAdded:Connect(onCharacterAdded)


if player.Character then
    onCharacterAdded(player.Character)
end


game:GetService("RunService").RenderStepped:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = speed
    end
end)
