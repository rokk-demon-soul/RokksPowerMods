local addonName, addon = ...

function addon.showText(localizationKey)
	if addon.L[localizationKey] == nil then
		return localizationKey
	else
		return addon.L[localizationKey]
	end
end

function addon.setLocalization()
	local L = {}
	L["RPM"] = "Rokks Power Mods"
	L["RPM_Hide_Chat"] = "Hide chat"
	L["RPM_Show_Chat"] = "Show chat"

	local locale = GetLocale()
	if locale == "ruRU" then
		L["RPM"] = "Инструменты Рокка"
	end

	addon.L = L
end
