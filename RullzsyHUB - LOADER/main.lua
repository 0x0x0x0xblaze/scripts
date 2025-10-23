-- Load Liblary UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window Process
local Window = Rayfield:CreateWindow({
	Icon = "braces",
    Name = "RullzsyHUB | Script Loader",
    LoadingTitle = "Created By RullzsyHUB",
    LoadingSubtitle = "Follow Tiktok: @rullzsy99",
})

-- Tab Menu
local ScriptTab = Window:CreateTab("List Scripts", 4483362458)

-- Section
ScriptTab:CreateSection("🟢 TOTAL MAP: 3")

-- Script 1
ScriptTab:CreateButton({
    Name = "🟢 MOUNT YAHAYUK",
    Callback = function()
        Rayfield:Notify({Title="Executing", Image="file", Content="Loading MOUNT YAHAYUK...", Duration=4})
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0x0x0xblaze/scripts/refs/heads/main/RullzsyHUB%20-%20MOUNT%20YAHAYUK/main.lua"))()
    end
})

-- Script 2
ScriptTab:CreateButton({
    Name = "🟢 MOUNT ANEH (PRO)",
    Callback = function()
        Rayfield:Notify({Title="Executing", Image="file", Content="Loading MOUNT ANEH (PRO)...", Duration=4})
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0x0x0xblaze/scripts/refs/heads/main/RullzsyHUB%20-%20MOUNT%20ANEH%20PRO/main.lua"))()
    end
})

-- Script 3
ScriptTab:CreateButton({
    Name = "🟢 MOUNT ATIN",
    Callback = function()
        Rayfield:Notify({Title="Executing", Image="file", Content="Loading MOUNT ATIN...", Duration=4})
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0x0x0xblaze/scripts/refs/heads/main/RullzsyHUB%20-%20MOUNT%20ATIN/main.lua"))()
    end
})




