-- https://github.com/phaazon/hop.nvim

-- NOTE: 快速跳转
local fns = require("utils.fns")

local M = {
    requires = {
        "hop",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.hop.setup({
        { keys = "qwertyuiopasdfghjklzxcvbnm" },
    })
end

function M.after() end

function M.register_key()
    fns.map.bulk_register({
        {
            mode = { "n", "v" },
            lhs = "ss",
            rhs = "<cmd>HopWord<cr>",
            options = { silent = true },
            description = "Jump to word head",
        },
        {
            mode = { "n", "v" },
            lhs = "sl",
            rhs = "<cmd>HopLine<cr>",
            options = { silent = true },
            description = "Jump to line",
        },
        {
            mode = { "n", "v" },
            lhs = "sf",
            rhs = "<cmd>HopChar1<cr>",
            options = { silent = true },
            description = "Jump to search char on buffer",
        },
        {
            mode = { "n", "v" },
            lhs = "sc",
            rhs = "<cmd>HopChar1CurrentLine<cr>",
            options = { silent = true },
            description = "Jump to search char on current line",
        },
    })
end

return M
