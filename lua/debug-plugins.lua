local M = {}

M.load = function(use)
	-----------------------------------------------------------
	-- Essential plugins
	-----------------------------------------------------------
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")
	-----------------------------------------------------------
	-- colorscheme for neovim written in lua specially made for roshnvim
	-----------------------------------------------------------
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use("bluz71/vim-moonfly-colors")
	use("shaeinst/roshnivim-cs")
	use("mhartington/oceanic-next")
	use("folke/tokyonight.nvim")
	-----------------------------------------------------------
	-- User Interface
	-----------------------------------------------------------
	-- maximizes and restores current window
	use("szw/vim-maximizer")
	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")
	-- Fuzzy files finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-raw.nvim",
		},
	})
	-- Icons
	use("nvim-tree/nvim-web-devicons")
	-- File/Flolders explorer:nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
	-- Screen Navigation
	use("folke/which-key.nvim")
end

return M
