---Easier NUI Messages
function SendMessage(action, message)
    SendNUIMessage({
        action = action,
        message = message
    })
end

function InitializeHUD()
    repeat Wait(100) until PlayerIsLoaded and NuiReady
    SendMessage('toggleHud', true)
    print('HUD initialized')
end

-- NUI callback
RegisterNUICallback('nuiReady', function(_, cb)
    NuiReady = true
    InitializeHUD()
    cb({})
end)


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true

    SendMessage('setPlayerId', cache.serverId)
    SendMessage('setHealth', { current = GetEntityHealth(cache.ped), max = GetEntityMaxHealth(cache.ped) })
end)


