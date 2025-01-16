local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()
local GUI = Mercury:Create{
    Name = "Lucky Block",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}
local Tab = GUI:Tab{
	Name = "Lucky block opener",
	Icon = "rbxassetid://8569322835"
}
local block = nil

Tab:Button{
	Name = "Spawn Lucky Block",
	Description = nil,
	Callback = function() 
        game:GetService("ReplicatedStorage"):WaitForChild(block):FireServer()
    end
}
local MyDropdown = Tab:Dropdown{
	Name = "LuckyBlock Type",
	StartingText = "Select...",
	Description = nil,
	Items = {
		{"Normal", "SpawnLuckyBlock"}, 		
		{"Super", "SpawnSuperBlock"},		
        {"Rainbow", "SpawnRainbowBlock"},
        {"Diamond", "SpawnDiamondBlock"},
        {"Galaxy", "SpawnGalaxyBlock"}		
	},
	Callback = function(item) block = item return end
}