return {
	"jake-stewart/multicursor.nvim",
	event = "VeryLazy",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()
		local set = vim.keymap.set
		-- 在主光标上方/下方添加或跳过光标。
		set({ "n", "v" }, "<c-up>",
			function() mc.lineAddCursor(-1) end)
		set({ "n", "v" }, "<c-down>",
			function() mc.lineAddCursor(1) end)
		set({ "n", "v" }, "<leader><up>",
			function() mc.lineSkipCursor(-1) end)
		set({ "n", "v" }, "<leader><down>",
			function() mc.lineSkipCursor(1) end)
		-- 主光标在多光标之间移动。
		set({ "n", "v" }, "<c-left>", mc.nextCursor)
		set({ "n", "v" }, "<c-right>", mc.prevCursor)
		-- 通过匹配单词/选择来添加或跳过添加新光标
		set({ "n", "v" }, "<c-k>",
			function() mc.matchAddCursor(1) end)
		set({ "n", "v" }, "<leader>k",
			function() mc.matchSkipCursor(1) end)
		set({ "n", "v" }, "<c-s-k>",
			function() mc.matchAddCursor(-1) end)
		set({ "n", "v" }, "<leader>K",
			function() mc.matchSkipCursor(-1) end)
		-- 使用 Control + 左键单击添加和删除光标。
		set("n", "<c-leftmouse>", mc.handleMouse)
		-- 使用主光标添加和删除光标的简单方法。
		set({ "n", "v" }, "<leader>m", mc.toggleCursor)
		-- 通过正则表达式匹配视觉选择中的新光标。
		set("v", "<leader>m", mc.matchCursors)
		-- 启用/禁用多光标。
		set("n", "<esc>", function()
			if not mc.cursorsEnabled() then
				mc.enableCursors()
			elseif mc.hasCursors() then
				mc.clearCursors()
			else
				-- Default <esc> handler.
			end
		end)
	end
}
