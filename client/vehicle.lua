local electricModels = {
    [`airtug`] = true,
    [`caddy`] = true,
    [`caddy2`] = true,
    [`caddy3`] = true,
    [`cyclone`] = true,
    [`cyclone2`] = true,
    [`dilettante`] = true,
    [`dilettante2`] = true,
    [`imorgon`] = true,
    [`iwagen`] = true,
    [`khamelion`] = true,
    [`neon`] = true,
    [`omnisegt`] = true,
    [`powersurge`] = true,
    [`raiden`] = true,
    [`rcbandito`] = true,
    [`surge`] = true,
    [`tezeract`] = true,
    [`virtue`] = true,
    [`voltic`] = true,
    [`voltic2`] = true,
}

CreateThread(function()
    while true do
        if cache.vehicle then
            local model = GetEntityModel(cache.vehicle)
            local vehEntity = Entity(cache.vehicle).state
            SendMessage('setVehicle', {
                isMetric = ShouldUseMetricMeasurements(),
                rpm = GetVehicleCurrentRpm(cache.vehicle),
                speed = {current = GetEntitySpeed(cache.vehicle), max = GetVehicleModelMaxSpeed(model)},
                electric = electricModels[model] or false,
                fuel = vehEntity.fuel or GetVehicleFuelLevel(cache.vehicle),
                nitrous = vehEntity.nitrous or 0,
            })
            offVehicle = false
        elseif not offVehicle then
            SendMessage('setVehicle', false)
            offVehicle = true
        end
        Wait(200)
    end
end)