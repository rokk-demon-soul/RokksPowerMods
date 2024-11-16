local addonName, addon = ...

function addon.fadeMapWhileMoving(fade)
    local mapFade = fade == true and "1" or "0"
    SetCVar("mapFade", mapFade)
end

function addon.cameraZoom(zoom)
    -- max 2.6
    local maxZoom = maxZoom and "2.6" or GetCVarDefault("cameraDistanceMaxZoomFactor")
    zoom = zoom ~= nil and zoom or 1
    SetCVar("cameraDistanceMaxZoomFactor", zoom)
    CameraZoomOut(50)
end

function addon.autoPushSpellsToActionBar(autoPush)
    local autoPush = flag == true and "1" or "0"
    ConsoleExec("AutoPushSpellToActionBar " .. autoPush)
end

function addon.enableIndirectCamera(indirectCamera)
    local indirectVisibility = indirectCamera == true and "1" or "0"
    local cameraIndirectOffset = GetCVarDefault("cameraIndirectOffset")
    
    ConsoleExec("cameraIndirectVisibility " .. indirectVisibility)
    ConsoleExec("cameraIndirectOffset " .. cameraIndirectOffset)
end

function addon.autoCollapseBuffs(autoCollapseBuffs)
    if autoCollapseBuffs ~= true then return end

    BuffFrame.CollapseAndExpandButton:Click()
end
