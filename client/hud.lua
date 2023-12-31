Citizen.CreateTread(function()
    repeat Wait(100) until PlayerIsLoaded and NuiReady

    while PlayerIsLoaded and NuiReady do

        -- hide hud if PauseMenu is Active
        SendMessage('toggleHud', IsPauseMenuActive())

        -- set current health of player
        SendMessage('setHealth', {
            current = GetEntityHealth(cache.ped),
            max = GetEntityMaxHealth(cache.ped)
        })

        -- armour data
        SendMessage('setArmour', GetPedArmour(cache.ped))

    end

    SendMessage('toggleHud', true)
    SendMessage('setPlayerId', cache.serverId)
    print('HUD initialized')
end)