
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "💥 Destruction Simulator",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://VortexScripts.com/DestructionSim.lua"
}

local Tab = GUI:Tab{
	Name = "Auto",
	Icon = "rbxassetid://8569322835"
}





local AutoSell = false
local AutoFire = false
local UIS = game:GetService("UserInputService")
local mousedown = false
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        mousedown = true
    end
end)
UIS.InputEnded:Connect(function(input)
    mousedown = false
end)

Tab:Toggle{
	Name = "Auto Sell",
	StartingState = false,
	Description = nil,
	Callback = function(state)

    if state then
    AutoSell = true
                while AutoSell == true do
                task.wait()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("sellBricks"):FireServer()
                end
            else
        AutoSell = false
        print("false")
    end
end
}
Tab:Toggle{
	Name = "Auto Fire",
	StartingState = false,
	Description = nil,
	Callback = function(state)

    if state then
    AutoFire = true
    
    while AutoFire == true and task.wait() do
    if mousedown == true then
    local mouse = game.Players.LocalPlayer:GetMouse()
local hitPosition = mouse.Hit.Position
local args = {
	1736621911.0364692,
	game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("Launcher"):WaitForChild("Stats"),
	hitPosition,
	game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("Launcher"):WaitForChild("Assets"):WaitForChild("Rocket"):WaitForChild("Boom")
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("explodeRocket"):FireServer(unpack(args))
    end
end
    else
    AutoFire = false
    print("false")
    end
end
}
