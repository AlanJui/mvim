-----------------------------------------------------------
-- Initial global constants
-- 設定所需使用之「全域常數」。
-----------------------------------------------------------
OS_SYS = which_os()

MY_VIM = vim.g.my_vim
HOME = os.getenv("HOME")

CONFIG_DIR = HOME .. "/.config/" .. MY_VIM
RUNTIME_DIR = HOME .. "/.local/share/" .. MY_VIM
PACKAGE_ROOT = RUNTIME_DIR .. "/site/pack"
INSTALL_PATH = PACKAGE_ROOT .. "/packer/start/packer.nvim"
COMPILE_PATH = CONFIG_DIR .. "/plugin/packer_compiled.lua"

vim.g.package_root = PACKAGE_ROOT
vim.g.install_path = INSTALL_PATH
vim.g.compile_path = COMPILE_PATH

INSTALLED = false
if vim.fn.empty(vim.fn.glob(INSTALL_PATH)) == 0 then
	INSTALLED = true
end

LSP_SERVERS = {
	"sumneko_lua",
	"vimls",
	"diagnosticls",
	"pyright",
	"emmet_ls",
	"html",
	"cssls",
	"tailwindcss",
	"stylelint_lsp",
	"eslint",
	"jsonls",
	"tsserver",
	"texlab",
}

DEBUGPY = "~/.virtualenvs/debugpy/bin/python"
vim.g.debugpy = DEBUGPY

-- Your own custom vscode style snippets
SNIPPETS_PATH = { CONFIG_DIR .. "/my-snippets/snippets" }

-----------------------------------------------------------
-- Python environment
-----------------------------------------------------------
PYENV_ROOT_PATH = HOME .. "/.pyenv/versions/"
PYTHON_VERSION = "3.10.6"
PYTHON_VENV = "venv-" .. PYTHON_VERSION
PYENV_GLOBAL_PATH = PYENV_ROOT_PATH .. "/" .. PYTHON_VERSION .. "/bin/python"
PYTHON_BINARY = PYENV_ROOT_PATH .. PYTHON_VERSION .. "/envs/" .. PYTHON_VENV .. "/bin/python"

-----------------------------------------------------------
-- Neovim global options
-----------------------------------------------------------
-- vim.g.python3_host_prog = '/home/alanjui/.pyenv/versions/3.10.6/bin/python3.10'
vim.g.python3_host_prog = PYTHON_BINARY
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-----------------------------------------------------------
-- Essential configuration on development init.lua
-----------------------------------------------------------
local set = vim.opt -- global options

-- Display tabs, newline control characters
set.list = false -- show whitespace
set.listchars = {
	nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
	extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
	precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
	tab = "▷─", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
	trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
	space = " ",
}
set.fillchars = {
	diff = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
	eob = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
	fold = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
	vert = " ", -- remove ugly vertical lines on window division
}

-- Disable line wrap
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.wo.wrap = false -- don't automatically wrap on load

set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.relativenumber = true -- show relative line number
