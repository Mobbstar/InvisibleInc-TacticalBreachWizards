local commondefs = include("sim/unitdefs/commondefs")
local commonanims = include("common_anims")
local util = include("modules/util")

local FLOAT_DRONE_TANK_ANIMS = commondefs.FLOAT_DRONE_TANK_ANIMS
local AGENT_ANIMS = commondefs.AGENT_ANIMS
local Layer = commondefs.Layer
local BoundType = commondefs.BoundType

-------------------------------------------------------------------
-- Data for anim definitions.

local animdefs = {
    leap_tbw_dall = {
        build = {
            "data/anims/characters/agents/leap_tbw_dall.abld"
        },
        anims = {
            "data/anims/characters/corp_SK/sankaku_droid_tank.adef",
            "data/anims/characters/corp_SK/sankaku_droid_tank_2.adef"
        },
        anims_1h = {
            "data/anims/characters/corp_SK/sankaku_droid_tank.adef",
            "data/anims/characters/corp_SK/sankaku_droid_tank_2.adef"
        },
        anims_2h = {
            "data/anims/characters/corp_SK/sankaku_droid_tank.adef",
            "data/anims/characters/corp_SK/sankaku_droid_tank_2.adef"
        },
        symbol = "character",
        anim = "idle",
        shouldFlip = true,
        scale = 0.25,
        layer = Layer.Unit,
        boundType = BoundType.Character,
        boundTypeOverrides = {
            {anim = "idle_closed", boundType = BoundType.CharacterFloor},
            {anim = "dead", boundType = BoundType.CharacterFloor}
        },
        animMap = FLOAT_DRONE_TANK_ANIMS
    }
}

local agentCommon = {
    animMap = AGENT_ANIMS,
    symbol = "character",
    anim = "idle",
    shouldFlip = true,
    scale = 0.25,
    layer = Layer.Unit,
    boundType = BoundType.Character,
    boundTypeOverrides = {
        {anim = "idle_ko", boundType = BoundType.CharacterFloor},
        {anim = "dead", boundType = BoundType.CharacterFloor}
    },
    peekBranchSet = 1
}

local function compileDefs(skip_wireframes)
    local compiled = util.tdupe(animdefs)

    for _, name in ipairs({"jen", "dessa", "dall"}) do
        compiled["kanim_tbw_" .. name] = util.extend(agentCommon) {
            wireframe = {
                skip_wireframes and
                    "data/anims/characters/agents/agent_male_empty.abld" or
                    "data/anims/characters/agents/overlay_agent_tbw_" .. name .. ".abld"
            },
            build = {
                "data/anims/characters/anims_female/shared_female_hits_01.abld",
                "data/anims/characters/anims_female/shared_female_attacks_a_01.abld",
                "data/anims/characters/agents/agent_tbw_" .. name .. ".abld"
            },
            grp_build = {
                "data/anims/characters/agents/grp_agent_tbw_" .. name .. ".abld"
            },
            grp_anims = commonanims.female.grp_anims,
            anims = commonanims.female.default_anims_unarmed,
            anims_1h = commonanims.female.default_anims_1h,
            anims_2h = commonanims.female.default_anims_2h
        }
    end
    for _, name in ipairs({"zan", "rion"}) do
        compiled["kanim_tbw_" .. name] = util.extend(agentCommon) {
            wireframe = {
                skip_wireframes and
                    "data/anims/characters/agents/agent_male_empty.abld" or
                    "data/anims/characters/agents/overlay_agent_tbw_" .. name .. ".abld"
            },
            build = {
                "data/anims/characters/agents/agent_tbw_" .. name .. ".abld",
                "data/anims/characters/anims_male/shared_hits_01.abld",
                "data/anims/characters/anims_male/shared_attacks_a_01.abld",
                "data/anims/characters/anims_male/stealth_basic_a_04.abld"
            },
            grp_build = {
                "data/anims/characters/agents/grp_agent_tbw_" .. name .. ".abld"
            },
            grp_anims = commonanims.male.grp_anims,
            anims = commonanims.male.default_anims_unarmed,
            anims_1h = commonanims.male.default_anims_1h,
            anims_2h = commonanims.male.default_anims_2h
        }
    end

    return compiled
end

return compileDefs
