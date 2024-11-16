local addonName, addon = ...

function RokksPowerMods_func()
    addon.help()
end

function addon.debug(var, name)
    if type(var) == "string" then
        local output = name ~= nil and name .. ": " .. var or var
        print("\124cffDB09FEDebug: \124cffBAFF1A" .. output)
        return
    end
    
    local name = name ~= nil and name or nil
    if type(var) == "table" then
        local tableName = string.gsub(tostring(var), "table: ", "")
        print("\124cffDB09FE" .. tostring(name) .. " (" .. tableName .. ") {")
        for k, v in pairs(var) do
            print("  \124cffBAFF1A" .. tostring(k) .. ": " .. tostring(v))
        end
        print("\124cffDB09FE}")
    else
        local debugString
        if name == nil then
            debugString = "\124cffDB09FEDebug: \124cffBAFF1A" .. tostring(var)
        else
            debugString = "\124cffDB09FE" .. tostring(name) .. ": \124cffBAFF1A" .. tostring(var)
        end
        print(debugString)
    end
end

function addon.isNullOrWhiteSpace(var)
    return var == nil or type(var) ~= "string" or strtrim(var) == ""
end

function addon.round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end

function addon.print(text)
    print("\124cffDB09FERPM: " .. "\124cffBAFF1A" .. tostring(text))
end

function addon.copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[addon.copy(k, s)] = addon.copy(v, s) end
    return res
end
