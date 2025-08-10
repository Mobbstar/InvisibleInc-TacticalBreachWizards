-- Include files to be used throughout this file.
-- Don't eager-load sim- or client-heavy things though, those may break translation.
-- local util = include("modules/util")

-- Private static variables can be used by load/unload to remember what has been done.
local ThisModLoaded = false

local function earlyInit(modApi)
    modApi.requirements = {
        "Contingency Plan",
        "Sim Constructor",
        "Function Library"
    }
end

local function init(modApi)
    do -- dependency check
        local cdefs = include("client_defs")
        assert(cdefs.ActionToolkitLoaded, "ERROR - MOD-LOAD FAILED: Tactical Breach Wizards depends on Action Toolkit")
    end

    local dataPath = modApi:getDataPath()
    KLEIResourceMgr.MountPackage(dataPath .. "/gui.kwad", "data")
    KLEIResourceMgr.MountPackage(dataPath .. "/anims.kwad", "data")

    local scriptPath = modApi:getScriptPath()

    local mod_agentdefs = include(scriptPath .. "/agentdefs")
    for _, agentdefpair in ipairs(mod_agentdefs) do
        local agentdef = agentdefpair.onfile
        modApi:addGenerationOption(
            "rescue_".. agentdef.agentID,
            string.format(STRINGS.TACTICALBREACHWIZARDS.OPTIONS.ONFILE, string.upper(agentdef.name)),
            string.format(STRINGS.TACTICALBREACHWIZARDS.OPTIONS.ONFILE_TIP, string.upper(agentdef.name), agentdef.fullname),
            {noUpdate = true}
        )
        modApi:addGenerationOption(
            "rescue_".. agentdef.agentID .."_a",
            string.format(STRINGS.TACTICALBREACHWIZARDS.OPTIONS.ARCHIVE, string.upper(agentdef.name)),
            string.format(STRINGS.TACTICALBREACHWIZARDS.OPTIONS.ARCHIVE_TIP, string.upper(agentdef.name), agentdef.fullname),
            {noUpdate = true}
        )
        if modApi.addTransistorDef then -- Transistor pt1
            modApi:addTransistorDef(agentdef.agentID, "transistordaemon" .. agentdef.agentID)
        end
    end

    -- monkeypatching here

end

local function FindModOption(mod_options, modname, optionname)
    if not mod_options then
        return
    end
    for k, mod in pairs(mod_options) do
        if k == modname or mod.name == modname then
            if mod and mod.enabled and mod.options and mod.options[optionname] then
                return mod.options[optionname].value or mod.options[optionname].enabled
            end
            return -- can give up at this point
        end
    end
end

local function generationOptionEnabled(options, name, default)
    if options and options[name] then
        return options[name].enabled
    end
    return default or false
end

local function load(modApi, options, params, mod_options)
    ThisModLoaded = true

    local scriptPath = modApi:getScriptPath()

    -- do
    --     local simdefs = include("sim/simdefs")
    --     for name, simDef in pairs(include(scriptPath .. "/simdefs")) do
    --         simdefs[name] = simDef
    --     end
    -- end

    -- modApi:addTooltipDef( include( scriptPath .. "/tooltipdefs" ) )

    local skip_wireframes = FindModOption(mod_options, "Mods Combo by Shirsh", "noWireframes")
    local mod_animdefs = include(scriptPath .. "/animdefs")(skip_wireframes)
    for name, animDef in pairs(mod_animdefs) do
        modApi:addAnimDef(name, animDef)
    end

    local mod_itemdefs = include(scriptPath .. "/itemdefs")
    for itemid, itemdef in pairs(mod_itemdefs) do
        modApi:addItemDef(itemid, itemdef)
    end

    local mod_agentdefs = include(scriptPath .. "/agentdefs")
    for _, agentdefpair in ipairs(mod_agentdefs) do
        local ofdef = agentdefpair.onfile
        local archdef = agentdefpair.archive
        local archiveID = archdef.agentID .. "_a"

        modApi:addAgentDef(ofdef.agentID, ofdef, {ofdef.agentID, archiveID})
        if generationOptionEnabled(options, ofdef.agentID) then
            modApi:addRescueAgent(ofdef.agentID, {ofdef.upgrades[1]})
        end

        modApi:addAgentDef(archiveID, archdef)
        if generationOptionEnabled(options, archiveID) then
            modApi:addRescueAgent(archiveID, {archdef.upgrades[1]})
        end
    end

    include(scriptPath .. "/banter")( modApi )

    for _, ability in ipairs({"falseprophet","riotshield","riotswap"}) do
        modApi:addAbilityDef(ability, scriptPath .. "/abilities/" .. ability)
    end

    if modApi.addTransistorDef then -- Transistor pt2
        local transistordefs = include(scriptPath .. "/transistordefs")
        for k,v in pairs(transistordefs) do
            modApi:addDaemonAbility(k,v)
        end
    end
end

local function unload(modApi, options)
    ThisModLoaded = false
end

local function initStrings(modApi)
    local dataPath = modApi:getDataPath()
    local scriptPath = modApi:getScriptPath()
    local strings = include(scriptPath .. "/strings")
    modApi:addStrings(dataPath, "TACTICALBREACHWIZARDS", strings)
end

return {
    init = init,
    earlyInit = earlyInit,
    load = load,
    unload = unload,
    initStrings = initStrings
}
