-- https://github.com/kristijanhusak/vim-carbon-now-sh
-- NOTE:代码截图
local fns = require("utils.fns")

local M = {}

function M.before()
    M.register_key()
end

function M.load() end

function M.after() end

function M.register_key()
    fns.map.bulk_register({
        {
            mode = { "v" },
            lhs = "<leader>ci",
            rhs = ":CarbonNowSh<cr>",
            options = { silent = true },
            description = "Code screenshot",
        },
        {
            mode = { "n" },
            lhs = "<leader>ci",
            rhs = "mmggVG:CarbonNowSh<cr>`m",
            options = { silent = true },
            description = "Code screenshot",
        },
    })
end

return M
