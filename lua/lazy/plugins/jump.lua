return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		-- 下面映射可以通过<esc>取消f和t，但是会覆盖原本的退出可视模式等功能
		-- local map = vim.keymap.set
		-- map({ "n", "x", "o" }, "<esc>", function()
		-- 	local char = require("flash.plugins.char")
		-- 	if char.state then
		-- 		char.state:hide()
		-- 	end
		-- end, { desc = "Cancel Flash Char" })
		require("flash").setup({
			labels = "arstdhneioqwfpgjluyzxcvbkm",
			modes = {
				-- options used when flash is activated through
				-- a regular search with `/` or `?`
				search = {
					-- when `true`, flash will be activated during regular search by default.
					-- You can always toggle when searching with `require("flash").toggle()`
					enabled = false,
				},
			},
		})
	end,
}
