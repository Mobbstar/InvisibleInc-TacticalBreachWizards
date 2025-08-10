local abilityutil = include("sim/abilities/abilityutil")
local inventory = include("sim/inventory")
local simdefs = include("sim/simdefs")
local simquery = include("sim/simquery")
local util = include("modules/util")

local _M = {
    name = STRINGS.TACTICALBREACHWIZARDS.ABILITIES.SWAP,
    profile_icon = "gui/icons/action_icons/Action_icon_Small/icon-item_shoot_small.png",
    usesAction = true
}

function _M:getName(sim, unit, userUnit)
    return self.name
end

function _M:createToolTip(sim, unit, targetCell)
    return abilityutil.formatToolTip(
        STRINGS.TACTICALBREACHWIZARDS.ABILITIES.SWAP,
        STRINGS.TACTICALBREACHWIZARDS.ABILITIES.SWAP_DESC,
        1
    )
end

function _M:canUseAbility(sim, itemUnit, unit, targetCell)
    if itemUnit:getTraits().cooldown and itemUnit:getTraits().cooldown > 0 then
        return false, util.sformat(STRINGS.UI.REASON.COOLDOWN, itemUnit:getTraits().cooldown)
    end

    return true
end

function _M:executeAbility(sim, itemUnit, userUnit)
    local x0, y0 = userUnit:getLocation()
end

return _M
