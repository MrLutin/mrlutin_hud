local hasSeatbelt = false
local hasHarnest = false

RegisterKeyMapping('seatbelt', 'Put/Take off Seatbelt', 'keyboard', 'b')
RegisterCommand('seatbelt', function()
    hasSeatbelt = not hasSeatbelt

    if hasSeatbelt then
        SendMessage('setSeatbelt', { toggled = true, buckled = true })
        SetFlyThroughWindscreenParams(120.0, 120.0, 0.0, 0.0)
    elseif hasHarnest then
        SendMessage('setSeatbelt', { toggled = true, buckled = true })
        SetFlyThroughWindscreenParams(1000.0, 1000.0, 0.0, 0.0)
    else
        SendMessage('setSeatbelt', { toggled = true, buckled = false })
        ResetFlyThroughWindscreenParams()
    end
end, false)

-- Global Seatbel thread
CreateThread(function()
    while true do
        if cache.vehicle and ( hasSeatbelt or hasHarnest ) then
            local model = GetEntityModel(cache.vehicle)
            local currentSpeed = GetEntitySpeed(cache.vehicle)
            local isMetric = ShouldUseMetricMeasurements()
            local units = isMetric and 3.6 or 2.236936
            local nitrous = Entity(cache.vehicle).state.nitrous

        elseif not cache.vehicle then
            hasSeatbelt = false
            hasHarnest = false
        end
        Wait(200)
    end
end)