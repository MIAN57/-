local library = loadstring(game:HttpGet("https://pastebin.com/raw/3vQbADjh", true))()
----------------------------------------------------------------------------------------------------------------------------------------
local window = library:new("神秘脚本[汉化]")
----------------------------------------------------------------------------------------------------------------------------------------
    local creds = window:Tab("关于", "6031097229")
    local bin = creds:section("信息", true)
    bin:Label("作者:Hfh916")   
    bin:Label("副作者:👻极尘👻")
    bin:Label("官方群:885775764")
    bin:Label("免费脚本，进群免费汉化")
    bin:Label("发布日期：2025年10月5号")
    bin:Label("更新日期：2025年10月5号")
   
    bin:Button("关闭UI",function()
            game:GetService("CoreGui")["frosty is cute"]:Destroy()
        end)

    local creds = window:Tab("通用", "6031097229")
    local credits = creds:section("玩家功能", true)

credits:Slider("步行速度!", "WalkSpeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 16, 400, false, function(Speed)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Speed end end)
end)

credits:Slider("跳跃高度!", "JumpPower", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 50, 400, false, function(Jump)
  spawn(function() while task.wait() do game.Players.LocalPlayer.Character.Humanoid.JumpPower = Jump end end)
end)

credits:Textbox("重力设置!", "Gravity", "输入", function(Gravity)
  spawn(function() while task.wait() do game.Workspace.Gravity = Gravity end end)
end)

credits:Toggle("夜视", "Light", false, function(Light)
  spawn(function() while task.wait() do if Light then game.Lighting.Ambient = Color3.new(1, 1, 1) else game.Lighting.Ambient = Color3.new(0, 0, 0) end end end)
end)

credits:Toggle("穿墙", "NoClip", false, function(NC)
  local Workspace = game:GetService("Workspace") local Players = game:GetService("Players") if NC then Clipon = true else Clipon = false end Stepped = game:GetService("RunService").Stepped:Connect(function() if not Clipon == false then for a, b in pairs(Workspace:GetChildren()) do if b.Name == Players.LocalPlayer.Name then for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do if v:IsA("BasePart") then v.CanCollide = false end end end end else Stepped:Disconnect() end end)
end)

credits:Button("透视", function()
  local Players = game:GetService("Players"):GetChildren() local RunService = game:GetService("RunService") local highlight = Instance.new("Highlight") highlight.Name = "Highlight" for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" end end game.Players.PlayerAdded:Connect(function(player) repeat wait() until player.Character if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = player.Character highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart") highlightClone.Name = "Highlight" end end) game.Players.PlayerRemoving:Connect(function(playerRemoved) playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy() end) RunService.Heartbeat:Connect(function() for i, v in pairs(Players) do repeat wait() until v.Character if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then local highlightClone = highlight:Clone() highlightClone.Adornee = v.Character highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart") highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop highlightClone.Name = "Highlight" task.wait() end end end)
end)

  local credits = creds:section("自瞄功能", true)

function lookAt(target, eye)
    workspace.CurrentCamera.CFrame = CFrame.new(target, eye)
end

function getClosestPlayerToCursor(trg_part, teamcheck)
    local nearest = nil
    local last = math.huge
    local plrsService = game:GetService("Players")
    for i, v in ipairs(plrsService:GetPlayers()) do
        if v ~= plrsService.LocalPlayer and plrsService.LocalPlayer.Character and plrsService.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and plrsService.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health > 0
            and v.Character and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Health > 0
        then
            local allowed = not teamcheck
            if teamcheck and v.Team ~= plrsService.LocalPlayer.Team then
                allowed = true
            end
            if allowed then
                local aimobj = v.Character:FindFirstChild(trg_part) or v.Character:FindFirstChild("UpperTorso")
                if aimobj then
                    if plrsService.LocalPlayer.Character:FindFirstChild("Head") then
                        local ePos, vissss = workspace.CurrentCamera:WorldToViewportPoint(aimobj.Position)
                        local AccPos = Vector2.new(ePos.x, ePos.y)
                        local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
                        local distance = (AccPos - mousePos).magnitude
                        if distance < last and vissss and distance < 400 then
                            last = distance
                            nearest = v
                        end
                    end
                end
            end
        end
    end
    return nearest
end

local aimEnabled = false
local teamCheckEnabled = false
local aimPart = "Head"
local aimRenderSteppedConnection

credits:Toggle("[阿尔宙斯]自瞄", "AimToggle", false, function(state)
    aimEnabled = state
    if state then
        aimRenderSteppedConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local closest = getClosestPlayerToCursor(aimPart, teamCheckEnabled)
            if closest then
                local aimobj = closest.Character:FindFirstChild("aimPart") or closest.Character:FindFirstChild("Head")
                if aimobj then
                    lookAt(workspace.CurrentCamera.CFrame.p, aimobj.Position)
                end
            end
        end)
    else
        if aimRenderSteppedConnection then
            aimRenderSteppedConnection:Disconnect()
            aimRenderSteppedConnection = nil
        end
    end
end)

credits:Toggle("团队检测", "TeamCheckToggle", false, function(state)
    teamCheckEnabled = state
end)

local creds = window:Tab("脚本区", "6031097229")
local credits = creds:section("建造一架飞机", true)
credits:Button("刷钱", function()
   loadstring(game:HttpGet("https://rscripts.net/raw/not-patched-infinite-money-money-farm-open-shop_1753743540999_gqxO4z8nzH.txt"))()
end)

local credits = creds:section("最强战场", true)
credits:Button("VexonHub", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TY-Script/TYHub/main/VexonHub"))()
end)
credits:Button("自动格挡", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/MIAN57/-/refs/heads/main/TSB%E5%8A%A0%E5%AF%86.lua"))()
end)
