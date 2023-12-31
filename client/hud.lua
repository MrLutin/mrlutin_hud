Citizen.CreateThread(function()

    DisplayRadar(false)

    repeat Wait(100) until PlayerIsLoaded and NuiReady

    print('HUD initialized')
    SendMessage('setPlayerId', cache.serverId)

    -- statuses loop
    while true do
        -- hide hud if PauseMenu is Active
        SendMessage('toggleHud', not IsPauseMenuActive())

        -- set current health of player
        SendMessage('setHealth', {
            current = GetEntityHealth(cache.ped),
            max = GetEntityMaxHealth(cache.ped)
        })

        -- armour data
        if GetPedArmour(cache.ped) > 0 then
            SendMessage('setArmour', GetPedArmour(cache.ped))
        end


        Citizen.Wait(50)
    end
end)