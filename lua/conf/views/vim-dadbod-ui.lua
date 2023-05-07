-- https://github.com/kristijanhusak/vim-dadbod-ui
-- https://github.com/tpope/vim-dadbod

local api = require("utils.api")
local common = require("utils.common")
local options = require("core.options")

local M = {}

function M.before()
    M.register_key()
end

function M.load()
    vim.g.dbs = api.json.load(api.path.join(options.global_config_directory, "database.json"))
    vim.g.db_ui_winwidth = 30
    vim.g.db_ui_auto_execute_table_helpers = true
    vim.g.db_ui_execute_on_save = false
end
function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>4",
            rhs = function()
                local aerial_info = common.get_aerial_info()
                common.toggle_sidebar("dbui")
                vim.cmd("DBUIToggle")
                common.reset_aerial_width(aerial_info)
            end,
            options = { silent = true },
            description = "Open Database Explorer",
        },
    })
end

return M
