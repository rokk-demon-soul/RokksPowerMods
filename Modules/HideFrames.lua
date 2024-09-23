local addonName, addon = ...

function addon.hideChat(hideChat)
    local alpha = hideChat == true and 0 or 1    
    C_Timer.After(addon.settings.appConfig.delayTime, function()
        for i = 1, NUM_CHAT_WINDOWS do
            local tab = _G["ChatFrame" .. i .. "Tab"]
            local window = _G["ChatFrame" .. i]
    
            if not tab and not window then return end
    
            tab:SetAlpha(alpha)
            window:SetAlpha(alpha)
        end    
    end)
end

function addon.hookOnShow_Visibility(frame)
    if InCombatLockdown() then return end
    frame.RokksPowerMods = frame.RokksPowerMods ~= nil and frame.RokksPowerMods or {}
    
    function frame.RokksPowerMods.setVisibility(frame)
        if InCombatLockdown() or not frame.RokksPowerMods then return end
        local hidden = frame.RokksPowerMods.hidden == true and true or false
        
        if hidden then
            if frame.RokksPowerMods.alphaOnly then
                frame:SetAlpha(0)
            else
                frame:Hide()
            end
        elseif frame.RokksPowerMods.allowShow then
            frame:SetAlpha(1)
            frame:Show()
        end
    end
    
    frame.resetParent = addon.resetParent
    frame:UnregisterEvent("UNIT_PET")
    frame:HookScript("OnShow", frame.RokksPowerMods.setVisibility)
end

function addon.setFrameVisibility(name, state, preventShow, alphaOnly)
    if InCombatLockdown() then return end
    
    local frame = _G[name]

    if not frame then return end
    
    frame.RokksPowerMods = frame.RokksPowerMods ~= nil and frame.RokksPowerMods or {}
    if not frame.RokksPowerMods.isVisibilityHookSet then
        addon.hookOnShow_Visibility(frame)
        frame.RokksPowerMods.isVisibilityHookSet = true
    end
    
    frame.RokksPowerMods.hidden = state == "hide" and true or false
    frame.RokksPowerMods.alphaOnly = alphaOnly
    frame.RokksPowerMods.allowShow = not preventShow
    
    frame.RokksPowerMods.setVisibility(frame)
end

function addon.hidePlayerFrame(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("PlayerFrame", state, false, true)
end

function addon.hideTargetFrame(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("TargetFrame", state, true, true)
end

function addon.hideFocusFrame(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("FocusFrame", state, true, true)
end

function addon.hidePetFrame(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("PetFrame", state, true, true)
end

function addon.hideMicroMenu(hide)
    local state = hide == true and "hide" or "show"

    QueueStatusButton:SetParent(UIParent)
    addon.setFrameVisibility("MicroMenuContainer", state)
end

function addon.hideBagsBar(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("BagsBar", state)
end

function addon.hideQuestFrame(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("ObjectiveTrackerFrame", state)
end

function addon.hideZoneMap(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("BattlefieldMapFrame", state)
end

function addon.hideMinimap(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("MinimapCluster", state)
end

function addon.hideGroupFinderEyeball(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("QueueStatusButton", state, true, true)
end

function addon.hidePartyFrames(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("PartyFrame", state, true)
end

function addon.hideRaidFrames(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("CompactRaidGroup1", state, true)
    addon.setFrameVisibility("CompactRaidGroup2", state, true)
    addon.setFrameVisibility("CompactRaidGroup3", state, true)
    addon.setFrameVisibility("CompactRaidGroup4", state, true)
    addon.setFrameVisibility("CompactRaidGroup5", state, true)
    addon.setFrameVisibility("CompactRaidGroup6", state, true)
    addon.setFrameVisibility("CompactRaidGroup7", state, true)
    addon.setFrameVisibility("CompactRaidGroup8", state, true)
end

function addon.hideBossFrames(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("Boss1TargetFrame", state, true)
    addon.setFrameVisibility("Boss2TargetFrame", state, true)
    addon.setFrameVisibility("Boss3TargetFrame", state, true)
    addon.setFrameVisibility("Boss4TargetFrame", state, true)
    addon.setFrameVisibility("Boss5TargetFrame", state, true)
end

function addon.arenaEnemyFrames(hide)
    local state = hide == true and "hide" or "show"
    addon.setFrameVisibility("CompactArenaFrame", state, true)
end