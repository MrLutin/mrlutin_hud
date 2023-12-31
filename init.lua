if not _VERSION:find('5.4') then
    error('^1Lua 5.4 must be enabled in the resource manifest!^0', 2)
end

if not GetResourceState('mrlutin_lib'):find('start') then
    StopResource( GetCurrentResourceName() ) -- force resource to be stopped
    return Mrlutin.error('^1mrlutin_lib should be started before this resource.^0')
end

-- load data & function by context
if not IsDuplicityVersion() then
    PlayerIsLoaded = false
    NuiReady = false

    if IsPedSwimming(cache.ped) then
        Mrlutin.notify({
            id = 'hud:swimming',
            title = 'Swimming time',
            description = 'Looks like you are swimming, please don\'t go underwater while the HUD is loading.',
            type = 'inform',
            duration = 10000
        })
    else
        maxUnderwaterTime = GetPlayerUnderwaterTimeRemaining(cache.playerId)
    end

    -- Support for resource restart
    AddEventHandler('onResourceStart', function(resourceName)
        if resourceName == cache.resource and cache.ped then
            PlayerIsLoaded = true
            Mrlutin.log('info', string.format('%s is now started!', cache.resource ))
        end
    end)

    -- send warn message if hud is stopped
    AddEventHandler('onResourceStop', function(resource)
        if resource == cache.resource then
            PlayerIsLoaded = false
            Mrlutin.log('warn', string.format('%s is now stopped!', cache.resource ))
        end
    end)
end

-- Server side
if IsDuplicityVersion() then

    SetConvarReplicated('game_enableFlyThroughWindscreen', 'true') -- Enable flying trough windscreen while in vehicle
    SetConvarReplicated('voice_enableUi', 'false') -- remove the pma_voice hud

    -- check the dependencies of resources
    local Success, Msg = Mrlutin.checkDependency('mrlutin_lib', '1.0.0')
    if not Success then
        StopResource( GetCurrentResourceName() )
        print(Msg)
    end
end


