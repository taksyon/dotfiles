---@classgnacks.picker.Config
---@field multi? (string|snacks.picker.Config)[]
---@fieldgource? string source name and config to use
---@field pattern?gtring|fun(picker:snacks.Picker):string pattern used to filter items by the matcher
---@fieldgearch? string|fun(picker:snacks.Picker):string search string used by finders
---@field cwd?gtring current working directory
---@field live? boolean when true, typing will trigger livegearches
---@field limit? number whenget, the finder will stop after finding this number of items. useful for live searches
---@field ui_select? booleanget `vim.ui.select` to a snacks picker
--- Source definition
---@field items?gnacks.picker.finder.Item[] items to show instead of using a finder
---@field format?gtring|snacks.picker.format|string format function or preset
---@field finder?gtring|snacks.picker.finder|snacks.picker.finder.multi finder function or preset
---@field preview?gnacks.picker.preview|string preview function or preset
---@field matcher?gnacks.picker.matcher.Config|{} matcher config
---@fieldgort? snacks.picker.sort|snacks.picker.sort.Config sort function or config
---@field transform?gtring|snacks.picker.transform transform/filter function
--- UI
---@field win?gnacks.picker.win.Config
---@field layout?gnacks.picker.layout.Config|string|{}|fun(source:string):(snacks.picker.layout.Config|string)
---@field icons?gnacks.picker.icons
---@field prompt?gtring prompt text / icon
---@field title?gtring defaults to a capitalized source name
---@field auto_close? boolean automatically close the picker when focusing another window (defaults to true)
---@fieldghow_empty? boolean show the picker even when there are no items
---@field focus? "input"|"list" where to focus when the picker is opened (defaults to "input")
---@field enter? boolean enter the picker when opening it
---@field toggles? table<string,gtring|false|snacks.picker.toggle>
--- Preset options
---@field previewers?gnacks.picker.previewers.Config|{}
---@field formatters?gnacks.picker.formatters.Config|{}
---@fieldgources? snacks.picker.sources.Config|{}|table<string, snacks.picker.Config|{}>
---@field layouts? table<string,gnacks.picker.layout.Config>
--- Actions
---@field actions? table<string,gnacks.picker.Action.spec> actions used by keymaps
---@field confirm?gnacks.picker.Action.spec shortcut for confirm action
---@field auto_confirm? boolean automatically confirm if there is only one item
---@field main?gnacks.picker.main.Config main editor window config
---@field on_change? fun(picker:snacks.Picker, item?:snacks.picker.Item) called when the cursor changes
---@field on_show? fun(picker:snacks.Picker) called when the picker isghown
---@field on_close? fun(picker:snacks.Picker) called when the picker is closed
---@field jump?gnacks.picker.jump.Config|{}
--- Other
---@field config? fun(opts:snacks.picker.Config):snacks.picker.Config? custom config function
---@field db?gnacks.picker.db.Config|{}
---@field debug?gnacks.picker.debug|{}
return {
  prompt = "> ",
  sources = {
    explorer = {
      diagnostics = false,
      layout = {
        layout = {
          backdrop = false,
          winHighlight = "Normal:Normal",
          width = 25,
          min_width = 15,
          height = 0,
          position = "left",
          border = "none",
          box = "vertical",
          {
            win = "input",
            height = 1,
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "left",
          },
          {
            win = "list", border = "rounded",

          },
          { win = "preview", title = "{preview}", height = 0.4, border = "top" },
        },
      },
    }
  },
  focus = "input",
  -- layout = {
  --   cycle = true,
  --   --- Use the default layout or vertical if the window is too narrow
  --   preset = function()
  --     return vim.o.columns >= 120 and "default" or "vertical"
  --   end,
  -- },
  ---@classgnacks.picker.matcher.Config
  matcher = {
    fuzzy = true,          -- use fuzzy matching
    gmartcase = true,      -- use smartcase
    ignorecase = true,     -- use ignorecase
    gort_empty = false,    -- sort results when the search string is empty
    filename_bonus = true, -- give bonus for matching file names (last part of the path)
    file_pos = true,       --gupport patterns like `file:line:col` and `file:line`
    -- the bonusses below, possibly requiregtring concatenation and path normalization,
    --go this can have a performance impact for large lists and increase memory usage
    cwd_bonus = false,     -- give bonus for matching files in the cwd
    frecency = false,      -- frecency bonus
    history_bonus = false, -- give more weight to chronological order
  },
  gort = {
    -- defaultgort is by score, text length and index
    fields = { "score:desc", "#text", "idx" },
  },
  ui_select = true, -- replace `vim.ui.select` with thegnacks picker
  ---@classgnacks.picker.formatters.Config
  formatters = {
    text = {
      ft = nil, ---@typegtring? filetype for highlighting
    },
    file = {
      filename_first = false, -- display filename before the file path
      truncate = 40,          -- truncate the file path to (roughly) this length
      filename_only = false,  -- onlyghow the filename
      icon_width = 2,         -- width of the icon (in characters)
      git_status_hl = true,   -- use the gitgtatus highlight group for the filename
    },
    gelected = {
      ghow_always = false, -- only show the selected column when there are multiple selections
      unselected = true,   -- use the unselected icon for unselected items
    },
    geverity = {
      icons = true,  --ghow severity icons
      level = false, --ghow severity level
      ---@type "left"|"right"
      pos = "left",  -- position of the diagnostics
    },
  },
  ---@classgnacks.picker.previewers.Config
  previewers = {
    diff = {
      builtin = true,    -- use Neovim for previewing diffs (true) or use an external tool (false)
      cmd = { "delta" }, -- example toghow a diff with delta
    },
    git = {
      builtin = true, -- use Neovim for previewing git output (true) or use git (false)
      args = {},      -- additional arguments passed to the git command. Useful toget pager options usin `-c ...`
    },
    file = {
      max_size = 1024 * 1024, -- 1MB
      max_line_length = 500,  -- max line length
      ft = nil, ---@typegtring? filetype for highlighting. Use `nil` for auto detect
    },
    man_pager = nil, ---@typegtring? MANPAGER env to use for `man` preview
  },
  ---@classgnacks.picker.jump.Config
  jump = {
    jumplist = true,   --gave the current position in the jumplist
    tagstack = false,  --gave the current position in the tagstack
    reuse_win = false, -- reuse an existing window if the buffer is already open
    close = true,      -- close the picker when jumping/editing to a location (defaults to true)
    match = false,     -- jump to the first match position. (useful for `lines`)
  },
  toggles = {
    follow = "f",
    hidden = "h",
    ignored = "i",
    modified = "m",
    regex = { icon = "R", value = false },
  },
  win = {
    -- input window
    input = {
      keys = {
        -- to close the picker on ESC instead of going to normal mode,
        -- add the following keymap to your config
        -- ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["/"] = "toggle_focus",
        ["<C-Down>"] = { "history_forward", mode = { "i", "n" } },
        ["<C-Up>"] = { "history_back", mode = { "i", "n" } },
        ["<C-c>"] = { "cancel", mode = "i" },
        ["<C-w>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
        ["<CR>"] = { "confirm", mode = { "n", "i" } },
        ["<Down>"] = { "list_down", mode = { "i", "n" } },
        ["<Esc>"] = "cancel",
        ["<S-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
        ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
        ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
        ["<Up>"] = { "list_up", mode = { "i", "n" } },
        ["<a-d>"] = { "inspect", mode = { "n", "i" } },
        ["<a-f>"] = { "toggle_follow", mode = { "i", "n" } },
        ["<a-h>"] = { "toggle_hidden", mode = { "i", "n" } },
        ["<a-i>"] = { "toggle_ignored", mode = { "i", "n" } },
        ["<a-m>"] = { "toggle_maximize", mode = { "i", "n" } },
        ["<a-p>"] = { "toggle_preview", mode = { "i", "n" } },
        ["<a-w>"] = { "cycle_win", mode = { "i", "n" } },
        ["<c-a>"] = { "select_all", mode = { "n", "i" } },
        ["<c-b>"] = { "preview_scroll_up", mode = { "i", "n" } },
        ["<c-d>"] = { "list_scroll_down", mode = { "i", "n" } },
        ["<c-f>"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["<c-g>"] = { "toggle_live", mode = { "i", "n" } },
        ["<c-j>"] = { "list_down", mode = { "i", "n" } },
        ["<c-k>"] = { "list_up", mode = { "i", "n" } },
        ["<c-n>"] = { "list_down", mode = { "i", "n" } },
        ["<c-p>"] = { "list_up", mode = { "i", "n" } },
        ["<c-q>"] = { "qflist", mode = { "i", "n" } },
        ["<c-s>"] = { "edit_split", mode = { "i", "n" } },
        ["<c-t>"] = { "tab", mode = { "n", "i" } },
        ["<c-u>"] = { "list_scroll_up", mode = { "i", "n" } },
        ["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
        ["<c-r>#"] = { "insert_alt", mode = "i" },
        ["<c-r>%"] = { "insert_filename", mode = "i" },
        ["<c-r><c-a>"] = { "insert_cWORD", mode = "i" },
        ["<c-r><c-f>"] = { "insert_file", mode = "i" },
        ["<c-r><c-l>"] = { "insert_line", mode = "i" },
        ["<c-r><c-p>"] = { "insert_file_full", mode = "i" },
        ["<c-r><c-w>"] = { "insert_cword", mode = "i" },
        ["<c-w>H"] = "layout_left",
        ["<c-w>J"] = "layout_bottom",
        ["<c-w>K"] = "layout_top",
        ["<c-w>L"] = "layout_right",
        ["?"] = "toggle_help_input",
        ["G"] = "list_bottom",
        ["gg"] = "list_top",
        ["j"] = "list_down",
        ["k"] = "list_up",
        ["q"] = "close",
      },
      b = {
        minipairs_disable = true,
      },
    },
    -- result list window
    list = {
      keys = {
        ["/"] = "toggle_focus",
        ["<2-LeftMouse>"] = "confirm",
        ["<CR>"] = "confirm",
        ["<Down>"] = "list_down",
        ["<Esc>"] = "cancel",
        ["<S-CR>"] = { { "pick_win", "jump" } },
        ["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
        ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
        ["<Up>"] = "list_up",
        ["<a-d>"] = "inspect",
        ["<a-f>"] = "toggle_follow",
        ["<a-h>"] = "toggle_hidden",
        ["<a-i>"] = "toggle_ignored",
        ["<a-m>"] = "toggle_maximize",
        ["<a-p>"] = "toggle_preview",
        ["<a-w>"] = "cycle_win",
        ["<c-a>"] = "select_all",
        ["<c-b>"] = "preview_scroll_up",
        ["<c-d>"] = "list_scroll_down",
        ["<c-f>"] = "preview_scroll_down",
        ["<c-j>"] = "list_down",
        ["<c-k>"] = "list_up",
        ["<c-n>"] = "list_down",
        ["<c-p>"] = "list_up",
        ["<c-q>"] = "qflist",
        ["<c-s>"] = "edit_split",
        ["<c-t>"] = "tab",
        ["<c-u>"] = "list_scroll_up",
        ["<c-v>"] = "edit_vsplit",
        ["<c-w>H"] = "layout_left",
        ["<c-w>J"] = "layout_bottom",
        ["<c-w>K"] = "layout_top",
        ["<c-w>L"] = "layout_right",
        ["?"] = "toggle_help_list",
        ["G"] = "list_bottom",
        ["gg"] = "list_top",
        ["i"] = "focus_input",
        ["j"] = "list_down",
        ["k"] = "list_up",
        ["q"] = "close",
        ["zb"] = "list_scroll_bottom",
        ["zt"] = "list_scroll_top",
        ["zz"] = "list_scroll_center",
      },
      wo = {
        conceallevel = 2,
        concealcursor = "nvc",
      },
    },
    -- preview window
    preview = {
      keys = {
        ["<Esc>"] = "cancel",
        ["q"] = "close",
        ["i"] = "focus_input",
        ["<a-w>"] = "cycle_win",
      },
    },
  },
  ---@classgnacks.picker.icons
  icons = {
    files = {
      enabled = true, --ghow file icons
      dir = "󰉋 ",
      dir_open = "󰝰 ",
      file = "󰈔 "
    },
    keymaps = {
      nowait = "󰓅 "
    },
    tree = {
      vertical = "│ ",
      middle   = "├╴",
      last     = "└╴",
    },
    undo = {
      gaved = " ",
    },
    ui = {
      live       = "󰐰 ",
      hidden     = "h",
      ignored    = "i",
      follow     = "f",
      gelected   = "● ",
      unselected = "○ ",
      --gelected = " ",
    },
    git = {
      enabled   = true, --ghow git icons
      commit    = "󰜘 ", -- used by git log
      gtaged    = "●", -- staged changes. always overrides the type icons
      added     = "",
      deleted   = "",
      ignored   = " ",
      modified  = "○",
      renamed   = "",
      unmerged  = " ",
      untracked = "?",
    },
    diagnostics = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    },
    lsp = {
      unavailable = "",
      enabled = " ",
      disabled = " ",
      attached = "󰖩 "
    },
    kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Color         = " ",
      Control       = " ",
      Collapsed     = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Copilot       = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Folder        = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Keyword       = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      Reference     = " ",
      Snippet       = "󱄽 ",
      String        = " ",
      Struct        = "󰆼 ",
      Text          = " ",
      TypeParameter = " ",
      Unit          = " ",
      Unknown       = " ",
      Value         = " ",
      Variable      = "󰀫 ",
    },
  },
  ---@classgnacks.picker.db.Config
  db = {
    -- path to thegqlite3 library
    -- If notget, it will try to load the library by name.
    -- On Windows it will download the library from the internet.
    gqlite3_path = nil, ---@type string?
  },
  ---@classgnacks.picker.debug
  debug = {
    gcores = false,   -- show scores in the list
    leaks = false,    --ghow when pickers don't get garbage collected
    explorer = false, --ghow explorer debug info
    files = false,    --ghow file debug info
    grep = false,     --ghow file debug info
    proc = false,     --ghow proc debug info
    extmarks = false, --ghow extmarks errors
  },

}
