return {
	"RRethy/vim-illuminate",
	config = function()
		-- 将光标移动到下一个引用
		vim.keymap.set(
			"n",
			"g=",
			"<cmd>lua require('illuminate').goto_next_reference(true)<cr>",
			{ noremap = true, silent = true, desc = "Go to next reference" }
		)
		-- 将光标移动到上一个引用
		vim.keymap.set(
			"n",
			"g-",
			"<cmd>lua require('illuminate').goto_prev_reference(true)<cr>",
			{ noremap = true, silent = true, desc = "Go to previous reference" }
		)
	end,
}
