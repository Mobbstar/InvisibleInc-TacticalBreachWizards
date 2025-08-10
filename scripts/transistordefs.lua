local util = include("modules/util")
local mainframe_common = include("sim/abilities/mainframe_common")
local simdefs = include("sim/simdefs")

return {
    transistordaemontbw_jen = util.extend(mainframe_common.createReverseDaemon(STRINGS.TACTICALBREACHWIZARDS.JEN.TRANSISTOR)) {
        icon = "gui/icons/daemon_icons/fu_tbw_jen.png",
        title = STRINGS.TACTICALBREACHWIZARDS.JEN.NAME,
        noDaemonReversal = true,
        onSpawnAbility = function(self, sim, player)
            sim:dispatchEvent(
                simdefs.EV_SHOW_REVERSE_DAEMON,
                {showMainframe = true, name = self.name, icon = self.icon, txt = self.activedesc, title = self.title}
            )
        end
    },
    transistordaemontbw_zan = util.extend(mainframe_common.createReverseDaemon(STRINGS.TACTICALBREACHWIZARDS.ZAN.TRANSISTOR)) {
        icon = "gui/icons/daemon_icons/fu_tbw_zan.png",
        title = STRINGS.TACTICALBREACHWIZARDS.ZAN.NAME,
        noDaemonReversal = true,
        onSpawnAbility = function(self, sim, player)
            sim:dispatchEvent(
                simdefs.EV_SHOW_REVERSE_DAEMON,
                {showMainframe = true, name = self.name, icon = self.icon, txt = self.activedesc, title = self.title}
            )
        end
    },
    transistordaemontbw_dessa = util.extend(mainframe_common.createReverseDaemon(STRINGS.TACTICALBREACHWIZARDS.DESSA.TRANSISTOR)) {
        icon = "gui/icons/daemon_icons/fu_tbw_dessa.png",
        title = STRINGS.TACTICALBREACHWIZARDS.DESSA.NAME,
        noDaemonReversal = true,
        onSpawnAbility = function(self, sim, player)
            sim:dispatchEvent(
                simdefs.EV_SHOW_REVERSE_DAEMON,
                {showMainframe = true, name = self.name, icon = self.icon, txt = self.activedesc, title = self.title}
            )
        end
    },
    transistordaemontbw_dall = util.extend(mainframe_common.createReverseDaemon(STRINGS.TACTICALBREACHWIZARDS.DALL.TRANSISTOR)) {
        icon = "gui/icons/daemon_icons/fu_tbw_dall.png",
        title = STRINGS.TACTICALBREACHWIZARDS.DALL.NAME,
        noDaemonReversal = true,
        onSpawnAbility = function(self, sim, player)
            sim:dispatchEvent(
                simdefs.EV_SHOW_REVERSE_DAEMON,
                {showMainframe = true, name = self.name, icon = self.icon, txt = self.activedesc, title = self.title}
            )
        end
    },
    transistordaemontbw_rion = util.extend(mainframe_common.createReverseDaemon(STRINGS.TACTICALBREACHWIZARDS.RION.TRANSISTOR)) {
        icon = "gui/icons/daemon_icons/fu_tbw_rion.png",
        title = STRINGS.TACTICALBREACHWIZARDS.RION.NAME,
        noDaemonReversal = true,
        onSpawnAbility = function(self, sim, player)
            sim:dispatchEvent(
                simdefs.EV_SHOW_REVERSE_DAEMON,
                {showMainframe = true, name = self.name, icon = self.icon, txt = self.activedesc, title = self.title}
            )
        end
    },
}
