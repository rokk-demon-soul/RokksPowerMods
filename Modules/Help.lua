local addonName, addon = ...

function addon.help()
    print(" ")
    print("\124cffDB09FE------------------------------------")
    print("\124cffDB09FE" .. addon.L["RPM"])
    print("\124cffDB09FE------------------------------------")
    print("\124cffBAFF1A/rpm hideChat \124cffFFFFFF- " .. addon.showText("RPM_Hide_Chat"))
    print("\124cffBAFF1A/rpm showChat \124cffFFFFFF- " .. addon.showText("RPM_Show_Chat"))
    print("\124cffDB09FE------------------------------------")
end