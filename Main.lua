local player = game:GetService("Players").LocalPlayer
local weapon_attr = player:WaitForChild("WeaponsAttributes")

local maceMod = weapon_attr:WaitForChild("Mace")
local raygunMod = weapon_attr:WaitForChild("RayGun")
local staffMod = weapon_attr:WaitForChild("Staff")

local Fluent = loadstring(game:HttpGet("https://pastebin.com/raw/mDJ5DxJ9"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Spectral | BTSTR ",
    SubTitle = " by Kil4ik",
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
        Content = "Welcome to the Spectral BTSTR\nIts early beta test!"
    })
Tabs.Main:AddParagraph({
        Title = "Devs: Kil4ik, BBD4",
        Content = ""
    })

-- Player Tab
local speed = 16  -- Default speed

local NoCD = Tabs.Player:AddButton({
    Title = "No Cooldown",
    Description = "No Cooldown on Weapons",
    Callback = function()
        raygunMod:SetAttribute("Cooldown", 0)
        maceMod:SetAttribute("Cooldown", 0)
        staffMod:SetAttribute("Cooldown", 0)
    end
})

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

local InfJump = Tabs.Player:AddButton({
    Title = "Infinity Jump",
    Description = "Jump Infinity times",
    Callback = function()
        local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
    end
})

local GetWeap = Tabs.Player:AddSection("Get Weapons")

local GetSword = Tabs.Player:AddButton({
    Title = "Get Sword",
    Description = "Add Sword to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Sword.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetSpear = Tabs.Player:AddButton({
    Title = "Get Spear",
    Description = "Add Spear to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Spear.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetCrossbow = Tabs.Player:AddButton({
    Title = "Get Crossbow",
    Description = "Add Crossbow to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Crossbow.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetFlamethrower = Tabs.Player:AddButton({
    Title = "Get Flamethrower",
    Description = "Add Flamethrower to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Flamethrower.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetMace = Tabs.Player:AddButton({
    Title = "Get Mace",
    Description = "Add Mace to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Mace.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetStaff = Tabs.Player:AddButton({
    Title = "Get Staff",
    Description = "Add Staff to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Staff.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetRayGun = Tabs.Player:AddButton({
    Title = "Get RayGun",
    Description = "Add RayGun to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.RayGun.Parent = game.Players.LocalPlayer.Backpack
    end
})

local GetRocketLauncher = Tabs.Player:AddButton({
    Title = "Get Rocket Launcher",
    Description = "Add Rocket Launcher to your Backpack",
    Callback = function()
       game.ReplicatedStorage.Assets.Weapons.Rocket_Launcher.Parent = game.Players.LocalPlayer.Backpack
    end
})
-- Esp Tab
local EspEn = Tabs.EspTab:AddToggle("Esp", {Title = "Enable Esp", Default = false })

EspEn:OnChanged(function()
    if EspEn then
        getgenv().enabled = EspEn.Value -- Toggle on/off
        getgenv().filluseteamcolor = true -- Toggle fill color using player team color on/off
        getgenv().outlineuseteamcolor = true -- Toggle outline color using player team color on/off
        getgenv().fillcolor = Color3.new(0, 0, 0) -- Change fill color, no need to edit if using team color
        getgenv().outlinecolor = Color3.new(1, 1, 1) -- Change outline color, no need to edit if using team color
        getgenv().filltrans = 0.5 -- Change fill transparency
        getgenv().outlinetrans = 0 -- Change outline transparency

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

-- Функция для создания кнопки
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

    -- Действие при нажатии на кнопку
    Toggle.MouseButton1Click:Connect(function()
        game:GetService("ReplicatedStorage").Remotes.Robot.LightFuse:InvokeServer()
        wait(1)
        game:GetService("ReplicatedStorage").Remotes.Robot.Explode:InvokeServer()
    end)

    local Corner = Instance.new("UICorner")
    Corner.Name = "Corner"
    Corner.Parent = Toggle
end

-- Функция для удаления кнопки, если она существует
local function removeButton()
    local screenGui = player:FindFirstChild("PlayerGui"):FindFirstChild("ScreenGui")
    if screenGui then
        screenGui:Destroy() -- Удаляет GUI с кнопкой
    end
end

-- Проверка команды игрока
if player.Team and player.Team.Name == "Robots" then
    createButton() -- Создаем кнопку
elseif player.Team and player.Team.Name == "Humans" then
    removeButton() -- Удаляем кнопку, если она есть
end

-- Дополнительно можно сделать так, чтобы проверка выполнялась при изменении команды игрока
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

-- Ensure WalkSpeed is updated correctly even after death
local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = speed
end

-- Connect CharacterAdded event to handle respawns
player.CharacterAdded:Connect(onCharacterAdded)

-- Handle the current character if it exists
if player.Character then
    onCharacterAdded(player.Character)
end

-- Continuously update the WalkSpeed during gameplay
game:GetService("RunService").RenderStepped:Connect(function()
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = speed
    end
end)
