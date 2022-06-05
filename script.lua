local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpippiou/rektedstudio/main/ui-engine.lua"))()

local name = "RektedStudio"

if identifyexecutor then
    name = name.." - "..identifyexecutor()
end

local WindowOptions = {
    min_size = Vector2.new(400, 400),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true
}

local Window = library:AddWindow(name, WindowOptions)
local Credits = Window:AddTab("Credits")
local Fighting = Window:AddTab("Fighting Games")

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

local Dropdown = Fighting:AddDropdown("Give Tool", function(item)
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Name == item and v.Parent:FindFirstChild("GiverScript") then
            firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso"), v.Parent, 0)
        end
    end
end)

for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if (v:IsA("Tool") or v:IsA("HopperBin")) and v.Parent:FindFirstChild("GiverScript") then
        Dropdown:Add(v.Name)
    end
end