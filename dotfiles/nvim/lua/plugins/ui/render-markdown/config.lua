-- plugins/ui/render-markdown/config.lua


--         ▌             ▌  ▌             ▘
--  ▛▘█▌▛▌▛▌█▌▛▘▄▖▛▛▌▀▌▛▘▙▘▛▌▛▌▌▌▌▛▌  ▛▌▌▌▌▛▛▌
--  ▌ ▙▖▌▌▙▌▙▖▌   ▌▌▌█▌▌ ▛▖▙▌▙▌▚▚▘▌▌▗ ▌▌▚▘▌▌▌▌
--

return function()
  require('render-markdown').setup({
    auto_enable = true,         -- Automatically enable rendering for Markdown files
    completions = { lsp = { enabled = true } },
    filetypes = { 'markdown' }, -- Explicitly set file types for rendering
    conceal = true,             -- Conceal certain syntax elements for a cleaner view
    fold = true,
  })
end
