-- // Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Window = Rayfield:CreateWindow({
    Name = "Animation Switcher",
    LoadingTitle = "Animation Loader",
    LoadingSubtitle = "by Adidas Pack",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "AnimConfig"
    }
})

local Tab = Window:CreateTab("Animations", 4483362458) -- icon assetid optional
local Section = Tab:CreateSection("Animation Pack")

-- // Adidas Animation IDs (hasil inspect kamu)
local AdidasAnimations = {
    Idle1   = "rbxassetid://122257458498464",
    Idle2   = "rbxassetid://102357151005774",
    Walk    = "http://www.roblox.com/asset/?id=18537392113",
    Run     = "rbxassetid://82598234841035",
    Jump    = "rbxassetid://75290611992385",
    Fall    = "http://www.roblox.com/asset/?id=11600206437",
    Climb   = "http://www.roblox.com/asset/?id=10921257536",
    Swim    = "http://www.roblox.com/asset/?id=10921264784",
    SwimIdle= "http://www.roblox.com/asset/?id=10921265698"
}

-- Variables
local OriginalAnimations = {}
local AdidasEnabled = false
local WalkSpeedEnabled = false
local WalkSpeedValue = 16

-- Functions
local function SaveOriginalAnimations(Animate)
    OriginalAnimations = {}
    for _, child in ipairs(Animate:GetDescendants()) do
        if child:IsA("Animation") then
            OriginalAnimations[child] = child.AnimationId
        end
    end
end

local function ApplyAdidas(Animate, Humanoid)
    Animate.idle.Animation1.AnimationId = AdidasAnimations.Idle1
    Animate.idle.Animation2.AnimationId = AdidasAnimations.Idle2
    Animate.walk.WalkAnim.AnimationId   = AdidasAnimations.Walk
    Animate.run.RunAnim.AnimationId     = AdidasAnimations.Run
    Animate.jump.JumpAnim.AnimationId   = AdidasAnimations.Jump
    Animate.fall.FallAnim.AnimationId   = AdidasAnimations.Fall
    Animate.climb.ClimbAnim.AnimationId = AdidasAnimations.Climb
    Animate.swim.Swim.AnimationId       = AdidasAnimations.Swim
    Animate.swimidle.SwimIdle.AnimationId = AdidasAnimations.SwimIdle
    Humanoid.Jump = true
end

local function RestoreOriginal()
    for anim, id in pairs(OriginalAnimations) do
        if anim and anim:IsA("Animation") then
            anim.AnimationId = id
        end
    end
end

local function ApplyWalkSpeed(Humanoid)
    if WalkSpeedEnabled then
        Humanoid.WalkSpeed = WalkSpeedValue
    else
        Humanoid.WalkSpeed = 16
    end
end

-- Reapply on Respawn
local function SetupCharacter(Char)
    local Animate = Char:WaitForChild("Animate")
    local Humanoid = Char:WaitForChild("Humanoid")
    
    -- Simpan animasi original lagi
    SaveOriginalAnimations(Animate)

    -- Kalau Adidas masih aktif
    if AdidasEnabled then
        ApplyAdidas(Animate, Humanoid)
    end

    -- Kalau WalkSpeed masih aktif
    ApplyWalkSpeed(Humanoid)
end

-- Connect ke setiap spawn
LocalPlayer.CharacterAdded:Connect(function(Char)
    task.wait(1) -- tunggu komponen kebentuk
    SetupCharacter(Char)
end)

-- Setup awal untuk karakter sekarang
if LocalPlayer.Character then
    SetupCharacter(LocalPlayer.Character)
end

-- // UI Toggles
Tab:CreateToggle({
    Name = "Adidas Animation",
    CurrentValue = false,
    Flag = "AdidasAnimToggle",
    Callback = function(Value)
        AdidasEnabled = Value
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Animate") and Char:FindFirstChild("Humanoid") then
            if Value then
                ApplyAdidas(Char.Animate, Char.Humanoid)
            else
                RestoreOriginal()
            end
        end
    end,
})

Tab:CreateToggle({
    Name = "Walk Speed",
    CurrentValue = false,
    Flag = "WalkSpeedToggle",
    Callback = function(Value)
        WalkSpeedEnabled = Value
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") then
            ApplyWalkSpeed(Char.Humanoid)
        end
    end,
})

Tab:CreateSlider({
    Name = "Walk Speed Value",
    Range = {16, 100}, -- default range
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        WalkSpeedValue = Value
        local Char = LocalPlayer.Character
        if Char and Char:FindFirstChild("Humanoid") and WalkSpeedEnabled then
            Char.Humanoid.WalkSpeed = WalkSpeedValue
        end
    end,
})
