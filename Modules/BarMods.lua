local addonName, addon = ...

addon.barConfig = {}
addon.barConfig["Bar1"] = { ["frameName"] = "MainMenuBar", ["buttonPrefix"] = "ActionButton", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar2"] = { ["frameName"] = "MultiBarBottomLeft", ["buttonPrefix"] = "MultiBarBottomLeftButton", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar3"] = { ["frameName"] = "MultiBarBottomRight", ["buttonPrefix"] = "MultiBarBottomRightButton", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar4"] = { ["frameName"] = "MultiBarRight", ["buttonPrefix"] = "MultiBarRightButton", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar5"] = { ["frameName"] = "MultiBarLeft", ["buttonPrefix"] = "MultiBarLeftButton", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar6"] = { ["frameName"] = "MultiBar5", ["buttonPrefix"] = "MultiBar5Button", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar7"] = { ["frameName"] = "MultiBar6", ["buttonPrefix"] = "MultiBar6Button", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["Bar8"] = { ["frameName"] = "MultiBar7", ["buttonPrefix"] = "MultiBar7Button", ["numButtons"] = 12, ["fade"] = 1 }
addon.barConfig["PetBar"] = { ["frameName"] = "PetActionBar", ["buttonPrefix"] = "PetActionButton", ["numButtons"] = 10, ["fade"] = 1 }

hooksecurefunc("ActionButton_ShowOverlayGlow", function(button)
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

    for barName, barInfo in pairs(addon.barConfig) do
        for i = 1, barInfo.numButtons do
            local buttonFrameName = barInfo.buttonPrefix .. i
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

    for barName, barInfo in pairs(addon.barConfig) do
        for i = 1, barInfo.numButtons do
            local macroFrame = _G[barInfo.buttonPrefix .. i .. "Name"]        
            if macroFrame then macroFrame:SetAlpha(alpha) end
        end
    end
end

function addon.hideButtonHotkeyText(hideButtonHotkey)
    local alpha = hideButtonHotkey and 0 or 1

    for barName, barInfo in pairs(addon.barConfig) do
        for i = 1, barInfo.numButtons do
            local hotKeyFrame = _G[barInfo.buttonPrefix .. i .. "HotKey"]        
            if hotKeyFrame then hotKeyFrame:SetAlpha(alpha) end
        end
    end
end

function addon.barOnEnter(button)
    local barConfig = addon.barConfig[button.RokksPowerMods.barName]
    local bar = _G[barConfig.frameName]

    bar:SetAlpha(1)
end

function addon.barOnLeave(button)
    local barConfig = addon.barConfig[button.RokksPowerMods.barName]
    local bar = _G[barConfig.frameName]
    local fade = barConfig.fade

    bar:SetAlpha(fade)
end

function addon.setFadeHooks()
    for barName, barInfo in pairs(addon.barConfig) do
        if not barInfo.restricted then
            local bar = _G[barInfo.frameName]
            bar.RokksPowerMods = bar.RokksPowerMods ~= nil and bar.RokksPowerMods or {}
        
            if not bar.RokksPowerMods.fadeHooksInitialized then
                bar:HookScript("OnEnter", addon.barOnEnter)
                bar:HookScript("OnLeave", addon.barOnLeave)
                bar.RokksPowerMods.barName = barName
                bar.RokksPowerMods.fadeHooksInitialized = true
            end

            for buttonIndex = 1, barInfo.numButtons do
                local buttonName = barInfo.buttonPrefix .. buttonIndex
                local button = _G[buttonName]
                button.RokksPowerMods = button.RokksPowerMods ~= nil and button.RokksPowerMods or {}

                if button then
                    if not button.RokksPowerMods.fadeHooksInitialized then
                        button:HookScript("OnEnter", addon.barOnEnter)
                        button:HookScript("OnLeave", addon.barOnLeave)
                        button.RokksPowerMods.barName = barName
                        button.RokksPowerMods.fadeHooksInitialized = true
                    end
                end
            end
        end
    end
end

function addon.fadeBar(barName, fade)
    addon.setFadeHooks()

    local barConfig = addon.barConfig[barName]
    local bar = _G[barConfig.frameName]
    local fadeValue = 0

    if fade then
        barConfig.fade = fadeValue
        bar:SetAlpha(fadeValue)
    else
        barConfig.fade = 1
        bar:SetAlpha(1)
    end
end

function addon.fadeBar1(fade)
    addon.fadeBar("Bar1", fade)
end

function addon.fadeBar2(fade)
    addon.fadeBar("Bar2", fade)
end

function addon.fadeBar3(fade)
    addon.fadeBar("Bar3", fade)
end

function addon.fadeBar4(fade)
    addon.fadeBar("Bar4", fade)
end

function addon.fadeBar5(fade)
    addon.fadeBar("Bar5", fade)
end

function addon.fadeBar6(fade)
    addon.fadeBar("Bar6", fade)
end

function addon.fadeBar7(fade)
    addon.fadeBar("Bar7", fade)
end

function addon.fadeBar8(fade)
    addon.fadeBar("Bar8", fade)
end

function addon.fadePetbar(fade)
    addon.fadeBar("PetBar", fade)
end