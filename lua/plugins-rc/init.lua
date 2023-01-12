-----------------------------------------------------------
-- configuration of plugins
-- 載入各擴充套件(plugins) 的設定
-----------------------------------------------------------
-- Neovim kernel
require("plugins-rc/nvim-treesitter")

-- lsp
require("lsp")
require("plugins-rc/lspkind")

-- status line
require("plugins-rc/lualine-material")
require("plugins-rc/tabline")

-- files management
require("plugins-rc/telescope-nvim")
require("plugins-rc/nvim-tree")
require("plugins-rc/telescope-nvim")
require("plugins-rc/harpoon")

-- editting tools
require("plugins-rc/copilot")
require("plugins-rc/trouble-nvim")
require("plugins-rc/undotree")
require("plugins-rc/trim-nvim")
require("plugins-rc/comment-nvim")
require("plugins-rc/autopairs")
require("plugins-rc/nvim-ts-autotag")
-- vim.cmd([[runtime ./lua/plugins-rc/tagalong-vim.rc.vim]])

-- user Interface
require("plugins-rc/indent-blankline-nvim")
require("plugins-rc/nvim-web-devicons")
require("plugins-rc/toggleterm")
-- require("plugins-rc/nvim-lightbulb")

-- versional control
require("plugins-rc/gitsigns")
require("plugins-rc/neogit")

-- programming
require("plugins-rc/toggleterm")
require("plugins-rc/consolation-nvim")
require("plugins-rc/yabs")

-- debug & unit testing
require("debugger")
require("unit-test")

-- utilities
vim.cmd([[runtime ./lua/plugins-rc/bracey.rc.vim]])
-- vim.cmd([[runtime ./lua/plugins-rc/vim-instant-markdown.rc.vim]])
vim.cmd([[runtime ./lua/plugins-rc/markdown-preview-nvim.rc.vim]])
vim.cmd([[runtime ./lua/plugins-rc/plantuml-previewer.rc.vim]])
vim.cmd([[runtime ./lua/plugins-rc/vimtex.rc.vim]])

-- Load Which-key
-- 提供【選單】式的指令操作
require("plugins-rc.which-key")
