local M = {}

-- local ensure_packer = function(install_path)
local function ensure_packer(install_path)
	local fn = vim.fn
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

M.setup = function(package_root, install_path, compile_path, plugins)
	-- true if packer was just installed
	local packer_bootstrap = ensure_packer(intall_path)

    require("packer").init({
        display = {
            show_all_info = true,
        },
        -- The default print log level. One of: "trace", 
        -- "debug", "info", "warn", "error", "fatal".
        log = { level = 'debug' }, 
        -- Remove disabled or unused plugins without 
        -- prompting the user
        autoremove = false, 
    })

	require("packer").startup({
        function(use)
            plugins.load(use)
        end,
		config = {
            package_root = package_root,
            compile_path = compile_path,
        },
    })

	if packer_bootstrap then
		require("packer").sync()
	end
end

return M
