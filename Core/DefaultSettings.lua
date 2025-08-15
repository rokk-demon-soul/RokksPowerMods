local addonName, addon = ...

addon.defaultSettings = {
    ["appConfig"] = {
        ["delayTime"] = .5,
    },
    
    ["global"] = {
        ["fadeMapWhileMoving"] = false,
        -- ["cameraZoom"] = 2,
        ["autoPushSpellsToActionBar"] = false,
        ["enableIndirectCamera"] = true,
        ["autoCollapseBuffs"] = false,

        ["hideButtonCastAnimation"] = true,
        ["hideButtonMacroText"] = true,
        ["hideButtonHotkeyText"] = true,

        ["hideBlizzardAuras"] = true,

        -- ["hideChat"] = false,
        ["hidePlayerFrame"] = true,
        ["hideBuffFrame"] = true,
        ["hideDebuffFrame"] = true,
        ["hideTargetFrame"] = true,
        ["hideFocusFrame"] = true,
        ["hidePetFrame"] = true,
        ["hideMicroMenu"] = true,
        ["hideBagsBar"] = true,
        ["hideQuestFrame"] = false,
        ["hideZoneMap"] = false,
        ["hideMinimap"] = false,
        ["hideGroupFinderEyeball"] = false,
        ["hidePartyFrames"] = false,
        ["hideRaidFrames"] = false,
        ["hideBossFrames"] = false,
        ["hideEnemyArenaFrames"] = false,
        ["hideBGObjectiveFrames"] = true,
        -- ["hideStatusBar"] = false,
        -- ["fadeBar1"] = false,
        -- ["fadeBar2"] = false,
        -- ["fadeBar3"] = false,
        -- ["fadeBar4"] = false,
        -- ["fadeBar5"] = false,
        ["fadeBar6"] = true,
        ["fadeBar7"] = true,
        ["fadeBar8"] = true,
        ["fadePetbar"] = true,
        -- ["resizeTransmogFrame"] = 1.6,
        -- ["resizeCollectionsJournal"] = 1.6,
        ["arenaHealerMacros"] = false,
    },

    ["arena"] = {
        -- ["cameraZoom"] = 1.6,
        ["hideQuestFrame"] = true,
        ["hideZoneMap"] = false,
        ["hideGroupFinderEyeball"] = true,
        ["hidePartyFrames"] = true,
        ["hideEnemyArenaFrames"] = true,
        ["arenaHealerMacros"] = false,
        -- ["hideStatusBar"] = true,
        ["hideMinimap"] = true,
        -- ["hideChat"] = false,
        ["fadeBar7"] = false,
        ["fadeBar8"] = false,
    },

    ["battleground"] = {
        ["hideRaidFrames"] = true,
        ["hideMinimap"] = false,
        ["hideGroupFinderEyeball"] = false,
        ["hideQuestFrame"] = true,
        -- ["cameraZoom"] = 2,
        -- ["hideChat"] = false,
        ["hideBossFrames"] = true,
        ["hideBGObjectiveFrames"] = true,
    },

    ["dungeon"] = {
        -- ["cameraZoom"] = 2,
        ["hideGroupFinderEyeball"] = true,
        ["arenaHealerMacros"] = false,
        ["fadeBar7"] = false,
        ["fadeBar8"] = false,
    },

    ["raid"] = {
        -- ["cameraZoom"] = 2.6,
    },

    ["world"] = {
    }
}
