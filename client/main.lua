---Easier NUI Messages
function SendMessage(action, message)
    SendNUIMessage({
        action = action,
        message = message
    })
end

function InitializeHUD()
    repeat Wait(100) until PlayerIsLoaded and NuiReady
    print('HUD initialized')
end

-- NUI callback
RegisterNUICallback('nuiReady', function(_, cb)
    InitializeHUD()
    NuiReady = true
    cb({})
end)


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    InitializeHUD()
    PlayerIsLoaded = true
    SendMessage('toggleHud', PlayerIsLoaded)
end)


