-- plugins/ui/lualine/config.lua

--  ▜     ▜ ▘          ▘
--  ▐ ▌▌▀▌▐ ▌▛▌█▌  ▛▌▌▌▌▛▛▌
--  ▐▖▙▌█▌▐▖▌▌▌▙▖▗ ▌▌▚▘▌▌▌▌
--

return function()
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        "snacks_dashboard", "snacks_layout_box", "snacks_terminal",
      },
      theme = {
        normal = {
          a = { fg = '#00ff00', bg = "NONE" },
          b = { fg = '#abb2bf', bg = "NONE" },
          c = { fg = '#abb2bf', bg = "NONE" },
          x = { fg = '#00ffff', bg = "NONE" },
          y = { fg = '#ffffff', bg = "NONE" },
          z = { fg = '#00ff00', bg = "NONE" },
        },
        insert = {
          a = { fg = '#0000ff', bg = "NONE" },
          x = { fg = '#00ffff', bg = "NONE" },
          y = { fg = '#ffffff', bg = "NONE" },
          z = { fg = '#0000ff', bg = "NONE" },
        },
        visual = {
          a = { fg = '#ff00ff', bg = "NONE" },
          x = { fg = '#ffccff', bg = "NONE" },
          y = { fg = '#ffffff', bg = "NONE" },
          z = { fg = '#ff00ff', bg = "NONE" },
        },
        replace = {
          a = { fg = '#ffff00', bg = "NONE" },
          x = { fg = '#ffffcc', bg = "NONE" },
          y = { fg = '#ffffff', bg = "NONE" },
          z = { fg = '#ffff00', bg = "NONE" },
        },
        command = {
          a = { fg = '#ffa500', bg = "NONE" },
          x = { fg = '#ffcc99', bg = "NONE" },
          y = { fg = '#ffffff', bg = "NONE" },
          z = { fg = '#ffa500', bg = "NONE" },
        },
        inactive = {
          a = { fg = '#ffffff', bg = "NONE" },
          b = { fg = '#888888', bg = "NONE" },
          c = { fg = '#666666', bg = "NONE" },
          x = { fg = '#666666', bg = "NONE" },
          y = { fg = '#666666', bg = "NONE" },
          z = { fg = '#666666', bg = "NONE" },
        },
      },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
  })
end
