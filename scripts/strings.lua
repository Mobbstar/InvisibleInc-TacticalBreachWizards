return {

-- MOD COMPATIBILITY NOTES:
-- Marksmanship Skill: Zan knows how to use guns.
-- Red / Transistor: A near-death experience unlocks a wizard's true power.
-- Ultimate Loadouts: Oh, we're allowed to bring *all* our spells at once?

OPTIONS = {
    ONFILE = "ONFILE %s",
    ARCHIVE = "ARCHIVE %s",
    ONFILE_TIP = [[<c:FF8411>ONFILE %s</c>
Adds %s (On-File) to rescueable agents.]],
    ARCHIVE_TIP = [[<c:FF8411>ARCHIVE %s</c>
Adds %s (Archive) to rescueable agents.]],
},

ITEMS = {
    CHAINBOLT = "Chain Bolt",
    CHAINBOLT_TIP = "Can shoot up to three targets. Deals 1 knockback. If target impacts an obstacle, deals 1 KO instead.", -- affected by piercing scanner &c
    CHAINBOLT_FLAVOR = "A guided projectile actively calibrates its blast force to ricochet towards additional targets.",
    GALENADE = "Gale Grenade",
    GALENADE_TIP = "Deals 1 knockback to surrounding units. If unit impacts an obstacle, deals 1 KO instead.",
    GALENADE_FLAVOR = "Intended for crowd control, but ultimately discontinued because their less-than-lethal force rendered them ineffective.",
    RIOTSHIELD = "Riot Shield",
    RIOTSHIELD_TIP = "Dashes to target. Deals 1 knockback and increases with dash distance. If unit impacts an obstacle, deals remaining knockback (minus Armor) as KO.",
    RIOTSHIELD_FLAVOR = "Despite the name, this device is tailored towards offense and cannot stop modern plasma projectiles.",
    RIOTBLOCK = "Riot Block",
    RIOTBLOCK_TIP = "Throwable obstacle. Can be disassembled by guards.",
    RIOTBLOCK_FLAVOR = "Only certified personnel and subnet users know how to manipulate these.",
    CENSER = "Censer",
    CENSER_TIP = "Melee range",
    CENSER_FLAVOR = "Dall overcharges her neural disrupter to make each hit count.",
    RIOTSWAP = "Swapper Engine",
    RIOTSWAP_TIP = "Teleports the user to a target person, and the target to the user position.",
    RIOTSWAP_FLAVOR = "Technically, this transporter puts its anchor into a third space before moving the target to the original location.",
    PREDICTIVEBOLT = "Predictive Shot",
    PREDICTIVEBOLT_TIP = "Can focus Overwatch on a particular line, with +2 KO and +1 Armor Piercing.",
    PREDICTIVEBOLT_FLAVOR = ".",
    RIFLE_ZAN = "Cuckoo",
    RIFLE_ZAN_TOOLTIP = "Ranged targets. Lethal damage.",
    RIFLE_ZAN_FLAVOR = "A calibrated amethyst-jacketed chronocrystal enhances the efficiency of plasma generation.",
    FALSEPROPHET = "False Prophet",
    FALSEPROPHET_TIP = "Creates a unit that vanishes next turn or when shot. Has no inventory. Acts otherwise normal.",
    FALSEPROPHET_FLAVOR = ".",
    BRITTLEDART = "Brittling D.A.R.T.",
    BRITTLEDART_TIP = "Lowers target's Armor by 1 until next turn.",
    BRITTLEDART_FLAVOR = "The integrity of most personnel armors can be temporarily compromised with the right choice of corrosive agent.",
    RABIDBITE = "Rabid Bite",
    RABIDBITE_TIP = "Target becomes alerted and hostile to everyone. Other guards can kill target regardless of Armor.", -- afflicted guard either moves last, or moves first but shouts (=immmediately gets overwatched by other guards)
    RABIDBITE_FLAVOR = "Transmissible engineered diseases are outlawed citing risk of global economic damage. Nontransmissible ones are expensive, but theoretically legal.",
    DEATHSKEY = "Death's Key",
    DEATHSKEY_TIP = "Places Death's Door. First unit knocked onto Death's Door is removed from the mission. Alternatively, can teleport one unit to Death's Door",
    DEATHSKEY_FLAVOR = "Based on a more potent and hazardous transport device developed by Aperture Science.",
    RESURRECTION = "Resurrection",
    RESURRECTION_TIP = "Requires lethal weapon. Heals injured agent or revives guard corpse. Revived guards have no Armor and are hostile to everyone.",
    RESURRECTION_FLAVOR = "This is not how cauterization works. This has no explicable reason to be on par with medgel.",
    GARYSKULL = "Gary",
    GARYSKULL_TIP = "Hits targets in a line. Targets get knocked out at start of next turn.",
    GARYSKULL_FLAVOR = "Not to be confused with Nigel, who bears a different curse.",
},

REASON = {
    BAD_TARGET_IMPASSABLE = "INVALID TARGET: Obstacle",
    BAD_TARGET_NO_FACE = "INVALID TARGET: No breakable face",
    BAD_TARGET_TOO_CLOSE = "INVALID TARGET: Too close",
},

ABILITIES = {
    CHAINBOLT_AIM = "AIM",
    CHAINBOLT_AIM_DESC = "Add this unit to the Chain Bolt's targets.",
    FALSEPROPHET = "SUMMON PROPHET",
    FALSEPROPHET_DESC = ".",
    SWAP = "SWAP",
    SWAP_DESC = ".",
    RIOTSHIELD = "CHARGE",
    RIOTSHIELD_DESC = ".",
},

TOOLTIPS = {
    GRENADE_REMOTE = "REMOTE GRENADE",
    GRENADE_REMOTE_DESC = "This unit is carrying a remotely triggered {1}."
},

JEN = {
    NAME = "Jen",
    FULLNAME = "Jen Kellen",
    FILE = "FILE #00-083275A-49828694",
    YEARS_OF_SERVICE = "1",
    HOMETOWN = "D.S.R.",
    RESCUED = "TODO need a rescue line to not crash.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "33",
        BIO = "",
        TOOLTIP = "Freelance Witch",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- FREELANCE WITCH",
        AGE = "26",
        BIO = "",
        TOOLTIP = "Freelance Witch",
    },

    BANTER = {
        START = {
            "TODO need a start line to not crash.",
        },
        FINAL_WORDS =
        {
            "TODO need a final words to not crash.",
        },
    },

    TRANSISTOR = {
        NAME = "Floodfill()",
        DESC = "Put an agent in front of a guard exit and spend 2 AP to go to any other guard exit.",
        SHORT_DESC = "Teleport using guard exits",
        ACTIVE_DESC = "TELEPORT USING GUARD ELEVATORS",
    },
},

ZAN = {
    NAME = "Zan",
    FULLNAME = "Zan Vesker",
    FILE = "FILE #00-083275A-49828695",
    YEARS_OF_SERVICE = "1",
    HOMETOWN = "Liboli",
    RESCUED = "I'm ready, let's go.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "56",
        BIO = "",
        TOOLTIP = "Navy Seer",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- NAVY SEER",
        AGE = "39",
        BIO = "",
        TOOLTIP = "Navy Seer",
    },

    BANTER = {
        START = {
            "TODO need a start line to not crash.",
        },
        FINAL_WORDS =
        {
            "TODO need a final words to not crash.",
        },
    },

    TRANSISTOR = {
        NAME = "Preview()",
        DESC = "While no actions have been taken this turn, Rewind is free and goes to end of last turn.",
        SHORT_DESC = "Can undo enemy turn",
        ACTIVE_DESC = "CAN UNDO ENEMY TURN",
    },
},

DESSA = {
    NAME = "Dessa",
    FULLNAME = "Dessa Banks",
    FILE = "FILE #00-083275A-49828696",
    YEARS_OF_SERVICE = "1",
    HOMETOWN = "D.S.R.",
    RESCUED = "Do I need to cure any poison? No? Good escape so far.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "34",
        BIO = "",
        TOOLTIP = "Necromedic",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- NECROMEDIC",
        AGE = "27",
        BIO = "",
        TOOLTIP = "Necromedic",
    },

    BANTER = {
        START = {
            "TODO need a start line to not crash.",
        },
        FINAL_WORDS =
        {
            "TODO need a final words to not crash.",
        },
    },

    TRANSISTOR = {
        NAME = "Healthcheck()",
        DESC = "Red's Remote-heal ability works on every agent, regardless of cause of injury.",
        SHORT_DESC = "Remote-heal anyone",
        ACTIVE_DESC = "REMOTE-HEAL ANYONE",
    },
},

DALL = {
    NAME = "Dall",
    FULLNAME = "Dall Sabin",
    FILE = "FILE #00-083275A-49828697",
    YEARS_OF_SERVICE = "1",
    HOMETOWN = "Mandana",
    RESCUED = "TODO need a rescue line to not crash.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "29",
        BIO = "",
        TOOLTIP = "Rebel Riot Priest",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- RIOT REBEL",
        AGE = "26",
        BIO = "",
        TOOLTIP = "Rebel Riot Priest",
    },

    BANTER = {
        START = {
            "TODO need a start line to not crash.",
        },
        FINAL_WORDS =
        {
            "TODO need a final words to not crash.",
        },
    },

    TRANSISTOR = {
        NAME = "Sing()",
        DESC = "TODO dodge/armor? or swapping akin to grace?.",
        SHORT_DESC = "",
        ACTIVE_DESC = "",
    },
},

RION = {
    NAME = "Rion",
    FULLNAME = "Rion",
    FILE = "FILE #00-083275A-49828698",
    YEARS_OF_SERVICE = "1",
    HOMETOWN = "Medil",
    RESCUED = "TODO need a rescue line to not crash.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "complicated",
        BIO = "",
        TOOLTIP = "Druid Hitman",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- DRUID HITMAN",
        AGE = "??",
        BIO = "His complete lack of papertrail has two possible explanations. If Rion's documents got destroyed in the Resource Wars, he somehow survived without renaturalization. Else, he must have been born into and escaped 'controlled long-term testing' at a corporate black-site.",
        TOOLTIP = "Druid Hitman",
    },

    BANTER = {
        START = {
            "TODO need a start line to not crash.",
        },
        FINAL_WORDS =
        {
            "TODO need a final words to not crash.",
        },
    },

    TRANSISTOR = {
        NAME = "Fetch()",
        DESC = "Items and bodies can be fetched from up to X tiles away.",
        SHORT_DESC = "Items and bodies can be fetched from a distance", -- TODO rewrite
        ACTIVE_DESC = "PULL ITEMS AND BODIES", -- TODO rewrite
    },
},

}