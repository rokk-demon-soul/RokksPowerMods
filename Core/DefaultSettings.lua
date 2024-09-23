local addonName, addon = ...

addon.defaultSettings = {
    ["appConfig"] = {
        ["delayTime"] = .5,
    },
    ["global"] = {
        ["fadeMapWhileMoving"] = false,
        ["maxCameraZoom"] = true,
        ["autoPushSpellsToActionBar"] = false,
        ["enableIndirectCamera"] = true,
        ["autoCollapseBuffs"] = true,

        ["hideButtonGlows"] = false,
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
        ["arenaEnemyFrames"] = false,

        ["powerMacros"] = false,
    },

    ["arena"] = {
        ["hideQuestFrame"] = true,
        ["hideZoneMap"] = true,
        ["hideMinimap"] = true,
        ["hideGroupFinderEyeball"] = true,

        ["powerMacros"] = true,
    },

    ["battleground"] = {
        ["hideRaidFrames"] = false,
    },

    ["dungeon"] = {
        ["hideZoneMap"] = true,
        ["powerMacros"] = true,
        ["hideGroupFinderEyeball"] = true,
    },

    ["raid"] = {
    },

    ["world"] = {
    }
}
