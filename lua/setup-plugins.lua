-----------------------------------------------------------
-- configuration of plugins
-- 載入各擴充套件(plugins) 的設定
-----------------------------------------------------------
-- Neovim kernel
require("plugins-rc.nvim-treesitter")

-- lsp
require("lsp")

-- status line
require("plugins-rc.lualine-material")
require("plugins-rc.tabline")

-- files management
require("plugins-rc.telescope-nvim")
require("plugins-rc.nvim-tree")

-- editting tools
require("plugins-rc.undotree")
require("plugins-rc.trim-nvim")
require("plugins-rc.comment-nvim")
require("plugins-rc.autopairs")
require("plugins-rc.nvim-ts-autotag")
-- vim.cmd([[runtime ./lua/plugins-rc/tagalong-vim.rc.vim]])

-- User Interface
require("plugins-rc.nvim-web-devicons")
require("plugins-rc/indent-blankline")
require("plugins-rc.toggleterm")
-- require("plugins-rc.nvim-lightbulb")

-- versional control
require("plugins-rc.gitsigns")
require("plugins-rc.neogit")
