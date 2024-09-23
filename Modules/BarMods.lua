local addonName, addon = ...

addon.barConfig = {}
addon.barConfig["Bar1"] = "Action"
addon.barConfig["Bar2"] = "MultiBarBottomLeft"
addon.barConfig["Bar3"] = "MultiBarBottomRight"
addon.barConfig["Bar4"] = "MultiBarRight"
addon.barConfig["Bar5"] = "MultiBarLeft"
addon.barConfig["Bar6"] = "MultiBar5"
addon.barConfig["Bar7"] = "MultiBar6"
addon.barConfig["Bar8"] = "MultiBar7"
addon.barConfig["PetBar"] = "PetActionBar"

hooksecurefunc("ActionButton_ShowOverlayGlow", function(button)
    if not button or not button.action then return end
    
    if button.SpellActivationAlert then
        if RokksPowerMods.hideButtonGlows
            then button.SpellActivationAlert:Hide()
            else button.SpellActivationAlert:Show()
        end
    elseif button.overlay then
        if RokksPowerMods.hideButtonGlows
            then button.overlay:Hide()
            else button.overlay:Show()
        end
    end        
end)

function addon.hideButtonGlows(hideButtonGlows)
    RokksPowerMods.hideButtonGlows = hideButtonGlows
end

function addon.hideButtonCastAnimation(hideButtonCastAnimation)
    local alpha = hideButtonCastAnimation and 0 or 1

    for barUiName, barFrame in pairs(addon.barConfig) do
        for i = 1, 12 do

            local buttonFrameName = barFrame .. "Button" .. i
            local buttonFrame = _G[buttonFrameName]

            if buttonFrame then
                buttonFrame.SpellCastAnimFrame:SetAlpha(alpha)
                buttonFrame.InterruptDisplay:SetAlpha(alpha)
            end
        end
    end
end

function addon.hideButtonMacroText(hide)
    local alpha = hide == true and 0 or 1

    for barUiName, barFrame in pairs(addon.barConfig) do
        for i = 1, 12 do
            local macroFrame = _G[barFrame.."Button"..i.."Name"]        
            if macroFrame then macroFrame:SetAlpha(alpha) end
        end
    end
end

function addon.hideButtonHotkeyText(hideButtonHotkey)
    local alpha = hideButtonHotkey and 0 or 1

    for barUiName, barFrame in pairs(addon.barConfig) do
        for i = 1, 12 do
            local hotKeyFrame = _G[barFrame.."Button"..i.."HotKey"]        
            if hotKeyFrame then hotKeyFrame:SetAlpha(alpha) end
        end
    end
end