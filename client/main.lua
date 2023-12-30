PlayerLoaded = false
NuiReady = false
HUD = false

-- wait for the NUI callback
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
        lib.notify({
            id = 'hud:swimming',
            title = 'HUD',
            description = 'Looks like you are swimming, please don\'t go underwater while the HUD is loading.',
            type = 'inform',
            duration = 5000
        })
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if cache.resource ~= resourceName then return end
    InitializeHUD()
end)