CreateThread(function()
    while true do
        if cache.vehicle then
            local model = GetEntityModel(cache.vehicle)

            SendMessage('setVehicle', {
                speed = {
                    current = GetEntitySpeed(cache.vehicle),
                    max = GetVehicleModelMaxSpeed(model)
                },
                unitsMultiplier = 3.6,
                fuel = GetVehicleFuelLevel(cache.vehicle),
            })
            offVehicle = false
        elseif not offVehicle then
            SendMessage('setVehicle', false)
            offVehicle = true
        end
        Wait(200)
    end
end)