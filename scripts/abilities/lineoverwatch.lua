local abilityutil = include("sim/abilities/abilityutil")
local util = include("modules/util")

local _M = {
    name = STRINGS.TACTICALBREACHWIZARDS.ABILITIES.LINEOVERWATCH,
    profile_icon = "gui/icons/action_icons/Action_icon_Small/icon-item_shoot_small.png",
    usesAction = true
}

function _M:getName(sim, unit, userUnit)
    return self.name
end

function _M:createToolTip(sim, unit, targetCell)
    return abilityutil.formatToolTip(
        STRINGS.TACTICALBREACHWIZARDS.ABILITIES.LINEOVERWATCH,
        STRINGS.TACTICALBREACHWIZARDS.ABILITIES.LINEOVERWATCH_DESC,
        1
    )
end

function _M:canUseAbility(sim, itemUnit, unit, targetCell)
    -- TODO reference regular overwatch ability as closely as possible
    return true
end

function _M:executeAbility(sim, itemUnit, userUnit)
    local x0, y0 = userUnit:getLocation()
end

return _M
