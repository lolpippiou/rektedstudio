local function ontp(s)
    if syn and syn.queue_on_teleport then
        syn.queue_on_teleport(s)
    elseif queue_on_teleport then
        queue_on_teleport(s)
    end
end

repeat wait() until game:IsLoaded()

wait(3)

loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpippiou/rektedstudio/main/script.lua"))()
ontp([[loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpippiou/rektedstudio/main/loader.lua"))()]])