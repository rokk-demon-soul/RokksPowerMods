local addonName, addon = ...

function addon.initialize()
    if addon.initialized then return end
    
    addon.loadSettings()
    addon.setLocalization()
    addon.registerSlashCommands()

    RokksPowerMods = {}

    addon.initialized = true
end

function addon.loadSettings()
    -- Load settings from saved variables
    -- if aba7a9aba1ec4948bdcaf04f9477363e == nil then
    --     aba7a9aba1ec4948bdcaf04f9477363e = addon.copy(addon.defaultSettings)
    -- end
    -- addon.settings = aba7a9aba1ec4948bdcaf04f9477363e

    addon.settings = addon.copy(addon.defaultSettings)
end
