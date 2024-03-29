-----------------------------------------------------------
-- Global Functions
-----------------------------------------------------------
-- Get OS Name :lua print(vim.loop.os_uname().sysname)
function _G.is_empty(str)
	return str == nil or str == ""
end

function _G.join_paths(...)
	local PATH_SEPERATOR = vim.loop.os_uname().version:match("Windows") and "\\" or "/"
	local result = table.concat({ ... }, PATH_SEPERATOR)
	return result
end

function _G.is_git_dir()
	return os.execute("git rev-parse --is-inside-work-tree >> /dev/null 2>&1")
end

function _G.safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		-- vim.notify(string.format("Plugin not installed: %s", module), vim.log.levels.ERROR)
		vim.notify(string.format("Plugin not installed: %s", module), vim.log.levels.WARN)
		return ok
	end
	return result
end

function _G.which_os()
	local system_name

	if vim.fn.has("mac") == 1 then
		system_name = "macOS"
	elseif vim.fn.has("unix") == 1 then
		system_name = "Linux"
	elseif vim.fn.has("win32") == 1 then
		system_name = "Windows"
	else
		system_name = ""
	end

	return system_name
end

function _G.print_rtp()
	print(string.format("rtp = %s", vim.opt.rtp["_value"]))
end

function Print_table(a_table)
	for k, v in pairs(a_table) do
		print("key = ", k, "    value = ", v)
	end
end

function P(cmd)
	print(vim.inspect(cmd))
end

function _G.print_table(table)
	for k, v in pairs(table) do
		print("key = ", k, "    value = ", v)
	end
end

_G.load_config = function()
	vim.lsp.set_log_level("trace")
	if vim.fn.has("nvim-0.5.1") == 1 then
		require("vim.lsp.log").set_format_func(vim.inspect)
	end
	local nvim_lsp = require("lspconfig")
	local on_attach = function(_, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		local opts = { noremap = true, silent = true }
		buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	end

	-- Add the server that troubles you here
	local name = "pyright"
	local cmd = { "pyright-langserver", "--stdio" } -- needed for elixirls, omnisharp, sumneko_lua
	if not name then
		print("You have not defined a server name, please edit minimal_init.lua")
	end
	if not nvim_lsp[name].document_config.default_config.cmd and not cmd then
		print([[You have not defined a server default cmd for a server
      that requires it please edit minimal_init.lua]])
	end

	nvim_lsp[name].setup({ cmd = cmd, on_attach = on_attach })

	print(
		[[You can find your log at $HOME/.cache/nvim/lsp.log. Please paste in a github issue under a details tag as described in the issue template.]]
	)
end
