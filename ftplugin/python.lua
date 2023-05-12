vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<F4>",
            -- "<cmd>!python %<CR>",
            ":w<CR>:split<CR>:te time /usr/bin/python3 %<CR>i",
            { silent = true, noremap = true }
        )
    end,
})

-- 自动创建python头部信息
vim.cmd([[
autocmd BufNewFile *.py,*.tex exec ":call SetTitle()"
map <F1> :call SetTitle()<CR>
func! SetTitle()
    if &filetype == 'python'
        call setline(1,"#!/usr/bin python3")
        call append(line("."),"# -*- coding:UTF-8 -*-")
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author: xssaw 🐬")
        call append(line(".")+3, "# Created Time: ".strftime("%c"))
    endif
    normal Go
endfunc
]])
