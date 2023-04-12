local nvim_config = _G.GetConfig()
local runtime_dir = nvim_config.runtime

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = runtime_dir .. "/undodir"
vim.opt.undofile = true
-----------------------------------------------------------
-- code folding
-----------------------------------------------------------
vim.cmd([[
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=5
]])
-- Ref: https://www.jmaguire.tech/posts/treesitter_folding/
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
