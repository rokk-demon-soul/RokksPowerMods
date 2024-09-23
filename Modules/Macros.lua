local addonName, addon = ...

function addon.powerMacros(enable)
    if InCombatLockdown() then return end
    local enableMacros = enable == true and true or false    
    
    if enableMacros then
        local friendlyHealer, friendlyTank = addon.getPartyUnits()
        local enemyHealer = addon.getArenaUnits()
        
        if friendlyHealer == nil and
        friendlyTank == nil and
        enemyHealer == nil 
        then return
        end

        for index = 1, 138 do
            local name, icon, body = GetMacroInfo(index)
            if friendlyHealer ~= nil then addon.updateMacro("@friendlyHealer", friendlyHealer, index, name, icon, body) end
            if friendlyTank ~= nil then addon.updateMacro("@friendlyTank", friendlyTank, index, name, icon, body) end
            if enemyHealer ~= nil then addon.updateMacro("@enemyHealer", enemyHealer, index, name, icon, body) end
        end
    else
        if addon.settings.changedMacros == nil then return end

        for index, macro in pairs(addon.settings.changedMacros) do
            EditMacro(macro.index, macro.name, macro.icon, macro.body)
        end
    
        addon.settings.changedMacros = nil    
    end
end

function addon.updateMacro(tag, unit, index, name, icon, body)
    unit = "@" .. unit

    if InCombatLockdown() or
       tag == nil or unit == nil or index == nil or name == nil or body == nil or
       not body:find(tag) then return
    end

    local macroInfo = {
        ["index"] = index,
        ["name"] = name,
        ["icon"] = icon,
        ["body"] = body
    }

    addon.settings.changedMacros = addon.settings.changedMacros ~= nil and addon.settings.changedMacros or {}
    table.insert(addon.settings.changedMacros, macroInfo)

    body = body:gsub(tag, unit)
    EditMacro(index, name, icon, body)
end

function addon.getArenaUnits()
    local healer = nil
    local tank = nil
    local dps = nil
    local index = nil

    for index = 1, 3 do
        local specId = GetArenaOpponentSpec(index)

        if specId ~= nil and specId > 0 then
            local specId, name, description, icon, role = GetSpecializationInfoByID(specId)
            if role == "HEALER" then
                healer = "arena" .. tostring(index)
            end
            if role == "TANK" then
                tank = "arena" .. tostring(index)
            end
            if role == "DAMAGER" then
                dps = "arena" .. tostring(index)
            end
        end
    end

    return healer, tank, dps
end

function addon.getPartyUnits()
    local healer = nil
    local tank = nil
    local dps = nil
    local index = nil

    for index = 1, GetNumSubgroupMembers() do
        local role = UnitGroupRolesAssigned("party" .. index)
        if (role == "HEALER") then
            healer = "party" .. tostring(index)
        end
        if (role == "TANK") then
            tank = "party" .. tostring(index)
        end
        if (role == "DAMAGER") then
            dps = "party" .. tostring(index)
        end
    end

    return healer, tank, dps
end