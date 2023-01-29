-----------------------------------------------------------
-- Initial global constants
-- 設定所需使用之「全域常數」。
-----------------------------------------------------------
local nvim_config = GetConfig()

-- CONFIG_DIR = nvim_config["config_dir"]
-- RUNTIME_DIR = nvim_config["rutime_dir"]
-- PACKAGE_ROOT = nvim_config["package_root"]
-- INSTALL_PATH = nvim_config["install_path"]
-- COMPILE_PATH = nvim_config["compile_path"]

-- vim.g.ConfigDir = CONFIG_DIR
-- vim.g.RuntimeDir = RUNTIME_DIR
-- vim.g.PackageRoot = PACKAGE_ROOT
-- vim.g.InstallPath = INSTALL_PATH
-- vim.g.CompilePath = COMPILE_PATH
--
-- vim.g.package_root = PACKAGE_ROOT
-- vim.g.install_path = INSTALL_PATH
-- vim.g.compile_path = COMPILE_PATH
--
-- INSTALLED = false
-- if vim.fn.empty(vim.fn.glob(INSTALL_PATH)) == 0 then
-- 	INSTALLED = true
-- end

----------------------------------------------------------------------------
-- Debugpy installed info
----------------------------------------------------------------------------
-- local debugpy_path = os.getenv("HOME") .. "/.local/share/" .. MY_VIM .. "/mason/packages/debugpy/"
-- -- DEBUGPY = "~/.virtualenvs/debugpy/bin/python"
-- if IsFileExist(debugpy_path) then
-- 	DEBUGPY = debugpy_path
-- end
-- vim.g.debugpy = DEBUGPY

-- Your own custom vscode style snippets
-- SNIPPETS_PATH = { CONFIG_DIR .. "/my-snippets/snippets" }

-----------------------------------------------------------
-- Python environment
-----------------------------------------------------------
PYTHON_BINARY = nvim_config["python"]["binary"]

-----------------------------------------------------------
-- Neovim global options
-----------------------------------------------------------
vim.g.python3_host_prog = nvim_config["python"]["binary"]
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

set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.relativenumber = true -- show relative line number

-- Disable line wrap
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = false
-- vim.wo.wrap = false -- don't automatically wrap on load
