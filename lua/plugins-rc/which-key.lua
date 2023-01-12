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
	["."] = { "<cmd>lua _lazygit_toggle()<CR>", "Lazygit" },
	[";"] = { ":ToggleTerm size=10<CR>", "Open Terminal" },
	["/"] = { "gcc", "Comment out (Toggle)" },
	["\\"] = { ":NvimTreeToggle<CR>", "File explorer" },
	["e"] = { ":Vifm<CR>", "Files manager" },
	["q"] = {
		":FloatermNew --height=0.7 --width=0.9 --wintype=float  ranger<CR>",
		"Quick viewer",
	},
	["z"] = { "UndotreeToggle<CR>", "Undo tree" },
	-- Actions
	a = {
		name = "Actions",
		h = { ':let @/ = ""<CR>', "remove search highlight" },
		t = { ":set filetype=htmldjango<CR>", "set file type to django template" },
		T = { ":set filetype=html<CR>", "set file type to HTML" },
		l = { ":set wrap!<CR>", "on/off line wrap" },
		n = { ":set nonumber!<CR>", "on/off line-numbers" },
		N = { ":set norelativenumber!<CR>", "on/off relative line-numbers" },
	},
	-- Files
	f = {
		name = "Files",
		e = { ":NvimTreeToggle<CR>", "File explorer" },
		w = { ":w<CR>", "Save" },
		i = { "gg=G", "Formate indent of line" },
		b = {
			name = "Buffers",
			l = { ":Telescope buffers<CR>", "List all buffers" },
			p = { "gT", "Prev. buffer" },
			n = { "gt", "Next buffer" },
		},
		c = {
			name = "Close",
			c = { ":bdelete<CR>", "Close" },
			b = { '%bdelete|edit #|normal `"<CR>', "Close all but current" },
		},
		q = {
			name = "Quit/Exit",
			["!"] = { ":q!<CR>", "Quit withou save" },
			q = { ":q<CR>", "Quit" },
			x = { ":qa<CR>", "Exit Neovim" },
			X = { ":qa!<CR>", "Exit Neovim without save" },
		},
		-- Search files
		s = {
			name = "Search",
			a = { ":Telescope live_grep<CR>", "Live grep" },
			b = { ":Telescope buffers theme=get_dropdown<CR>", "buffers" },
			f = { ":Telescope find_files<CR>", "Find files" },
			g = { ":Telescope git_files<CR>", "Git files" },
			m = { ":Telescope marks<CR>", "Bookmarks" },
			r = { ":Telescope oldfiles<CR>", "Recently open files" },
			h = { ":Telescope help_tags<CR>", "Help Tags" },
			p = { ":FloatermNew ranger<CR>", "Picture Viewer" },
			w = { ":Telescope live_grep<CR>", "Find word" },
			v = { ":FloatermNew vifm<CR>", "ViFm" },
		},
	},
	-- Build (yabs)
	b = {
		name = "Build...",
		T = {
			name = "tasks",
			t = { ":Telescope yabs tasks<CR>", "List yabs tasks" },
			g = { ":Telescope yabs globals_tasks<CR>", "List all yabs tasks" },
			l = {
				":Telescope yabs current_language_tasks<CR>",
				"List yabs tasks for language",
			},
		},
		t = { ":Telescope yabs current_language_tasks<CR>", "Tasks for language" },
		d = {
			"<cmd>lua require('yabs'):run_default_task()<CR>",
			"Run default task",
		},
		l = { "<cmd>lua require('yabs'):run_task('lint')<CR>", "Lint task" },
		b = { "<cmd>lua require('yabs'):run_task('build')<CR>", "Build task" },
		r = { "<cmd>lua require('yabs'):run_task('run')<CR>", "Run task" },
		z = {
			"<cmd>lua require('yabs').run_command('echo hello, world', 'quickfix', { open_on_run = 'always' })<CR>",
			"Run command directly",
		},
	},
	-- Coding
	c = {
		name = "Coding",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Do CodeAction" },
		A = {
			"<cmd>lua vim.lsp.buf.range_code_action()<CR>",
			"Do Range CodeAction",
		},
		-- LSP diagnostics
		d = {
			":Telescope diagnostics bufnr=0<CR>",
			"List diagnostics current file",
		},
		D = {
			name = "Diagnostics",
			w = { ":Telescope diagnostics<CR>", "List diagnostics in worksapce" },
			l = {
				":Telescope diagnostics bufnr=0<CR>",
				"List diagnostics current file",
			},
			f = {
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				"Open diagnostics floating",
			},
			p = {
				"<cmd>lua vim.diagnostic.goto_prev()<CR>",
				"Goto prev diagnostics",
			},
			n = {
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				"Goto next diagnostics",
			},
		},
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Formatting code" },
		k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show HoverDocument" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename code" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help" },
		g = {
			name = "goto",
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
			t = {
				"<cmd>lua vim.lsp.buf.type_definition()<CR>",
				"Go to type definition",
			},
			i = {
				"<cmd>lua vim.lsp.buf.implementation()<CR>",
				"Go to Implementation",
			},
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		},
		m = {
			name = "misc",
			t = {
				":set filetype=htmldjango<CR>",
				"set file type to django template",
			},
			T = { ":set filetype=html<CR>", "set file type to HTML" },
		},
		w = {
			name = "workspace",
			l = {
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
				"List workspace folders",
			},
			a = {
				"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
				"Add folder to workspace",
			},
			r = {
				"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
				"Remove folder from workspace",
			},
		},
	},
	-- Debug
	d = {
		name = "Debug",
		b = {
			"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
			"Toggle breakpoint",
		},
		B = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition<cmd> '))<CR>",
			"Condition breakpoint",
		},
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
		O = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		Q = {
			"<cmd>lua require'dap'.close()<CR><cmd>lua require'dap.repl'.close()<CR><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
			"Quit Nvim DAP",
		},
		-- Show contents in Variable when mouse pointer hover
		h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "Show/Hide Debug Sidebar" },
		V = {
			"<cmd>lua local widgets=require'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<CR>",
			"Use widgets to display the variables",
		},
		-- REPEL
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
	},
	-- Git
	g = {
		name = "Git",
		g = { ":Neogit<CR>", "Neogit" },
		a = { ":Git add .<CR>", "add all" },
		b = { ":Git blame<CR>", "blame" },
		B = { ":GBrowse<CR>", "Browse GitHub repo" },
		c = { ":Git commit<CR>", "commit" },
		d = { ":Gvdiffsplit<CR>", "diff vsplit" },
		D = {
			name = "+Diff",
			h = { ":Gdiffsplit<CR>", "diff split" },
			v = { ":Gvdiffsplit<CR>", "diff vsplit" },
			n = { ":Git diff<CR>", "Normal diff" },
		},
		l = { ":Git log<CR>", "List log with details" },
		L = { ":Git log --oneline<CR>", "List log within one line" },
		p = { ":Git push<CR>", "push" },
		P = { ":Git pull<CR>", "pull" },
		r = { ":GRemove<CR>", "remove" },
		s = { ":Git<CR>", "status" },
		S = { ":GitGutterSignsToggle<CR>", "toggle signs" },
		T = {
			':Git log --no-walk --tags --pretty="%h %d %s" --decorate=full<CR>',
			"List all tags in log",
		},
		z = { ":FloatermNew lazygit<CR>", "Lazygit" },
		-- Gist
		G = {
			name = "gist",
			-- a    = {':Gist -a', 'post a gist anonymously' },
			-- b    = {':Gist -b', 'post gist browser' },
			d = { ":Gist -d<CR>", "delete gist" },
			e = { ":Gist -e<CR>", "edit gist" },
			l = { ":Gist -l<CR>", "list public gists" },
			s = { ":Gist -ls<CR>", "list starred gists" },
			m = { ":Gist -m<CR>", "post a gist with all open buffers" },
			p = { ":Gist -p<CR>", "post public gist" },
			P = { ":Gist -P<CR>", "post private gist" },
		},
	},
	-- utilities
	u = {
		name = "Utilities",
		t = {
			name = "terminal",
			d = { "TermExec python manage.py shell<CR>", "Django-admin Shell" },
			p = { "TermExec python<CR>", "Python shell" },
			n = { "TermExec node<CR>", "Node.js shell" },
			v = {
				"TermExec --wintype='vsplit' --position='right'<CR>",
				"Debug Term...",
			},
		},
		l = {
			name = "LiveServer",
			l = { ":Bracey<CR>", "start live server" },
			L = { ":BraceyStop<CR>", "stop live server" },
			r = { ":BraceyReload<CR>", "web page to be reloaded" },
		},
		m = {
			name = "Markdown",
			m = { ":MarkdownPreview<CR>", "start markdown preview" },
			M = { ":MarkdownPreviewStop<CR>", "stop markdown preview" },
		},
		u = {
			name = "UML",
			v = { ":PlantumlOpen<CR>", "start PlantUML preview" },
			o = {
				":PlantumlSave docs/diagrams/out.png<CR>",
				"export PlantUML diagram",
			},
		},
		f = {
			"TermExec --height=0.7 --width=0.9 --wintype=float vifm<CR>",
			"ViFm",
		},
		r = {
			"TermExec --height=0.7 --width=0.9 --wintype=float ranger<CR>",
			"Ranger",
		},
	},
	-- Terminal
	t = {
		name = "Terminal",
		c = { "<cmd>lua BuiltinTerminalWrapper:create()<CR>", "Create Terminal" },
		o = { "<cmd>lua BuiltinTerminalWrapper:open()<CR>", "Open Terminal" },
		C = { "<cmd>lua BuiltinTerminalWrapper:close()<CR>", "Close Terminal" },
		x = { "<cmd>lua BuiltinTerminalWrapper:kill()<CR>", "Kill Terminal" },
		-- t = { "<cmd>lua BuiltinTerminalWrapper:toggle()<CR>", "Toggle Terminal" },
		h = {
			":ToggleTerm size=15 direction=horizontal<CR>",
			"Toggle horizontal terminal",
		},
		v = {
			":ToggleTerm size=" .. (vim.o.columns * 0.5) .. " direction=vertical<CR>",
			"Toggle vertical terminal",
		},
	},
	-- Running code
	r = {
		name = "Run...",
		p = {
			name = "Python",
			p = {
				":TermExec direction=horizontal cmd='python %'<CR>",
				"Run current file",
			},
			l = {
				":TermExec direction=horizontal cmd='pylint %'<CR>",
				"Lint current file",
			},
		},
		d = {
			name = "Django...",
			k = { ":2TermExec cmd='npx kill-port 8000'<CR>", "Kill Port" },
			g = { ":2TermExec cmd='git status'<CR>", "git status" },
			r = { ":TermExec cmd='python manage.py runserver'<CR>", "Runserver" },
			R = {
				":TermExec cmd='python manage.py runserver --noreload'<CR>",
				"Runserver --noreload",
			},
			S = { ":2TermExec cmd='python manage.py shell'<CR>", "Django Shell" },
			s = {
				":2TermExec cmd='python manage.py createsuperuser'<CR>",
				"Create super user",
			},
			c = {
				":2TermExec cmd='echo yes | python manage.py collectstatic'<CR>",
				"Collect all static files",
			},
			m = {
				":2TermExec cmd='python manage.py makemigrations'<CR>",
				"Update DB schema",
			},
			M = { ":2TermExec cmd='python manage.py migrate'<CR>", "Migrate DB" },
		},
		-- unit testing
		u = {
			name = "Unit Testing...",
			n = {
				"<cmd>lua require('neotest').run.run()",
				"Run the nearest test",
			},
			r = {
				"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))",
				"Test current file",
			},
			-- Debug the nearest test (requires nvim-dap and adapter support)
			d = {
				"require('neotest').run.run({strategy = 'dap'})",
				"Debug the nearest test",
			},
			s = { "require('neotest').run.stop()", "Stop the nearest test" },
			a = {
				"require('neotest').run.attach()",
				"Attach to the nearest test",
			},
		},
	},
	-- LSP
	x = {
		name = "Trouble",
		x = { ":TroubleToggle<CR>", "On/Off TroubleToggle" },
		r = { ":TroubleToggle lsp_references<CR>", "Display LSP References" },
		q = { ":TroubleToggle quickfix<CR>", "List QuickFix" },
		w = {
			":TroubleToggle workspace_diagnostics<CR>",
			"List diatnostics of workspace",
		},
		d = {
			":TroubleToggle document_diagnostics<CR>",
			"List diatnostics of current file",
		},
		l = { ":TroubleToggle loclist<CR>", "List loclist" },
		j = {
			name = "Jump",
			f = {
				'<cmd>lua require("trouble").first({skip_groups = true, jump = true})',
				"Jump to the first item, skipping the groups",
			},
			p = {
				'<cmd>lua require("trouble").previous({skip_groups = true, jump = true})',
				"Jump to the previous item, skipping the groups",
			},
			n = {
				'<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>',
				"Jump to the next item, skipping the groups",
			},
			l = {
				'<cmd>lua require("trouble").last({skip_groups = true, jump = true})',
				"Jump to the last item, skipping the groups",
			},
		},
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

local opts = {
	prefix = "<leader>",
	key_labels = { ["<space"] = "SPC", ["<tab>"] = "TAB" },
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by deafult for Telescope
	disable = { buftypes = {}, filetypes = { "TelescopePrompt" } },
}

which_key.setup()

which_key.register(mappings, opts)
