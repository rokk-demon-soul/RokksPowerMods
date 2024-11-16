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
    frame.RokksPowerMods = frame.RokksPowerMods ~= nil and frame.RokksPowerMods or {}
    
    function frame.RokksPowerMods.setVisibility(frame)
        if not frame.RokksPowerMods then return end
        local hidden = frame.RokksPowerMods.hidden == true and true or false
       
        if hidden then
            if InCombatLockdown() then return end
            if frame.RokksPowerMods.alphaOnly then
                C_Timer.After(addon.settings.appConfig.delayTime, function()
                    if addon.updateHideState(frame) then frame:SetAlpha(0) end
                end)
            else
                C_Timer.After(addon.settings.appConfig.delayTime, function()
                    if addon.updateHideState(frame) then frame:Hide() end
                end)
            end
        else
            frame:SetAlpha(1)
            if frame.RokksPowerMods.allowShow then frame:Show() end
        end
    end
    
    frame.resetParent = addon.resetParent
    -- frame:UnregisterEvent("UNIT_PET")
    frame:HookScript("OnShow", frame.RokksPowerMods.setVisibility)
end

function addon.updateHideState(frame)
    local visible = frame:IsShown()

    local inCombat = InCombatLockdown()
    --local protected = frame:IsProtected()
    --print(tostring(frame:GetDebugName()) .. " protected: " .. tostring(protected))
    local outOfSync = visible and not hidden or not visible and hidden
    
    return not inCombat and outOfSync
end

function addon.setFrameVisibility(name, state, options)
    if InCombatLockdown() then return end
    
    local preventShow, alphaOnly

    if options then
        preventShow = options.preventShow
        alphaOnly = options.alphaOnly
    else
        preventShow = false
        alphaOnly = false
    end

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
    frame.RokksPowerMods.frameName = name
    
    frame.RokksPowerMods.setVisibility(frame)
end

function addon.hidePlayerFrame(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = false, alphaOnly = true }
    addon.setFrameVisibility("PlayerFrame", state, options)
end

function addon.hideTargetFrame(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = true }
    addon.setFrameVisibility("TargetFrame", state, options)
end

function addon.hideFocusFrame(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = true }
    addon.setFrameVisibility("FocusFrame", state, options)
end

function addon.hidePetFrame(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = true }
    addon.setFrameVisibility("PetFrame", state, options)
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
    local options = { preventShow = false, alphaOnly = true }
    addon.setFrameVisibility("QueueStatusButton", state, options)
end

function addon.hidePartyFrames(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = false }
    addon.setFrameVisibility("PartyFrame", state, options)
end

function addon.hideRaidFrames(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = false }
    addon.setFrameVisibility("CompactRaidGroup1", state, options)
    addon.setFrameVisibility("CompactRaidGroup2", state, options)
    addon.setFrameVisibility("CompactRaidGroup3", state, options)
    addon.setFrameVisibility("CompactRaidGroup4", state, options)
    addon.setFrameVisibility("CompactRaidGroup5", state, options)
    addon.setFrameVisibility("CompactRaidGroup6", state, options)
    addon.setFrameVisibility("CompactRaidGroup7", state, options)
    addon.setFrameVisibility("CompactRaidGroup8", state, options)
end

-- function addon.hideRaidFrameManager(hide)
--     local state = hide == true and "hide" or "show"
--     addon.setFrameVisibility("CompactRaidFrameManager", state, true)
-- end

function addon.hideBossFrames(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = false }
    addon.setFrameVisibility("Boss1TargetFrame", state, options)
    addon.setFrameVisibility("Boss2TargetFrame", state, options)
    addon.setFrameVisibility("Boss3TargetFrame", state, options)
    addon.setFrameVisibility("Boss4TargetFrame", state, options)
    addon.setFrameVisibility("Boss5TargetFrame", state, options)
end

function addon.hideEnemyArenaFrames(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = false }
    addon.setFrameVisibility("CompactArenaFrame", state, options)
end

function addon.hideStatusBar(hide)
    local state = hide == true and "hide" or "show"
    local options = { preventShow = true, alphaOnly = false }
    addon.setFrameVisibility("MainStatusTrackingBarContainer", state, options)
    addon.setFrameVisibility("MainStatusTrackingBar", state, options)
end