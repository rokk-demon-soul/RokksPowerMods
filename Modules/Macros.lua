local addonName, addon = ...

function addon.arenaHealerMacros(enabled)
    if not enabled then
        addon.arenaHealerInitialized = false
        return
    end

    if InCombatLockdown() then return end
    local enableMacros = enable == true and true or false    
    
    local enemyHealer, tank, dps = addon.getArenaUnits()
    local friendlyHealer, friendlytank, friendlydps = addon.getPartyUnits()
    
    enemyHealer = enemyHealer ~= nil and enemyHealer or "arena3"
    friendlyHealer = friendlyHealer ~= nil and friendlyHealer or "party2"

    if not addon.arenaHealerInitialized then
        addon.print("Updating enemy healer macros to " .. enemyHealer)
        addon.print("Updating friendly healer macros to " .. friendlyHealer)
    end
    
    for index = 1, 200 do
        name, icon, body = GetMacroInfo(index)

        if name ~= nil then
            addon.updateMacro("arena1", "" .. enemyHealer, index, name, nil, body)
            addon.updateMacro("arena2", "" .. enemyHealer, index, name, nil, body)
            addon.updateMacro("arena3", "" .. enemyHealer, index, name, nil, body)

            addon.updateMacro("party1", "" .. friendlyHealer, index, name, nil, body)
            addon.updateMacro("party2", "" .. friendlyHealer, index, name, nil, body)            
        end
    end

    addon.arenaHealerInitialized = true
end

function addon.updateMacro(tag, unit, index, name, icon, body)
    if InCombatLockdown() or
       tag == nil or unit == nil or index == nil or name == nil or body == nil or
       not body:find(tag) then return
    end

    if body:find("#ignore") then return end

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