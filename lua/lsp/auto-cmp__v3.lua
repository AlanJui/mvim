local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

------------------------------------------------------------
-- Autocomplete
------------------------------------------------------------
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local select_opts = { behavior = cmp.SelectBehavior.Select }

require("plugins-rc.lspkind")
local lspkind = require("lspkind")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
	},
	window = { documentation = cmp.config.window.bordered() },
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-d>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-e>"] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false`
		-- to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			-- before = function(entry, vim_item)
			-- 	return vim_item
			-- end,
		}),
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, { { name = "buffer" } }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

-- Set up lspconfig.
-- 置於 lsp-servers.lua
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- -- require("lspconfig")["<YOUR_LSP_SERVER>"].setup({ capabilities = capabilities })
-- require("lspconfig")["pyright"].setup({ capabilities = capabilities })

------------------------------------------------------------
-- Add Snippets
------------------------------------------------------------

-- Load your own custom vscode style snippets
-- CONFIG_DIR .. "/my-snippets",
-- RUNTIME_DIR .. "/site/pack/packer/start/friendly-snippets",
require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		vim.g.ConfigDir .. "/my-snippets",
		-- vim.g.RuntimeDir .. "/site/pack/packer/start/friendly-snippets",
	},
})
-- require("luasnip.loaders.from_vscode").lazy_load({
-- 	include = { "python", "django", "djangohtml", "htmldjango" },
-- })

-- extends filetypes supported by snippets
luasnip.filetype_extend("vimwik", { "markdown" })
luasnip.filetype_extend("html", { "htmldjango", "djangohtml" })
luasnip.filetype_extend("python", { "django" })
