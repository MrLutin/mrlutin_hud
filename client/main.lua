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
    SendMessage('toggleHud', true)
    Mrlutin.log('info', json.encode(statuses, {intent=true}))
end

-- NUI callback
RegisterNUICallback('nuiReady', function(_, cb)
    NuiReady = true
    InitializeHUD()
    cb({})
end)


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true
    InitializeHUD()
end)


