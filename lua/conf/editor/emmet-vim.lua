-- https://github.com/mattn/emmet-vim

local M = {
    requires = {
        "emmet-vim",
    },
}

function M.before() end

function M.load()
    -- Enable emmet in all modes
    vim.g.user_emmet_mode = "a"
    -- Modify the default button
    -- 默认触发键为Ctrl+y+,
    -- vim.g.user_emmet_leader_key = "<c-y>,")
end

function M.after() end

return M
