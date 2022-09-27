-- https://github.com/EdenEast/nightfox.nvim

local M = {
    requires = {
        "nightfox",
    },
}

function M.before() end

function M.load()
    M.nightfox.setup({
    })
end

function M.after() end

return M
