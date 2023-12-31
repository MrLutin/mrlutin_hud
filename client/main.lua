function InitializeHUD()
    DisplayRadar(false)
    repeat Wait(100) until PlayerIsLoaded and NuiReady
    print('HUD initialized')
end


AddEventHandler('Mrlutin:OnPlayerLoaded', function(playerData)
    PlayerIsLoaded = true
    Mrlutin.log('info', json.encode(playerData, {indent=true}))
end)