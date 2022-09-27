-- https://github.com/j-hui/fidget.nvim
-- 查看 LSP 加载工作区的进度

local M = {
    requires = {
        "fidget",
    },
}

function M.before() end

function M.load()
    M.fidget.setup({
        window = {
            blend = 0,
        },
    })
end

function M.after() end

return M
