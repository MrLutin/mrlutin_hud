function InitializeHUD()
    DisplayRadar(true)
    repeat Wait(100) until PlayerIsLoaded or not NuiReady
    print('HUD initialized')
end


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true
    Mrlutin.log('info', json.encode(playerData, {indent=true}))
end)