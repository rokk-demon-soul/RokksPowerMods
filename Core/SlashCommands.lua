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

        if command == "toggleChat" then
            addon.toggleChat = not addon.toggleChat
            addon.hideChat(addon.toggleChat)
        end
    end
end


function addon.toggleChat(self, key)
   addon.hideChat(not rpmChatHidden)
end