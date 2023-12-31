
-- Global Seatbel thread
CreateThread(function()
    while true do
        if cache.vehicle then
            local model = GetEntityModel(cache.vehicle)
            local currentSpeed = GetEntitySpeed(cache.vehicle)
            local isMetric = ShouldUseMetricMeasurements()
            local units = isMetric and 3.6 or 2.236936
            local nitrous = Entity(cache.vehicle).state.nitrous
            SendMessage('setSeatbelt', { toggled = true, buckled = true })
        elseif not cache.vehicle then
            SendMessage('setSeatbelt', { toggled = true, buckled = false })
        end
        Wait(200)
    end
end)