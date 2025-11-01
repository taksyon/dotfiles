--            ▜
--  ▛▘▛▌▛▘█▌  ▐ ▌▌▀▌
--  ▙▖▙▌▌ ▙▖▗ ▐▖▙▌█▌
--

return {
  -- plenary.nvim - Core dependency used by many plugins, must always be loaded
  {
    'nvim-lua/plenary.nvim',
    lazy = false, -- Ensures it's always loaded at startup
    priority = 1000, -- Load early as other plugins may depend on it
  },

  -- Icons support for file types, UI elements, and status lines
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true, -- Load only when required
    event = 'VeryLazy', -- Loads when plugins that need it are triggered
    opts = {
      override = {
        zsh = { icon = '', color = '#428850', name = 'Zsh' },
      },
      default = true, -- Use default icons for unsupported file types
    },
    config = function()
      require('nvim-web-devicons').setup({
        override_by_extension = {},
        override = {},
        defautl = true,
      })
      -- Force all DevIcon* highlights to the same color
      -- for _, group in pairs(vim.fn.getcompletion("DevIcon", "highlight")) do
      --   vim.api.nvim_set_hl(0, group, { fg = "#abb2bf", bg = "NONE" })
      -- end
    end,
  },
}
