CreateThread(function()
    while true do
        if cache.vehicle then
            local model = GetEntityModel(cache.vehicle)

            SendMessage('setVehicle', {
                speed = {
                    current = GetEntitySpeed(cache.vehicle),
                    max = GetVehicleModelMaxSpeed(model)
                },
                unitsMultiplier = GetConvar('hud:unitsystem', 'imperial') == 'metric' and 3.6 or 2.236936,
                fuel = GetConvarInt('hud:fuel', false) == 1 and not IsThisModelABicycle(model) and
                        GetVehicleFuelLevel(cache.vehicle),
                electric = electricModels[model]
            })
            offVehicle = false
        elseif not offVehicle then
            SendMessage('setVehicle', false)
            offVehicle = true
        end
        Wait(200)
    end
end)