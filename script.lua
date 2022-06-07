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

function FindAvailableTeams()
	local AvailableTeams = {}
	
	for _, Part in ipairs(workspace:GetDescendants()) do
		if (Part:IsA("SpawnLocation") and Part.AllowTeamChangeOnTouch) then -- find team, should we get only one spawn or not
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
    wait(0.5)
    game:GetService("Players").LocalPlayer.Character:BreakJoints()
    game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
    tool:Destroy()
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
Tools:AddButton("Delete All (BTools needed)", function()
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") and v.Locked == false then
            game:GetService("Players").LocalPlayer.Backpack.Hammer.MouseDown:FireServer(v)
        end
    end
end)