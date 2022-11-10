-- https://github.com/kyazdani42/nvim-tree.lua
-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
-- https://github.com/kyazdani42/nvim-tree.lua

-- https://github.com/kyazdani42/nvim-tree.lua

local fns = require("utils.fns")
local common = require("utils.common")
local icons = common.get_icons("diagnostic", true)

local M = {
    requires = {
        "nvim-tree",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_tree.setup({
        disable_netrw = false,
        hijack_netrw = false,
        hijack_cursor = true,
        update_cwd = true,
        ignore_ft_on_setup = { "dashboard" },
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            side = "left",
            width = 30,
            hide_root_folder = false,
            signcolumn = "yes",
            mappings = {
                list = {
                    { key = "?", action = "toggle_help" },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = icons.Hint,
                info = icons.Info,
                warning = icons.Warn,
                error = icons.Error,
            },
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = true,
                restrict_above_cwd = false,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        filters = {
            dotfiles = false,
            custom = { "node_modules", "\\.cache", "__pycache__" },
            exclude = {},
        },
        renderer = {
            add_trailing = true,
            highlight_git = true,
            highlight_opened_files = "none",
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "凜",
                        untracked = "",
                        deleted = "",
                        ignored = "",
                    },
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                },
            },
        },
    })
end

function M.after()
    -- -- FIX: https://github.com/kyazdani42/nvim-tree.lua/issues/1502
    -- local utils = require("nvim-tree.utils")
    --
    -- ---@diagnostic disable-next-line: unused-local
    -- local function notify_level(level)
    --     return function(msg)
    --         vim.schedule(function()
    --             vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
    --         end)
    --     end
    -- end
    --
    -- utils.notify.warn = notify_level(vim.log.levels.WARN)
    -- utils.notify.error = notify_level(vim.log.levels.ERROR)
    -- utils.notify.info = notify_level(vim.log.levels.INFO)
    -- utils.notify.debug = notify_level(vim.log.levels.DEBUG)
end

function M.register_key()
    fns.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            rhs = function()
                common.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeToggle")
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
        {
            mode = { "n" },
            lhs = "<leader>fc",
            rhs = function()
                common.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeFindFile")
            end,
            options = { silent = true },
            description = "Find the current file and open it in file explorer",
        },
    })
end

return M
