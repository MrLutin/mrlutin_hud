Citizen.CreateThread(function()
    repeat Wait(100) until PlayerIsLoaded and NuiReady

    print('HUD initialized')
    SendMessage('toggleHud', true)
    SendMessage('setPlayerId', cache.serverId)

    -- statuses loop
    while true do
        -- hide hud if PauseMenu is Active
        SendMessage('toggleHud', IsPauseMenuActive())

        -- set current health of player
        SendMessage('setHealth', {
            current = GetEntityHealth(cache.ped),
            max = GetEntityMaxHealth(cache.ped)
        })

        -- armour data
        SendMessage('setArmour', GetPedArmour(cache.ped))

        Citizen.Wait(1000)
    end
end)