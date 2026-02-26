local util = include("modules/util")
local commondefs = include("sim/unitdefs/commondefs")
local simdefs = include("sim/simdefs")

local MALE_SOUNDS = {
    bio = "",
    escapeVo = "",
    speech = "SpySociety/Agents/dialogue_player",
    step = simdefs.SOUNDPATH_FOOTSTEP_MALE_HARDWOOD_NORMAL,
    stealthStep = simdefs.SOUNDPATH_FOOTSTEP_MALE_HARDWOOD_SOFT,
    wallcover = "SpySociety/Movement/foley_trench/wallcover",
    crouchcover = "SpySociety/Movement/foley_trench/crouchcover",
    fall = "SpySociety/Movement/foley_trench/fall",
    fall_knee = "SpySociety/Movement/bodyfall_agent_knee_hardwood",
    fall_kneeframe = 9,
    fall_hand = "SpySociety/Movement/bodyfall_agent_hand_hardwood",
    fall_handframe = 20,
    land = "SpySociety/Movement/deathfall_agent_hardwood",
    land_frame = 35,
    getup = "SpySociety/Movement/foley_trench/getup",
    grab = "SpySociety/Movement/foley_trench/grab_guard",
    pin = "SpySociety/Movement/foley_trench/pin_guard",
    pinned = "SpySociety/Movement/foley_trench/pinned",
    peek_fwd = "SpySociety/Movement/foley_trench/peek_forward",
    peek_bwd = "SpySociety/Movement/foley_trench/peek_back",
    move = "SpySociety/Movement/foley_trench/move",
    hit = "SpySociety/HitResponse/hitby_ballistic_flesh"
}

local FEMALE_SOUNDS = {
    bio = "",
    escapeVo = "",
    speech = "SpySociety/Agents/dialogue_player",
    step = simdefs.SOUNDPATH_FOOTSTEP_FEMALE_HARDWOOD_NORMAL,
    stealthStep = simdefs.SOUNDPATH_FOOTSTEP_FEMALE_HARDWOOD_SOFT,
    wallcover = "SpySociety/Movement/foley_trench/wallcover",
    crouchcover = "SpySociety/Movement/foley_trench/crouchcover",
    fall = "SpySociety/Movement/foley_trench/fall",
    land = "SpySociety/Movement/deathfall_agent_hardwood",
    land_frame = 16,
    getup = "SpySociety/Movement/foley_trench/getup",
    grab = "SpySociety/Movement/foley_trench/grab_guard",
    pin = "SpySociety/Movement/foley_trench/pin_guard",
    pinned = "SpySociety/Movement/foley_trench/pinned",
    peek_fwd = "SpySociety/Movement/foley_trench/peek_forward",
    peek_bwd = "SpySociety/Movement/foley_trench/peek_back",
    move = "SpySociety/Movement/foley_trench/move",
    hit = "SpySociety/HitResponse/hitby_ballistic_flesh"
}

local function makeBaseAgent(name, male, archive)
    local NAME = string.upper(name)
    local animname = archive and name .. "_a" or name
    local ALT = archive and "ALT_2" or "ALT_1"
    return {
        type = "simunit",
        agentID = "tbw_" .. name,
        loadoutName = archive and STRINGS.UI.ON_ARCHIVE or STRINGS.UI.ON_FILE,
        name = STRINGS.TACTICALBREACHWIZARDS[NAME].NAME,
        fullname = STRINGS.TACTICALBREACHWIZARDS[NAME].FULLNAME,
        codename = STRINGS.TACTICALBREACHWIZARDS[NAME][ALT].CODENAME or STRINGS.TACTICALBREACHWIZARDS[NAME].FULLNAME,
        toolTip = STRINGS.TACTICALBREACHWIZARDS[NAME][ALT].TOOLTIP,
        file = STRINGS.TACTICALBREACHWIZARDS[NAME].FILE,
        yearsOfService = STRINGS.TACTICALBREACHWIZARDS[NAME].YEARS_OF_SERVICE,
        age = STRINGS.TACTICALBREACHWIZARDS[NAME][ALT].AGE,
        homeTown = STRINGS.TACTICALBREACHWIZARDS[NAME].HOMETOWN,
        speech = STRINGS.TACTICALBREACHWIZARDS[NAME].BANTER,
        blurb = STRINGS.TACTICALBREACHWIZARDS[NAME][ALT].BIO,
        hireText = STRINGS.TACTICALBREACHWIZARDS[NAME].RESCUED,
        gender = male and "male" or "female",
        sounds = male and MALE_SOUNDS or FEMALE_SOUNDS,
        onWorldTooltip = commondefs.onAgentTooltip,
        kanim = "kanim_tbw_" .. name, -- animname
        profile_anim = "portraits/tbw_" .. animname .. "_face",
        profile_build = "portraits/tbw_" .. animname .. "_face",
        profile_icon_36x36 = "gui/profile_icons/tbw_" .. name .. "_36.png",
        profile_icon_64x64 = "gui/profile_icons/tbw_" .. name .. "_64x64.png",
        splash_image = "gui/agents/tbw_" .. name .. "_1024.png",
        team_select_img = {"gui/agents/team_select_1_tbw_" .. name .. ".png"},
        traits = util.extend(commondefs.DEFAULT_AGENT_TRAITS) {mp = 8, mpMax = 8},
        skills = util.extend(commondefs.DEFAULT_AGENT_SKILLS) {},
        startingSkills = {},
        abilities = util.tconcat({"sprint"}, commondefs.DEFAULT_AGENT_ABILITIES),
        children = {},
        logs = {}
    }
end

return {
    {
        onfile = util.extend(makeBaseAgent("jen", false, false)) {
            upgrades = {"tbw_item_chainbolt", "item_smokegrenade"}
        },
        archive = util.extend(makeBaseAgent("jen", false, true)) {
            upgrades = {"tbw_item_galenade", "item_tazer"} -- TODO maybe something in reference to Darrell?
        }
    },
    {
        onfile = util.extend(makeBaseAgent("zan", true, false)) {
            upgrades = {"tbw_augment_predictivebolt", "tbw_item_rifle_zan", "item_tazer"},
            traits = {marksmanSkill = 2}
        },
        archive = util.extend(makeBaseAgent("zan", true, true)) {
            upgrades = {"tbw_augment_falseprophet", "item_tazer"},
            traits = {marksmanSkill = 2}
        }
    },
    {
        onfile = util.extend(makeBaseAgent("dessa", false, false)) {
            upgrades = {"tbw_augment_resurrect", "tbw_item_gary", "item_paralyzer"}
        },
        archive = util.extend(makeBaseAgent("dessa", false, true)) {
            upgrades = {"tbw_item_deathskey", "item_tazer"}
        }
    },
    {
        onfile = util.extend(makeBaseAgent("dall", false, false)) {
            upgrades = {"tbw_item_riotshield", "tbw_item_riotblock"},
            startingSkills = {strength = 2}
        },
        archive = util.extend(makeBaseAgent("dall", false, true)) {
            upgrades = {"tbw_augment_swap", "tbw_item_tazerriot"},
            startingSkills = {strength = 2}
        }
    },
    {
        onfile = util.extend(makeBaseAgent("rion", true, false)) {
            upgrades = {"tbw_item_brittledart", "item_tazer"}
        },
        archive = util.extend(makeBaseAgent("rion", true, true)) {
            upgrades = {"tbw_item_rabidbite", "item_flashgrenade"}
        }
    }
}
