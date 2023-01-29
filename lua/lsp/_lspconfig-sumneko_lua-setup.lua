local lspconfig = require("lspconfig")
local on_attach = {}
local capabilities = {}
local lsp_flags = {}
local vim = {}

local lua_lsp_config = {
	["sumneko_lua"] = function()
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			commands = {
				Format = {
					function()
						require("stylua-nvim").format_file()
					end,
				},
			},
			settings = {
				Lua = {
					runtime = {
						-- Tell the LangServer which version of Lua you're
						-- using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = runtime_path,
					},
					diagnostics = {
						-- Get the LangServer to recognize the `vim` global
						-- Now, you don't get error/warning:
						-- "Undefined global `vim`".
						globals = { "vim" },
					},
					workspace = {
						-- Make server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- By default, lua-language-server sends anonymized
					-- data to its developers. Stop it using the following.
					telemetry = { enable = false },
				},
			},
		})
	end,
}

local lua_lsp_config2 = {
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = { globals = { "vim", "hs" } },
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
