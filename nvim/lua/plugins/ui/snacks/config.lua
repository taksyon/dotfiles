-- plugins/ui/snacks/config.lua


--          ▌         ▘
--  ▛▘▛▌▀▌▛▘▙▘▛▘  ▛▌▌▌▌▛▛▌
--  ▄▌▌▌█▌▙▖▛▖▄▌▗ ▌▌▚▘▌▌▌▌
--


return {
  dashboard = require("plugins.ui.snacks.plugins.dashboard"),
  explorer = require("plugins.ui.snacks.plugins.explorer"),
  image = { enabled = true, }, -- no kitty :(
  indent = require("plugins.ui.snacks.plugins.indent"),
  input = require("plugins.ui.snacks.plugins.input"),
  notifier = require("plugins.ui.snacks.plugins.notifier"),
  picker = require("plugins.ui.snacks.plugins.picker"),
  quickfile = require("plugins.ui.snacks.plugins.quickfile"),
  scroll = { enabled = false }, -- require("plugins.ui.snacks.plugins.scroll"),
  scope = require("plugins.ui.snacks.plugins.scope"),
  statuscolumn = require("plugins.ui.snacks.plugins.statuscolumn"),
  terminal = { enabled = true, },
  win = require("plugins.ui.snacks.plugins.win"),
  words = require("plugins.ui.snacks.plugins.words"),
}

-- some/other/directory/?.lua;~/.config/nvim/lua/? ... how require works
