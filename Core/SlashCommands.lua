local addonName, addon = ...

function addon.registerSlashCommands()
    SLASH_rpm1 = "/rpm"
    SlashCmdList["rpm"] = function(...)
        local slashParams = select(1, ...)
        local params = {strsplit(" ", slashParams)}
        local command = params[1]
        local param = params[2]
        table.remove(params, 1)

        if command == "" then
            addon.help()
        end
    end
end