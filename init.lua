------------------------------------------------------------------------------
-- Initial environments for Neovim
-- 初始階段
------------------------------------------------------------------------------
DEBUG = false
-- DEBUG = true

------------------------------------------------------------------------------
-- Setup Neovim Run Time Path
-- 設定 RTP ，要求 Neovim 啟動時的設定作業、執行作業，不採預設。
-- 故 my-nvim 的設定檔，可置於目錄： ~/.config/my-nvim/ 運行；
-- 執行作業（Run Time）所需使用之擴充套件（Plugins）與 LSP Servers
-- 可置於目錄： ~/.local/share/my-nvim/
------------------------------------------------------------------------------
-- Load luafile from command: nvim -u {vimrc} -c "luafile myRunTimePath.lua"

-----------------------------------------------------------
-- Global Functions
-- 為後續作業，需先載入之「共用功能（Global Functions）」。
-----------------------------------------------------------
require("globals")

-----------------------------------------------------------
-- Essential settings for Neovim
-- 初始時需有的 Neovim 基本設定
-----------------------------------------------------------
require("essential")

------------------------------------------------------------------------------
-- Configuration supportting for VS Code
-- 與 VS Code 整合作業時，應有的環境設定
------------------------------------------------------------------------------
-- 使用以下方法，皆不能正確運作：
--   if vim.fn.exists('g:vscode') then
--   if vim.fn.exists('g:vscode') == 0 then
if vim.g.vscode ~= nil then
	-----------------------------------------------------------
	-- VSCode extension"
	-----------------------------------------------------------
	-- Load plugins
	require("packer").startup(function(use)
		use("easymotion/vim-easymotion")
		use("asvetliakov/vim-easymotion")
	end)
	-- Options
	require("options")
	-- Key bindings
	require("keymaps")

	return
end

------------------------------------------------------------------------------
-- Plugins
-- 擴充套件處理
------------------------------------------------------------------------------
-- (1) 安裝擴充套件管理軟體及載入擴充套件
-- Install Plugin Manager & Plugins
-- 確保擴充套件管理器（packer.nvim）已完成安裝；以便擴充套件能正常安裝、更新。
--  ①  若擴充套件管理器：packer.nvim 尚未安裝，執行下載及安裝作業；
--  ②  透過擴充套件管理器，執行擴充套件 (plugins) 之載入／安裝作業。
------------------------------------------------------------------------------
-- (2) 載入各擴充套件之設定
-- Setup configuration of plugins
-- 對已載入之各擴充套件，進行設定作業
------------------------------------------------------------------------------
if DEBUG then
	-- (1)
	local debug_plugins = require("debug-plugins")
	require("config_debug_env").setup(debug_plugins)
	-- (2)
	require("plugins-rc")
else
	-- (1)
	require("plugins")
	-- (2)
	require("plugins-rc")
end

------------------------------------------------------------------------------
-- Configurations for Neovim
-- 設定 Neovim 的 Options
------------------------------------------------------------------------------
-- General options of Neovim
-- Neovim 執行時期，應有之預設
require("options")

-- User's specific options of Neovim
-- 使用者為個人需求，須變預設之設定
require("settings")

-----------------------------------------------------------
-- Color Themes
-- Neovim 畫面的色彩設定
-----------------------------------------------------------
require("color-themes")

-----------------------------------------------------------
-- Key bindings
-- 快捷鍵設定：操作時的按鍵設定
-----------------------------------------------------------
require("keymaps")

-----------------------------------------------------------
-- Experiments
-- 實驗用的臨時設定
-----------------------------------------------------------

-----------------------------------------------------------
-- code folding
-----------------------------------------------------------
vim.cmd([[
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=5
]])
-- For folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Say hello
local function blah()
	local nvim_config = GetConfig()
	local MY_NVIM = nvim_config["nvim"]
	print("Neovim: " .. MY_NVIM)
	print("init.lua is loaded!")
	print("====================================================================")
	print("Neovim RTP(Run Time Path ...)")
	-- P(vim.api.nvim_list_runtime_paths())
	-- PrintTable(vim.opt.runtimepath:get())
	PrintTableWithIndent(vim.opt.runtimepath:get(), 4)
	print(string.format("OS = %s", nvim_config["os"]))
	print(string.format("${workspaceFolder} = %s", vim.fn.getcwd()))
	----------------------------------------------------------------------------
	-- Debugpy installed info
	----------------------------------------------------------------------------
	-- local debugpy_path = os.getenv("HOME") .. "/.local/share/" .. MY_NVIM .. "/mason/packages/debugpy/"
	local debugpy_path = nvim_config["debugpy_path"]
	if IsFileExist(debugpy_path) then
		print("Debugpy is installed in path: " .. debugpy_path)
	else
		print("Debugpy isn't installed yet!")
	end

	-- print(string.format('$VIRTUAL_ENV = %s', os.getenv('VIRTUAL_ENV')))
	-- local util = require("utils.python")
	-- local venv = util.get_python_path_in_venv()
	local venv = nvim_config["python"]["venv"]
	print(string.format("$VIRTUAL_ENV = %s", venv))
	----------------------------------------------------------------------------
	-- configurations
	----------------------------------------------------------------------------
	print(string.format("install_path = %s", nvim_config["install_path"]))
	print("path of all snippets")
	PrintTableWithIndent(nvim_config["snippets"], 4)
	print("====================================================================")
end

blah()
