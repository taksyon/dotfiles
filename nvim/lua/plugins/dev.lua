return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*', -- optional: use stable version
    build = 'make install_jsregexp', -- for regex snippet support
    dependencies = {
      'rafamadriz/friendly-snippets', -- optional: prebuilt snippets
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
  {
    'saadparwaiz1/cmp_luasnip',
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- nvim-cmp setup
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = 'lazydev',
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })

      return opts
    end,
  },

  -- blink.cmp setup
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    opts = {
      completion = {
        -- No auto-select
        list = { selection = { preselect = false, auto_insert = true } },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        -- add lazydev to your completion providers
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see :h blink.cmp)
            score_offset = 100,
          },
        },
      },
      keymap = {
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
      },
    },
  },
}
