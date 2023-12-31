---Easier NUI Messages
function SendMessage(action, message)
    SendNUIMessage({
        action = action,
        message = message
    })
end

function InitializeHUD()

end

-- NUI callback
RegisterNUICallback('nuiReady', function(_, cb)
    NuiReady = true
    cb({})
end)


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true
end)


