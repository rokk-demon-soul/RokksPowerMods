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
        ["autoCollapseBuffs"] = true,

        ["hideButtonGlows"] = true,
        ["hideButtonCastAnimation"] = true,
        ["hideButtonMacroText"] = true,
        ["hideButtonHotkeyText"] = true,

        ["hideChat"] = false,
        ["hidePlayerFrame"] = true,
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
        -- ["hideStatusBar"] = false,
        -- ["fadeBar1"] = false,
        -- ["fadeBar2"] = false,
        -- ["fadeBar3"] = false,
        -- ["fadeBar4"] = false,
        -- ["fadeBar5"] = false,
        ["fadeBar6"] = true,
        -- ["fadeBar7"] = false,
        -- ["fadeBar8"] = false,
        ["fadePetbar"] = true,

        -- ["resizeTransmogFrame"] = 1.6,
        -- ["resizeCollectionsJournal"] = 1.6,

        ["arenaHealerMacros"] = false,
    },

    ["arena"] = {
        -- ["cameraZoom"] = 1.6,
        ["hideQuestFrame"] = true,
        ["hideZoneMap"] = true,
        ["hideGroupFinderEyeball"] = true,
        ["hidePartyFrames"] = true,
        ["hideEnemyArenaFrames"] = true,
        ["arenaHealerMacros"] = true,
        -- ["hideStatusBar"] = true,
        ["hideMinimap"] = true,
        ["hideChat"] = true,
    },

    ["battleground"] = {
        ["hideRaidFrames"] = true,
        ["hideMinimap"] = true,
        ["hideGroupFinderEyeball"] = false,
        ["hideQuestFrame"] = true,
        -- ["cameraZoom"] = 2,
        ["hideChat"] = true,
        ["hideBossFrames"] = true,
    },

    ["dungeon"] = {
        -- ["cameraZoom"] = 2,
        ["hideGroupFinderEyeball"] = true,
        ["arenaHealerMacros"] = true,
    },

    ["raid"] = {
        -- ["cameraZoom"] = 2.6,
    },

    ["world"] = {
    }
}
