local status, unit_test = pcall(require, "neotest")
if not status then
	return
end

unit_test.setup({
	adapters = {
		-- require("neotest-python")({ dap = { justMyCode = false } }),
		-- require("neotest-plenary"),
		-- require("neotest-vim-test")({ ignore_file_types = { "python", "vim", "lua" } }),
		require("neotest-python"),
	},
})
