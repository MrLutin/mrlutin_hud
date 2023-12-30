if not Mrlutin.IsOXCore() then return end

local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

if player then
    PlayerLoaded = true
end

RegisterNetEvent('ox:playerLoaded', function()
    PlayerLoaded = true
    InitializeHUD()
end)

RegisterNetEvent('ox:playerLogout', function()
    PlayerLoaded = false
    HUD = false
    SendMessage('toggleHud', HUD)
end)

AddEventHandler('ox:statusTick', function(values)
    SendMessage('status', values)
end)
