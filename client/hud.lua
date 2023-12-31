Citizen.CreateThread(function()

    DisplayRadar(false)
    local voiceCon = MumbleIsConnected()

    repeat Wait(100) until PlayerIsLoaded and NuiReady

    print('HUD initialized')
    SendMessage('setPlayerId', cache.serverId)

    if not voiceCon then
        Mrlutin.alert({
            title = "Voice connection",
            description = "Aucun micro détecté! veuillez activer le chat vocal ou un kick automatique sera effectué"
        })
    end


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

        if voiceCon then
            SendMessage('setVoice', NetworkIsPlayerTalking(cache.playerId))
        else
            SendMessage('setVoice', 'disconnected')
        end

        Citizen.Wait(50)
    end

    AddEventHandler('pma-voice:setTalkingMode', function(mode)
        SendMessage('setVoiceRange', mode)
    end)
end)