--------------------------------------------------------------------------
-- WhichKey Configuration
--------------------------------------------------------------------------
local status, which_key = pcall(require, "which-key")
if not status then
	return
end

local mappings = {
	-- Top Menu
	[" "] = { ":Telescope find_files<CR>", "Find files" },
	[","] = { ":Telescope buffers<CR>", "Show buffers" },
	[";"] = { ":ToggleTerm size=10<CR>", "Open Terminal" },
	["v"] = {
		":FloatermNew --height=0.7 --width=0.9 --wintype=float  vifm<CR>",
		"ViFm",
	},
	["/"] = { "gcc", "Comment out (Toggle)" },
	["\\"] = { ":NvimTreeToggle<CR>", "File explorer" },
	["z"] = { "UndotreeToggle<CR>", "Undo tree" },
	-- Files
	f = {
		name = "Files",
		e = { ":NvimTreeToggle<CR>", "File explorer" },
		w = { ":w<CR>", "Save" },
		c = { ":bdelete<CR>", "Close" },
		C = { ":q!<CR>", "Quit withou save" },
		x = { ":qa<CR>", "Exit Neovim" },
		X = { ":qa!<CR>", "Exit Neovim without save" },
		q = { ":q<CR>", "Quit" },
	},
	-- Window
	w = {
		name = "Windows",
		["-"] = { ":split<CR>", "Horiz. window" },
		["_"] = { ":vsplit<CR>", "Vert. window" },
		["|"] = { ":vsplit<CR>", "Vert. window" },
		i = { ":tabnew %<CR>", "Zoom-in" },
		o = { ":tabclose<CR>", "Zoom-out" },
		c = { ":close<CR>", "Close window" },
		k = { "<C-w>k", "Up window" },
		j = { "<C-w>j", "Down window" },
		h = { "<C-w>h", "Left window" },
		l = { "<C-w>l", "Right window" },
		["<Up>"] = { "<cmd>wincmd -<CR>", "Shrink down" },
		["<Down>"] = { "<cmd>wincmd +<CR>", "Grow up" },
		["<Left>"] = { "<cmd>wincmd <<CR>", "Shrink narrowed" },
		["<Right>"] = { "<cmd>wincmd ><CR>", "Grow widder" },
		w = { ':exe "resize" . (winwidth(0) * 3/2)<CR>', "Increase weight" },
		W = { ':exe "resize" . (winwidth(0) * 2/3)<CR>', "Increase weight" },
		v = {
			':exe "vertical resize" . (winheight(0) * 3/2)<CR>',
			"Increase height",
		},
		V = {
			':exe "vertical resize" . (winheight(0) * 2/3)<CR>',
			"Increase height",
		},
	},
}

local opts = { prefix = "<leader>" }

which_key.register(mappings, opts)

which_key.setup({
	-- enable this to hide mappings for which you didn't specify a label
	ignore_missing = true,
})
