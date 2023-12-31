---Easier NUI Messages
function SendMessage(action, message)
    SendNUIMessage({
        action = action,
        message = message
    })
end

function InitializeHUD()
    DisplayRadar(true)
    repeat Wait(100) until PlayerIsLoaded
    print('HUD initialized')
    SendMessage('toggleHud', PlayerIsLoaded)
end

-- NUI callback
RegisterNUICallback('nuiReady', function(_, cb)
    NuiReady = true
    cb({})
end)


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true
    Mrlutin.log('info', json.encode(playerData, {indent=true}))
end)


