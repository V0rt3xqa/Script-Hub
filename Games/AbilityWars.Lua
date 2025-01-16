if game.PlaceId == 8260276694 then
    pcall(function()
        if game:GetService("CoreGui")["Ability Wars"].RobloxLocked == false then
            game:GetService("CoreGui")["Ability Wars"]:Destroy()
            print("Destroyed")
        end
    end)
    -- init
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Venyx/Source.lua"))()
    local venyx = library.new("Ability Wars", 5013109572)
    
    -- themes
    local themes = {
        Background = Color3.fromRGB(24, 24, 24),
        Glow = Color3.fromRGB(0, 0, 0),
        Accent = Color3.fromRGB(10, 10, 10),
        LightContrast = Color3.fromRGB(20, 20, 20),
        DarkContrast = Color3.fromRGB(14, 14, 14),  
        TextColor = Color3.fromRGB(255, 255, 255)
    }
    local auraoff = true
    local lplr = game.Players.LocalPlayer
    local page = venyx:addPage("Modules", 5012544693)
    local Blatant = page:addSection("Blatant")
	 local aura = Blatant:addToggle("Aura", nil, function(enabled)
            if enabled then
                auraoff = false
                venyx:Notify("Aura", "Enabled")
                local x = math.random(3.124,5)
                local fetchfunc = function ()
                    local player
                    local distance = math.huge
                    for i,v in pairs(game.Players:GetPlayers()) do
                        if v ~= lplr then
                            pcall(function()
                                local plrdis = (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position)
                                plrdis = plrdis.Magnitude
                                if plrdis < distance then
                                    distance = plrdis
                                    player = v
                                end
                            end)
                        end
                    end
                    return player
                end
                local function getallclose(max)
                    local players = {}
                    if max > 15 then task.wait(0.1) end
                    for i,v in pairs(game.Players:GetPlayers()) do
                        pcall(function()
                            local plrdis = (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position)
                            if v.Character.Humanoid.Health > 0 and plrdis.Magnitude  <= max then
                                table.insert(players,{v,plrdis.Magnitude}) end
                        end)
                    end
                    if max > 15 then return players else return players end
                end
                local function isclose()
                    local char = fetchfunc().Character
                    local distance = (char.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position)
                    if distance.Magnitude <= 20 then
                        return char
                    end
                end
                local function randompart(char)
                    local parts = {}
                    for i,v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then table.insert(parts,v) end
                    end
                    return parts[math.random(1,#parts)]
                end
                local function mainfunc()
                    while task.wait(0.05) do
                        for i,v in pairs(getallclose(15)) do
                            if not lplr.Character or auraoff then break end
                            pcall(function()
                                local char,distance = v[1].Character,v[2]
        
                                if v[1].UserId == 4621274543 or v[1].UserId == 4650675158 then
                                    return
                                end
                                task.wait()
                                local args = {
                                    [1] = char,
                                    [2] = Vector3.zero,
                                    [3] = x,
                                    [4] = randompart(char)
                                }
        
                                game:GetService("ReplicatedStorage"):FindFirstChild("Remote Events").Punch:FireServer(unpack(args))
                                task.wait(0.1)
                            end)
                        end
                    end
                end
                mainfunc()
                game.Players.LocalPlayer.CharaterAdded:Connect(function()
                    mainfunc()
                end)
            else
                auraoff = true
                venyx:Notify("Aura", "Disabled")
            end
    end)
    _G.HeadSize = 20
    _G.Transparency = 5
    _G.Disabled = true
    local HitBoxColor = Color3.fromRGB(24, 24, 24)
    local reach = Blatant:addToggle("Reach", nil, function(enabled)
        if enabled then
            game:GetService('RunService').RenderStepped:connect(function()
                if _G.Disabled then
                    for i,v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                            pcall(function()
                                if enabled then
                                v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                                v.Character.HumanoidRootPart.Transparency = (_G.Transparency/10)
                                v.Character.HumanoidRootPart.Color = HitBoxColor
                                v.Character.HumanoidRootPart.Material = "Neon"
                                v.Character.HumanoidRootPart.CanCollide = false
                                end
                            end)
                        end
                    end
                end
            end)
        else
            _G.Headsize = 2
        end
    end)
    local color = nil
    local hitbox = {
        ReachColor = Color3.fromRGB(228, 126, 126)
    }
    for theme, color in pairs(hitbox) do 
        Blatant:addColorPicker(theme, color, function(v)
            print(v)
            HitBoxColor = v
        end)
    end
    Blatant:addSlider("Reach Size", 20, 2, 100, function(value)
        _G.HeadSize = value
    end)
    Blatant:addSlider("Reach Transparency", 0, 8, 10, function(value)
        _G.Transparency = value
    end)
    _G.Speed = 40
    local e = false
    local speed = Blatant:addToggle("Speed", nil, function(enabled)
        if enabled then
        e = true
            game:GetService('RunService').RenderStepped:connect(function()
                for i,v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name == game:GetService('Players').LocalPlayer.Name and e then
                            _G.Speed =  _G.SpeedSlider
                            v.Character.Humanoid.WalkSpeed = _G.Speed
                            print("EE")
                    end  
                end
            end)
        else
            e = false
            _G.Speed = 20
            lplr.Character.Humanoid.WalkSpeed = 20
            venyx:Notify("e", "Disabled")
        end
    end)
    Blatant:addSlider("Speed", 20, 40, 100, function(value)
        _G.SpeedSlider = value
    end)
    local ANCC
    local antivoidpart
    local antivoid = Blatant:addToggle("AntiVoid", nil, function(enabled)
    if enabled then
		antivoidpart = Instance.new("Part", workspace)
		antivoidpart.Name = "AntiVoid"
		antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
		antivoidpart.Position = Vector3.new(160.5, -10, 247.5)
		antivoidpart.Transparency = 0.4
		antivoidpart.Anchored = true
		antivoidpart.Color = ANCC
		antivoidpart.Material = Enum.Material.Neon
		antivoidpart.Touched:connect(function(touchtouch)
			if touchtouch.Parent:WaitForChild("Humanoid") and touchtouch.Parent.Name == lplr.Name then
				touchtouch.Parent:WaitForChild("Humanoid"):ChangeState("Jumping")
				local CFrameEnd = CFrame.new(0, 20, 0)
				local Time = 0 
				local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
				tween:Play()
				tween.Completed:Wait() 
			end
		end)
	else
		antivoidpart:Destroy()
	end
end)
local ANC = {
    AntiVoidColor = Color3.fromRGB(228, 126, 126)
}

for theme, color in pairs(ANC) do 
    Blatant:addColorPicker(theme, color, function(v)
        print(v)
        ANCC = v
        antivoidpart.Color = v
    end)
end
    

    --[[Blatant:addButton("Button", function()
        print("Clicked")
    end)
    Blatant:addTextbox("Notification", "Default", function(value, focusLost)
        print("Input", value)
    
        if focusLost then
            venyx:Notify("Title", value)
        end
    end)
    

    Settings:addColorPicker("ColorPicker", Color3.fromRGB(50, 50, 50))
    Settings:addColorPicker("ColorPicker2")
    Settings:addSlider("Slider", 0, -100, 100, function(value)
        print("Dragged", value)
    end)
    Settings:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3})
    Settings:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
        print("Selected", text)
    end)
    Settings:addButton("Button")]]
    
    -- second page
    local Settings = venyx:addPage("Settings", 5012544693)
    local colors = Settings:addSection("Colors")
    
    for theme, color in pairs(themes) do 
        colors:addColorPicker(theme, color, function(color3)
            venyx:setTheme(theme, color3)
        end)
    end
    local Config = Settings:addSection("Config")
    Config:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
        print("Activated Keybind")
        venyx:toggle()
    end, function()
        print("Changed Keybind")
    end)
    -- load
    venyx:SelectPage(venyx.pages[1], true)
    end