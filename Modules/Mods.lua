local addonName, addon = ...

function addon.fadeMapWhileMoving(fade)
    local mapFade = fade == true and "1" or "0"
    SetCVar("mapFade", mapFade)
end

function addon.maxCameraZoom(maxZoom)
    local maxZoom = maxZoom and "2.6" or GetCVarDefault("cameraDistanceMaxZoomFactor")
    local setZoom = maxZoom and 30 or 15
    SetCVar("cameraDistanceMaxZoomFactor", maxZoom)
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