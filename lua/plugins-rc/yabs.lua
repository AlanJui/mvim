local yabs = safe_require("yabs")
if not yabs then
	return
end

local telescope = safe_require("telescope")
if not telescope then
	return
end

local lua_config = {
	default_task = "run",
	tasks = {
		run = {
			command = "lua %",
			output = "terminal",
			type = "lua",
		},
	},
}

local python_config = {
	default_task = "run",
	tasks = {
		build = { command = "python %", output = "terminal" },
		run = { command = "python %", output = "terminal" },
		lint = { command = "pylint %", output = "terminal" },
	},
}

yabs:setup({
	languages = { -- List of languages in vim's `filetype` format
		lua = lua_config,
		python = python_config,
	},
	tasks = { -- Same values as `language.tasks`, but global
		build = { command = "echo building project...", output = "terminal" },
		run = { command = "echo running project...", output = "echo" },
		optional = {
			command = "echo runs on condition",
			-- You can specify a condition which determines whether to enable a
			-- specific task
			-- It should be a function that returns boolean,
			-- not a boolean directly
			-- Here we use a helper from yabs that returns such function
			-- to check if the files exists
			condition = require("yabs.conditions").file_exists("filename.txt"),
		},
	},
	opts = { -- Same values as `language.opts`
		output_types = { quickfix = { open_on_run = "always" } },
	},
})

telescope.load_extension("yabs")
