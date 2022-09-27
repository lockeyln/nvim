if not vim.fn.has("nvim-0.8") then
    assert(false, "this config require nvim-0.8")
end

-- Enable Lua's ftplugin
-- vim.g.do_filetype_lua = 1
-- Do not disable ftplugin
-- vim.g.did_load_filetypes = 0

require("core.colorscheme")
require("core.settings")
require("core.options")
require("core.keybinds")
require("core.plugins")
require("core.after")

