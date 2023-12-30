if not _VERSION:find('5.4') then
    error('^1Lua 5.4 must be enabled in the resource manifest!^0', 2)
end

if not GetResourceState('mrlutin_lib'):find('start') then
    StopResource( GetCurrentResourceName() ) -- force resource to be stopped
    return Mrlutin.error('^1mrlutin_lib should be started before this resource.^0')
end

-- load data & function by context
if IsDuplicityVersion() then
    -- check if dependencies for some other resources
    local mrSuccess, mrMsg = Mrlutin.checkDependency('mrlutin_lib', '1.0.0')
    local oxSuccess, oxMsg = Mrlutin.checkDependency('ox_lib', '3.12.0')

    -- if dependencies not found
    if not mrSuccess or not oxSuccess then
        StopResource( GetCurrentResourceName() )
        print(mrMsg or oxMsg)
    end
else
    RegisterNUICallback('nuiReady', function(_, cb)
        NuiReady = true
        cb({})
    end)

    ---Easier NUI Messages
    ---@param action string
    ---@param message any
    function SendMessage(action, message)
        SendNUIMessage({
            action = action,
            message = message
        })
    end
end


