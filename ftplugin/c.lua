vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "c",
--     callback = function()
--         -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
--         vim.api.nvim_buf_set_keymap(
--             0,
--             "n",
--             "<F2>",
--             "<ESC>:w<CR>:split<CR>:te gcc -std=c11 -Wshadow -Wall -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
--             { silent = true, noremap = true }
--         )
--         vim.api.nvim_buf_set_keymap(
--             0,
--             "n",
--             "<F4>",
--             "<ESC>:w<CR>:split<CR>:te clang -std=c11 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
--             { silent = true, noremap = true }
--         )
--     end,
-- })

vim.api.nvim_set_keymap(
    "n",
    "<F2>",
    "<ESC>:w<CR>:split<CR>:te gcc -std=c11 -Wshadow -Wall -o %:t:r.out % -g  && time ./%:t:r.out<CR>i",
    {silent = true, noremap = true}
)

vim.api.nvim_set_keymap(
    "n",
    "<F3>",
    "<ESC>:w<CR>:split<CR>:te clang -std=c11 -Wshadow -Wall -o %:t:r.out % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>i",
    {silent = true, noremap = true}
)
