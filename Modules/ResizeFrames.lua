local addonName, addon = ...

addon.resizeFrameList = {}

function addon.resizeAllFrames()
    if InCombatLockdown() then return end
    for frameName, resizeInfo in pairs(addon.resizeFrameList) do
        local frame = _G[frameName]

        if frame then
            local isVisible = frame:IsShown()
            local shownStateChanged = isVisible ~= resizeInfo.isVisible

            if resizeInfo.resize or (shownStateChanged) then
                if isVisible then
                    frame:ClearAllPoints()
                    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
                    frame:SetScale(resizeInfo.scale)
                end
                resizeInfo.resize = false
                resizeInfo.isVisible = isVisible
            end
        end
    end
end

-- function addon.resizeTransmogFrame(scale)
--     local scale = scale == nil and 1 or scale
--     addon.resizeFrameList["WardrobeFrame"] = {}
--     addon.resizeFrameList["WardrobeFrame"].scale = scale
--     addon.resizeFrameList["WardrobeFrame"].resize = true
-- end

-- function addon.resizeCollectionsJournal(scale)
--     local scale = scale == nil and 1 or scale
--     addon.resizeFrameList["CollectionsJournal"] = {}
--     addon.resizeFrameList["CollectionsJournal"].scale = scale
--     addon.resizeFrameList["CollectionsJournal"].resize = true
-- end

--C_Timer.NewTicker(.1, addon.resizeAllFrames)