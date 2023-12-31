function InitializeHUD()
    DisplayRadar(false)
    repeat Wait(100) until PlayerLoaded and NuiReady

    local defaultAspectRatio = 1920/1080 -- Don't change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX/resolutionY
    local minimapOffset = 0
    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
    end

    RequestStreamedTextureDict('squaremap', false)
    repeat Wait(100) until HasStreamedTextureDictLoaded('squaremap')
    SetMinimapClipType(0)
    AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
    AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")

    SetMinimapComponentPosition('minimap', 'L', 'B', 0.0 + minimapOffset, -0.035, 0.18, 0.21)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.0 + minimapOffset, -0.05, 0.132, 0.19)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.01 + minimapOffset, -0.015, 0.3, 0.25)

    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(true, false)
    SetMinimapClipType(0)
    SetRadarBigmapEnabled(false, false)
    Wait(500)

    if IsPedSwimming(cache.ped) then
        Mrlutin.notify({
            id = 'hud:swimming',
            title = 'HUD',
            description = 'Looks like you are swimming, please don\'t go underwater while the HUD is loading.',
            type = 'inform',
            sound = "demo",
            duration = 8000
        })
    end

    SendMessage('setPlayerId', cache.serverId)
    SendMessage('toggleHud', true)
    print('HUD initialized')
end

AddEventHandler('onResourceStart', function(resourceName)
    if cache.resource ~= resourceName then return end
    PlayerLoaded = true
    HUD = true
    Wait(500)
    InitializeHUD()
end)