local addonName, addon = ...

function addon.updateInstanceType()
    addon.instanceType = addon.getInstanceType()

    if addon.instanceType ~= addon.previousInstanceType then
        addon.loadDefaultMods()
    end

    addon.loadInstanceMods(addon.instanceType)
    addon.previousInstanceType = addon.instanceType
end

function addon.getInstanceType()
    local instanceName, instanceType = GetInstanceInfo()

    if     instanceType == "arena"  then instanceType = "arena"
    elseif instanceType == "pvp"    then instanceType = "battleground"
    elseif instanceType == "party"  then instanceType = "dungeon"
    elseif instanceType == "raid"   then instanceType = "raid"
    else                                 instanceType = "world"
    end

    return instanceType
end

function addon.loadInstanceMods(instanceType)
    for settingName, settingValue in pairs(addon.settings[instanceType]) do
        if type(addon[settingName]) == "function" then
            addon[settingName](settingValue)
        end
    end
end

function addon.loadDefaultMods()
    if addon.previousInstanceType ~= nil then
        addon.print("Leaving " .. tostring(addon.previousInstanceType) .. ", entering " .. tostring(addon.instanceType) .. ".")
    else
        addon.print("Entering " .. tostring(addon.instanceType) .. ".")
    end

    addon.print("Loading default mods.")

    for settingName, settingValue in pairs(addon.settings.global) do
        if type(addon[settingName]) == "function" then
            addon[settingName](settingValue)
        end
    end
end