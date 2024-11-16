local addonName, addon = ...

function addon.registerEvents()
    if addon.eventFrame == nil then
        addon.eventFrame = CreateFrame("Frame", nil, UIParent)
    end
    
    addon.eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    addon.eventFrame:RegisterEvent("ADDON_LOADED")
    addon.eventFrame:RegisterEvent("PVP_MATCH_ACTIVE")
    addon.eventFrame:RegisterEvent("PVP_MATCH_INACTIVE")
    addon.eventFrame:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
    addon.eventFrame:RegisterEvent("ARENA_OPPONENT_UPDATE")
    addon.eventFrame:RegisterEvent("PLAYER_ROLES_ASSIGNED")
    addon.eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

    addon.eventFrame:SetScript("OnEvent", addon.routeEvent)
end

function addon.routeEvent(self, event, ...)
    if addon.settings ~= nil and addon.settings.enabled == false then return end

    if event == "ADDON_LOADED" then
        local loadedAddon = select(1, ...)
        if loadedAddon == "RokksPowerMods" then
            addon.initialize()
            addon.updateInstanceType()
        end
    end

    if event == "PLAYER_TARGET_CHANGED" then
        if not addon.initialized then return end
        addon.updateInstanceType() 
    end

    if event == "PVP_MATCH_ACTIVE" or "ARENA_PREP_OPPONENT_SPECIALIZATIONS" or "ARENA_OPPONENT_UPDATE" then
        if not addon.initialized then return end
        addon.updateInstanceType() 
    end

    if event == "PVP_MATCH_INACTIVE" then
        if not addon.initialized then return end
        addon.updateInstanceType()       
    end

    if event == "PLAYER_ROLES_ASSIGNED" then
        if not addon.initialized then return end
        addon.updateInstanceType()
    end
    
    if event == "PLAYER_ENTERING_WORLD" then
        if not addon.initialized then return end
        addon.updateInstanceType()
    end
end
