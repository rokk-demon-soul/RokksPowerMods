local addonName, addon = ...

RokksPowerMods = {}

function addon.initialize()
    if addon.initialized then return end
    
    addon.loadSettings()
    addon.setLocalization()
    addon.registerSlashCommands()

    addon.initialized = true
end

function addon.loadSettings()
    -- Uncomment to load settings from saved variables

    -- if RokksPowerModsData == nil then
    --     RokksPowerModsData = addon.copy(addon.defaultSettings)
    -- end
    -- addon.settings = RokksPowerModsData

    addon.settings = addon.copy(addon.defaultSettings)
end
