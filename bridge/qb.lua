if not Mrlutin.IsQBCore() then return end

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local currentStatus = {}

if PlayerData then
    PlayerLoaded = true
    DisplayRadar(false)
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerLoaded = true
    InitializeHUD()
    Wait(3000)
    currentStatus['hunger'] = PlayerData.metadata['hunger'] or 100
    currentStatus['thirst'] = PlayerData.metadata['thirst'] or 100
    currentStatus['stress'] = PlayerData.metadata['stress'] or 0
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    PlayerLoaded = false
    HUD = false
    SendMessage('toggleHud', HUD)
end)

RegisterNetEvent("QBCore:Player:SetPlayerData", function(val)
    PlayerData = val
end)

RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
    currentStatus['hunger'] = newHunger
    currentStatus['thirst'] = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
    currentStatus['stress'] = newStress
end)


CreateThread(function()
    while true do
        SendMessage('status', {
            hunger = currentStatus['hunger'] or 100,
            thirst = currentStatus['thirst'] or 100,
            stress = currentStatus['stress'] or 0,
        })
        Wait(500)
    end
end)