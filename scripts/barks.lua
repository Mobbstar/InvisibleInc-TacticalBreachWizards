local simdefs = include("sim/simdefs")

local T_EVENT = rawget(simdefs,"TA_EVENT_TABLE") and simdefs.TA_EVENT_TABLE.EVENTS or {
	ATTACK_GUN = 8,			-- EV_UNIT_START_SHOOTING
	ATTACK_MELEE = 30,		-- EV_UNIT_MELEE

	GOT_HIT = 57,			-- EV_UNIT_HIT, not trigger on Last Words
	REVIVED = 102,			-- EV_UNIT_HEAL
	HIJACK = 19,			-- EV_UNIT_USECOMP also EV_UNIT_WIRELESS_SCAN for Internationale's wireless hijack got sent here
	INTERRUPTED = 4,		-- EV_UNIT_INTERRUPTED
	PEEK = 18,				-- EV_UNIT_PEEK
	OVERWATCH = 27,			-- EV_UNIT_OVERWATCH
	OVERWATCH_MELEE = 28,	-- EV_UNIT_OVERWATCH_MELEE
	PIN = 111,				-- EV_UNIT_START_PIN -- unused in game --Not anymore -- added by Cyberboy2000 :)

	UNTIE = 36,				-- EV_UNIT_UNTIE
	SAFE_LOOTED = 66,		-- TRG_SAFE_LOOTED -- there's trigger used
	INSTALL_AUGMENT = 62,
	DISGUISE_IN = 129,		-- for Prism's disguise
	CLOAK_IN = 614,			-- for activating cloak

	WIRELESS_SCAN = 100,	-- solely for Wireless Emitter Nerf mod, won't trigger normally

	ATTACK_GUN_KO = 1008,	-- for dartguns
	MEDGEL = 1009,			-- for using medgel on a downed agent
	SHOOT_CAMERA = 1010,
	SHOOT_DRONE = 1011,

	PARALYZER = 1012,		-- Banks have test line
	STIM_SELF = 1013,		-- Rush have test line		-- I just put some placeholders to test. Shirsh
	STIM_OTHER = 1014,		-- Shalem have test line
	SELF_STIMMED = 1015,	-- Rush have test line
	STIMMED_BY = 1016,		-- Rush have test line
	WAKE_OTHER = 1017,		-- Rush have test line
	AWAKENED_BY = 1018,		-- Shalem have test line

	EXEC_TERMINAL_LOOTED = 1019,	-- optional for Exec Terminals
	THREAT_DEVICE_LOOTED = 1020,	-- optional for looting FTM devices with tech (scanner and router)

	RESCUER = 1021,		-- agent who opens detention cell
	BAD_ESCAPE = 1022,	-- Exit teleporter comments
	GOOD_ESCAPE = 1023,
	BLOODY_MISSION = 1024,
	ABANDONING_OTHER = 1025,
	SET_SHOCKTRAP = 1026,
	SAVED_FROM_OW = 2001, -- saved from guard, both currently unused
	AGENT_DEATH = 1027,
	OW_INTERVENTION = 1028, -- save someone from a guard who's on OW
	EVENT_SELECTED = "TA_SELECTED", --now used! fires once per mission per agent
	EV_RESELECTED = "TA_RESELECTED", -- on selected, but used instead of above after rewinding
	SURRENDER = "TA_SURRENDER", --for "surrender" ability from New Corporate Tactics. unused simdefs.TRG_LAST_WORDS
}
local T_PROB = rawget(simdefs,"TA_EVENT_TABLE") and simdefs.TA_EVENT_TABLE.PROBS or {
	p_selected = 1,
	p_gun = 0.7,
	p_gunko = 0.7,
	p_melee = 0.6,
	p_ow = 0.6,
	p_gothit = 0.7,
	p_revived = 0.8,
	p_scan = 0.5,
	p_hj = 0.2,
	p_loot = 0.5,
	p_inter = 0.5,
	p_peek = 0.05,
	p_pin = 0.5,
	p_augm = 0.9,
	p_cloak = 0.8,
	p_medgel = 0.8,
	p_rescuer = 0.8, --0.5
	p_shootcam = 0.7,
	p_shootdrone = 0.7,
	p_badescape = 1, -- 0.9
	p_goodescape = 1,
	p_bloodymission = 1,
	p_abandonedother = 1,
	p_setshocktrap = 0.8,
	p_savefromow = 0.9,
	p_ow_saved = 1, --0.8 --unused
	p_agentdeath = 0.9,
	p_surrender = 1,
	p_hostage_rescue = 1,
}

local JEN = {} --------------------------------------------------------------------------------

-- JEN[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- JEN[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- JEN[T_EVENT.SHOOT_DRONE] = nil
-- JEN[T_EVENT.SHOOT_CAMERA] = nil
-- JEN[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
-- JEN[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee, {
-- }}
-- JEN[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- JEN[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

-- JEN[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
-- }}
-- JEN[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- JEN[T_EVENT.HIJACK] = {T_PROB.p_hj, {
-- }}
-- JEN[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- JEN[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- JEN[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- JEN[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- JEN[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- JEN[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- JEN[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- JEN[T_EVENT.DISGUISE_IN] = nil
-- JEN[T_EVENT.CLOAK_IN] = {T_PROB.p_cloak, {
-- }}
-- JEN[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- JEN[T_EVENT.WAKE_OTHER] = nil
-- JEN[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- JEN[T_EVENT.PARALYZER] = nil
-- JEN[T_EVENT.STIM_SELF] = nil
-- JEN[T_EVENT.STIM_OTHER] = nil
-- JEN[T_EVENT.SELF_STIMMED] = nil
-- JEN[T_EVENT.STIMMED_BY] = nil
-- JEN[T_EVENT.AWAKENED_BY] = nil
-- JEN[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- JEN[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- JEN[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- JEN[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- JEN[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- JEN[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- JEN[T_EVENT.SAVED_FROM_OW] = nil
-- JEN[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- JEN[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}


local ZAN = {} --------------------------------------------------------------------------------

-- ZAN[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- ZAN[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- ZAN[T_EVENT.SHOOT_DRONE] = nil
-- ZAN[T_EVENT.SHOOT_CAMERA] = nil
-- ZAN[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
-- ZAN[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee, {
-- }}
-- ZAN[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- ZAN[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

-- ZAN[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
-- }}
-- ZAN[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- ZAN[T_EVENT.HIJACK] = {T_PROB.p_hj, {
-- }}
-- ZAN[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- ZAN[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- ZAN[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- ZAN[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- ZAN[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- ZAN[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- ZAN[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- ZAN[T_EVENT.DISGUISE_IN] = nil
-- ZAN[T_EVENT.CLOAK_IN] = {T_PROB.p_cloak, {
-- }}
-- ZAN[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- ZAN[T_EVENT.WAKE_OTHER] = nil
-- ZAN[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- ZAN[T_EVENT.PARALYZER] = nil
-- ZAN[T_EVENT.STIM_SELF] = nil
-- ZAN[T_EVENT.STIM_OTHER] = nil
-- ZAN[T_EVENT.SELF_STIMMED] = nil
-- ZAN[T_EVENT.STIMMED_BY] = nil
-- ZAN[T_EVENT.AWAKENED_BY] = nil
-- ZAN[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- ZAN[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- ZAN[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- ZAN[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- ZAN[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- ZAN[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- ZAN[T_EVENT.SAVED_FROM_OW] = nil
-- ZAN[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- ZAN[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}


local DESSA = {} --------------------------------------------------------------------------------

-- DESSA[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- DESSA[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- DESSA[T_EVENT.SHOOT_DRONE] = nil
-- DESSA[T_EVENT.SHOOT_CAMERA] = nil
-- DESSA[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
-- DESSA[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee, {
-- }}
-- DESSA[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- DESSA[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

-- DESSA[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
-- }}
-- DESSA[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- DESSA[T_EVENT.HIJACK] = {T_PROB.p_hj, {
-- }}
-- DESSA[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- DESSA[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- DESSA[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- DESSA[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- DESSA[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- DESSA[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- DESSA[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- DESSA[T_EVENT.DISGUISE_IN] = nil
-- DESSA[T_EVENT.CLOAK_IN] = {T_PROB.p_cloak, {
-- }}
-- DESSA[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- DESSA[T_EVENT.WAKE_OTHER] = nil
-- DESSA[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- DESSA[T_EVENT.PARALYZER] = nil
-- DESSA[T_EVENT.STIM_SELF] = nil
-- DESSA[T_EVENT.STIM_OTHER] = nil
-- DESSA[T_EVENT.SELF_STIMMED] = nil
-- DESSA[T_EVENT.STIMMED_BY] = nil
-- DESSA[T_EVENT.AWAKENED_BY] = nil
-- DESSA[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- DESSA[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- DESSA[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- DESSA[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- DESSA[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- DESSA[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- DESSA[T_EVENT.SAVED_FROM_OW] = nil
-- DESSA[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- DESSA[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}


local DALL = {} --------------------------------------------------------------------------------

-- DALL[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- DALL[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- DALL[T_EVENT.SHOOT_DRONE] = nil
-- DALL[T_EVENT.SHOOT_CAMERA] = nil
-- DALL[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
-- DALL[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee, {
-- }}
-- DALL[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- DALL[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

-- DALL[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
-- }}
-- DALL[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- DALL[T_EVENT.HIJACK] = {T_PROB.p_hj, {
-- }}
-- DALL[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- DALL[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- DALL[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- DALL[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- DALL[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- DALL[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- DALL[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- DALL[T_EVENT.DISGUISE_IN] = nil
-- DALL[T_EVENT.CLOAK_IN] = {T_PROB.p_cloak, {
-- }}
-- DALL[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- DALL[T_EVENT.WAKE_OTHER] = nil
-- DALL[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- DALL[T_EVENT.PARALYZER] = nil
-- DALL[T_EVENT.STIM_SELF] = nil
-- DALL[T_EVENT.STIM_OTHER] = nil
-- DALL[T_EVENT.SELF_STIMMED] = nil
-- DALL[T_EVENT.STIMMED_BY] = nil
-- DALL[T_EVENT.AWAKENED_BY] = nil
-- DALL[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- DALL[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- DALL[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- DALL[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- DALL[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- DALL[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- DALL[T_EVENT.SAVED_FROM_OW] = nil
-- DALL[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- DALL[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}


local RION = {} --------------------------------------------------------------------------------

-- RION[T_EVENT.EVENT_SELECTED] = {T_PROB.p_selected, {
-- }}
-- RION[T_EVENT.ATTACK_GUN] = {T_PROB.p_gun, {
-- }}
-- RION[T_EVENT.SHOOT_DRONE] = nil
-- RION[T_EVENT.SHOOT_CAMERA] = nil
-- RION[T_EVENT.ATTACK_GUN_KO] = {T_PROB.p_gunko, {
-- }}
-- RION[T_EVENT.ATTACK_MELEE] = {T_PROB.p_melee, {
-- }}
-- RION[T_EVENT.OVERWATCH] = {T_PROB.p_ow, {
-- }}
-- RION[T_EVENT.OVERWATCH_MELEE] = {T_PROB.p_ow, {
-- }}

-- RION[T_EVENT.GOT_HIT] = {T_PROB.p_gothit, {
-- }}
-- RION[T_EVENT.REVIVED] = {T_PROB.p_revived, {
-- }}
-- RION[T_EVENT.HIJACK] = {T_PROB.p_hj, {
-- }}
-- RION[T_EVENT.SAFE_LOOTED] = {T_PROB.p_loot, {
-- }}
-- RION[T_EVENT.EXEC_TERMINAL_LOOTED] = nil
-- RION[T_EVENT.THREAT_DEVICE_LOOTED] = nil

-- RION[T_EVENT.INTERRUPTED] = {T_PROB.p_inter, {
-- }}
-- RION[T_EVENT.PEEK] = {T_PROB.p_peek, {
-- }}

-- RION[T_EVENT.PIN] = {T_PROB.p_pin, {
-- }}
-- RION[T_EVENT.INSTALL_AUGMENT] = {T_PROB.p_augm, {
-- }}
-- RION[T_EVENT.DISGUISE_IN] = nil
-- RION[T_EVENT.CLOAK_IN] = {T_PROB.p_cloak, {
-- }}
-- RION[T_EVENT.MEDGEL] = {T_PROB.p_medgel, {
-- }}
-- RION[T_EVENT.WAKE_OTHER] = nil
-- RION[T_EVENT.UNTIE] = {T_PROB.p_hostage_rescue, {
-- }}

-- RION[T_EVENT.PARALYZER] = nil
-- RION[T_EVENT.STIM_SELF] = nil
-- RION[T_EVENT.STIM_OTHER] = nil
-- RION[T_EVENT.SELF_STIMMED] = nil
-- RION[T_EVENT.STIMMED_BY] = nil
-- RION[T_EVENT.AWAKENED_BY] = nil
-- RION[T_EVENT.RESCUER] = {T_PROB.p_rescuer, {
-- }}
-- RION[T_EVENT.BAD_ESCAPE] = {T_PROB.p_badescape, {
-- }}
-- RION[T_EVENT.GOOD_ESCAPE] = {T_PROB.p_goodescape, {
-- }}
-- RION[T_EVENT.BLOODY_MISSION] = {T_PROB.p_bloodymission, {
-- }}
-- RION[T_EVENT.ABANDONING_OTHER] = {T_PROB.p_abandonedother, {
-- }}
-- RION[T_EVENT.OW_INTERVENTION] = {T_PROB.p_savefromow, {
-- }}
-- RION[T_EVENT.SAVED_FROM_OW] = nil
-- RION[T_EVENT.AGENT_DEATH] = {T_PROB.p_agentdeath, {
-- }}
-- RION[T_EVENT.SURRENDER] = {T_PROB.p_surrender, {
-- }}

return { -- use agent ID as key
    tbw_jen = JEN,
    tbw_zan = ZAN,
    tbw_dessa = DESSA,
    tbw_dall = DALL,
    tbw_rion = RION,
}
