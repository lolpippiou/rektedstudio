local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpippiou/rektedstudio/main/ui-engine.lua"))()

local name = "RektedStudio"

if identifyexecutor then
    name = name.." - "..identifyexecutor()
end

local WindowOptions = {
    min_size = Vector2.new(500, 400),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true
}

local Window = library:AddWindow(name, WindowOptions)
local Credits = Window:AddTab("Credits")
local Fighting = Window:AddTab("Fighting Games")
local Universal = Window:AddTab("Universal")
local Tools = Window:AddTab("Tool Cheats")

Credits:AddLabel("Created by team c00lkidd")
Credits:AddLabel("https://youtube.com/teamc00lkidd1")
Credits:AddButton("Join the discord server!!!!11", function()
    local Settings = {
        InviteCode = "92Wb8yGEh9"
    }

    local HttpService = game:GetService("HttpService")
    local RequestFunction

    if syn and syn.request then
        RequestFunction = syn.request
    elseif request then
        RequestFunction = request
    elseif http and http.request then
        RequestFunction = http.request
    elseif http_request then
        RequestFunction = http_request
    end

    local DiscordApiUrl = "https://127.0.0.1:%s/rpc=v=1"

    if not RequestFunction then
        print("bro wtf are you using, jjsploit? your shit cant fucking http request ur shit is trash")
    end

    for i = 6453, 6464 do
        local DiscordInviteRequest = function()
            local Request = RequestFunction({
                Url = string.format(DiscordApiUrl, tostring(i)),
                Method = "POST",
                Body = HttpService:JSONEncode({
                    nonce = HttpService:GenerateGUID(false),
                    args = {
                        invite = {code = "92Wb8yGEh9"},
                        code = "92Wb8yGEh9"
                    },
                    cmd = "INVITE_BROWSER"
                }),
                Headers = {
                    ["Origin"] = "https://discord.com",
                    ["Content-Type"] = "application/json"
                }
            })
        end
        spawn(DiscordInviteRequest)
    end
end)

local Box = Fighting:AddTextBox("Reach Number", nil, {["clear"] = false})
Fighting:AddSwitch("Reach", function(on)
    local reachnum = Box.Text
    if on == true then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Tool") then
                currentToolSize = v.Handle.Size
                currentGripPos = v.GripPos
                local a = Instance.new("SelectionBox")
                a.Name = "SelectionBoxCreated"
                a.Parent = v.Handle
                a.Adornee = v.Handle
                v.Handle.Massless = true
                v.Handle.Size = Vector3.new(0.5, 0.5, reachnum)
                v.GripPos = Vector3.new(0, 0, 0)
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            end
        end
    else
        for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Tool") then
                v.Handle.Size = currentToolSize
                v.Handle:FindFirstChild("SelectionBoxCreated"):Destroy()
                v.GripPos = currentGripPos
                v.Parent = game:GetService("Players").LocalPlayer.Character
            end
        end
    end
end)

local FightingHorizontal = Fighting:AddHorizontalAlignment()
FightingHorizontal:AddButton("Kill Players", function()
    local RS = game:GetService("RunService").RenderStepped
    local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    local Handle = Tool and Tool:FindFirstChild("Handle")
    for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
        spawn(function()
            while Tool and game:GetService("Players").LocalPlayer.Character and v.Character and Tool.Parent == game:GetService("Players").LocalPlayer.Character do
                local Human = v.Character:FindFirstChildWhichIsA("Humanoid")
                if not Human or Human.Health <= 0 then
                    break
                end
                for _, v1 in ipairs(v.Character:GetChildren()) do
                    v1 = ((v1:IsA("BasePart") and firetouchinterest(Handle, v1, 1, (RS:Wait() and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
                end
            end
        end)
    end
end)
FightingHorizontal:AddButton("Kill NPCs", function()
    local RS = game:GetService("RunService").RenderStepped
    local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    local Handle = Tool and Tool:FindFirstChild("Handle")
    
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(v.Parent) then
            spawn(function()
                while Tool and game:GetService("Players").LocalPlayer.Character and v.Parent and Tool.Parent == game:GetService("Players").LocalPlayer.Character do
                    local Human = v
                    if not Human or Human.Health <= 0 then
                        break
                    end
                    for _, v1 in ipairs(v.Parent:GetChildren()) do
                        v1 = ((v1:IsA("BasePart") and firetouchinterest(Handle, v1, 1, (RS:Wait() and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
                    end
                end
            end)
        end
    end
end)
FightingHorizontal:AddButton("Kill All", function()
    local RS = game:GetService("RunService").RenderStepped
    local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    local Handle = Tool and Tool:FindFirstChild("Handle")
    
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Humanoid") then
            spawn(function()
                while Tool and game:GetService("Players").LocalPlayer.Character and v.Parent and Tool.Parent == game:GetService("Players").LocalPlayer.Character do
                    local Human = v
                    if not Human or Human.Health <= 0 then
                        break
                    end
                    for _, v1 in ipairs(v.Parent:GetChildren()) do
                        v1 = ((v1:IsA("BasePart") and firetouchinterest(Handle, v1, 1, (RS:Wait() and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
                    end
                end
            end)
        end
    end
end)

local Noclipping = nil
Universal:AddSwitch("NoClip", function(on)
    if on then
        local function NoclipLoop()
            if game:GetService("Players").LocalPlayer.Character ~= nil then
                for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == true then
                        child.CanCollide = false
                    end
                end
            end
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    else
        if Noclipping then
            Noclipping:Disconnect()
        end
    end
end)

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local FLYING = false

Universal:AddSwitch("Fly", function(on)
    if on then
        FLYING = false
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
        wait()
        repeat wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and getRoot(game:GetService("Players").LocalPlayer.Character) and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        repeat wait() until mouse
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
        
        local T = getRoot(game:GetService("Players").LocalPlayer.Character)
        local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
        local SPEED = 0
    
        local function FLY()
            FLYING = true
            local BG = Instance.new("BodyGyro")
            local BV = Instance.new("BodyVelocity")
            BG.P = 9e4
            BG.Parent = T
            BV.Parent = T
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            spawn(function()
                repeat wait()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                    end
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    else
                        BV.velocity = Vector3.new(0, 0, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
                SPEED = 0
                BG:Destroy()
                BV:Destroy()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end)
        end
        flyKeyDown = mouse.KeyDown:connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 1
            elseif KEY:lower() == 's' then
                CONTROL.B = - 1
            elseif KEY:lower() == 'a' then
                CONTROL.L = - 1
            elseif KEY:lower() == 'd' then 
                CONTROL.R = 1
            elseif KEY:lower() == 'e' then
                CONTROL.Q = 2
            elseif KEY:lower() == 'q' then
                CONTROL.E = -2
            end
        end)
        flyKeyUp = mouse.KeyUp:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            elseif KEY:lower() == 'e' then
                CONTROL.Q = 0
            elseif KEY:lower() == 'q' then
                CONTROL.E = 0
            end
        end)
        FLY()
    else
        FLYING = false
        if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
    end
end)

function FindAvailableTeams()
	local AvailableTeams = {}
	
	for _, Part in ipairs(workspace:GetDescendants()) do
		if (Part:IsA("SpawnLocation") and Part.AllowTeamChangeOnTouch) then
			local Color = Part.TeamColor
			
			for _, Team in ipairs(game:GetService("Teams"):GetChildren()) do
				if (Team.TeamColor == Color and not AvailableTeams[Team]) then
					AvailableTeams[Team] = Part
				end
			end
		end
	end
	
	return AvailableTeams
end

local spawns = Universal:AddDropdown("Join Team", function(name)
    for Team, SpawnPoint in pairs(FindAvailableTeams()) do
        if Team.Name == name then
            local Decal = SpawnPoint:FindFirstChildOfClass("Decal")
	
            local function MoveSpawn()
                local Clone = SpawnPoint:Clone()
                SpawnPoint.CanCollide = false
                SpawnPoint.Transparency = 1
                SpawnPoint.CFrame = game:GetService("Players").LocalPlayer.Character.Torso.CFrame
                wait()
                SpawnPoint.CFrame = Clone.CFrame
                SpawnPoint.Transparency = Clone.Transparency
                SpawnPoint.CanCollide = Clone.CanCollide
                
                Clone:Destroy()
            end
            
            if (Decal) then
                local DecalTransparency = Decal.Transparency
                
                Decal.Transparency = 1
                MoveSpawn()
                Decal.Transparency = DecalTransparency
            else
                MoveSpawn()
            end
        end
    end
end)

for Team, SpawnPoint in pairs(FindAvailableTeams()) do
    spawns:Add(Team.Name)
end

local selectedItem
local Dropdown = Tools:AddDropdown("Give Tool", function(item)
    selectedItem = item
end)

for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Parent:FindFirstChild("GiverScript") then
        Dropdown:Add(v.Name)
    end
end

local ToolsHorizontal = Tools:AddHorizontalAlignment()
ToolsHorizontal:AddButton("Give Tool", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == selectedItem and v.Parent:FindFirstChild("GiverScript") then
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
        end
    end
end)
ToolsHorizontal:AddButton("Give Tool x10", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == selectedItem and v.Parent:FindFirstChild("GiverScript") then
            local cooldown = v.Parent.GiverScript:FindFirstChild("Cooldown").Value + 0.2
            for i = 1, 10 do
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
                wait(cooldown)
            end
        end
    end
end)
ToolsHorizontal:AddButton("Give Tool x100", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == selectedItem and v.Parent:FindFirstChild("GiverScript") then
            local cooldown = v.Parent.GiverScript:FindFirstChild("Cooldown").Value + 0.2
            for i = 1, 100 do
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
                wait(cooldown)
            end
        end
    end
end)
ToolsHorizontal:AddButton("Give All", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Parent:FindFirstChild("GiverScript") then
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
        end
    end
end)
Tools:AddSwitch("ESP to Tool", function(on)
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == selectedItem and v.Parent:FindFirstChild("GiverScript") then
            if on then
                local a = Instance.new("BoxHandleAdornment")
                a.Name = selectedItem
                a.Parent = v.Parent
                a.Adornee = v.Parent
                a.AlwaysOnTop = true
                a.ZIndex = 10
                a.Size = v.Parent.Size
                a.Transparency = 0.5
                a.Color = BrickColor.new("Really red")
            else
                for i,v in pairs(v.Parent:GetChildren()) do
                    if v:IsA("BoxHandleAdornment") then
                        v:Destroy()
                    end
                end
            end
        end
    end
end)
Tools:AddButton("Kill All (Sword)", function()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Tool") and v.Parent:FindFirstChild("GiverScript") and v.Name == selectedItem then
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
        end
    end
    local tool = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):WaitForChild(selectedItem)
    tool.Parent = game:GetService("Players").LocalPlayer.Character
    local RS = game:GetService("RunService").RenderStepped
    local Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    local Handle = Tool and Tool:FindFirstChild("Handle")
    for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
        spawn(function()
            while Tool and game:GetService("Players").LocalPlayer.Character and v.Character and Tool.Parent == game:GetService("Players").LocalPlayer.Character do
                local Human = v.Character:FindFirstChildWhichIsA("Humanoid")
                if not Human or Human.Health <= 0 then
                    break
                end
                for _, v1 in ipairs(v.Character:GetChildren()) do
                    v1 = ((v1:IsA("BasePart") and firetouchinterest(Handle, v1, 1, (RS:Wait() and nil) or firetouchinterest(Handle, v1, 0)) and nil) or v1) or v1
                end
            end
        end)
    end
end)
Tools:AddButton("Fire on All", function()
    local players = game:GetService("Players"):GetPlayers()
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == selectedItem and v.Parent:FindFirstChild("GiverScript") then
            local cooldown = v.Parent.GiverScript:FindFirstChild("Cooldown").Value + 0.2
            for i = 1, #players do
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 1)
                wait(cooldown)
            end
        end
    end
    wait()
    for i, v in pairs(game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
        if v.Name == selectedItem then
            v:FindFirstChild("Fire"):FireServer(players[i].Character.Torso - Vector3.new(0, 3, 0))
            wait()
        end
    end
end)

local grabtoolsFunc
Tools:AddSwitch("Equip dropped items", function(on)
    local Human = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    if on then
        for _, v in ipairs(workspace:GetChildren()) do
            if game:GetService("Players").LocalPlayer.Character and v:IsA("BackpackItem") then
                Human:EquipTool(v)
            end
        end
        grabtoolsFunc = workspace.ChildAdded:connect(function()
            if game:GetService("Players").LocalPlayer.Character and v:IsA("BackpackItem") then
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
            end
        end)
    else
        if grabtoolsFunc then grabtoolsFunc:Disconnect() end
    end
end)

if workspace:FindFirstChild("McBloxxer") then
    local mcbloxxer = Window:AddTab("McBloxxer")
    local mcbloxxerhorizontal = mcbloxxer:AddHorizontalAlignment()
    mcbloxxerhorizontal:AddButton("Give Cheeseburger", function()
        fireclickdetector(game:GetService("Workspace").McBloxxer.Kitchen.Cheeseburger.Giver.ClickDetector)
    end)
    mcbloxxerhorizontal:AddButton("Give x10", function()
        for i = 1, 10 do
            fireclickdetector(game:GetService("Workspace").McBloxxer.Kitchen.Cheeseburger.Giver.ClickDetector)
        end
    end)
    mcbloxxerhorizontal:AddButton("Give x100", function()
        for i = 1, 100 do
            fireclickdetector(game:GetService("Workspace").McBloxxer.Kitchen.Cheeseburger.Giver.ClickDetector)
        end
    end)
end
Tools:AddButton("Equip Tools", function()
    for i,v in pairs(game:GetService("Players").LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = game:GetService("Players").LocalPlayer.Character
        end
    end
end)
Tools:AddButton("Block Tools", function()
    for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            for i,c in pairs(v:GetDescendants()) do
                if c:IsA("SpecialMesh") then
                    c:Destroy()
                end
            end
        end
    end
end)
Tools:AddButton("Drop Tools", function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            v.Parent = workspace
        end
    end
end)
Tools:AddButton("Delete All (Delete Tool)", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Locked == false then
            game:GetService("Players").LocalPlayer.Backpack.Hammer.MouseDown:FireServer(v)
        end
    end
end)
Tools:AddButton("Delete All (Move Tool)", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Locked == false then
            game:GetService("Players").LocalPlayer.Backpack.Carry.MouseDown:FireServer(v)
            game:GetService("Players").LocalPlayer.Backpack.Carry.Move:FireServer(v, CFrame.new(Vector3.new(math.huge, 0, math.huge)))
            game:GetService("Players").LocalPlayer.Backpack.Carry.MouseUp:FireServer()
        end
    end
end)
