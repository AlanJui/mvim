--------------------------------------------------------------------
-- (1) Setup auto-completion: cmp.nvim
-- (2) Setup langserver via mason, mason-lspconfig and lspconfig
-- (3) Setup Linters and Formatters
--------------------------------------------------------------------
require("plugins-rc/copilot")
require("lsp/lsp-servers")
require("lsp/null-langserver")
require("lsp/auto-cmp")
require("lsp/lspsaga")
