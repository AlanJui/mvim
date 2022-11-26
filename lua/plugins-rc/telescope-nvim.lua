-- telescope.nvim.lua
local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local mappings_config = {
	n = { ["q"] = actions.close },
	i = { ["<C-u>"] = false, ["<C-d>"] = false },
}

local status, trouble = pcall(require, "trouble")
if status then
	local trouble_mappings = {
		i = { ["<c-t>"] = trouble.open_with_trouble },
		n = { ["<c-t>"] = trouble.open_with_trouble },
	}
	for _, value in ipairs(trouble_mappings) do
		table.insert(mappings_config, value)
	end
end

telescope.setup({
	defaults = {
		layout_config = { flex = { flip_columns = 130 } },
		mappings = mappings_config,
		layout_strategy = "flex",
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
	},
})

-- keymap
-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
-- keymap("n", "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- keymap("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- keymap("n", "<leader>sb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- keymap("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

-- keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
