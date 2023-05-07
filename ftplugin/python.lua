vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- 一键运行python
-- vim.cmd(
-- [[
-- map <F4> :call RunPython()<CR>
-- func! RunPython()
-- 	exec "w"
-- 	if &filetype=='python'
-- 	    set splitbelow
-- 	    " :sp
-- 	    " :term python3 %
-- 	    " :sp term://python %
-- 		exec "!time python3 %"
-- 	endif
-- endfunc
-- ]]
-- )

vim.api.nvim_set_keymap("n", "<F4>", "<cmd>!python3 %<CR>", {silent = true, noremap = true})

-- 自动创建python头部信息
vim.cmd(
[[
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
]]
)


