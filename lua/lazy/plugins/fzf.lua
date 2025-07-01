return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- ctrl+t打开文件查找
		vim.keymap.set('n', '<c-t>', '<cmd>FzfLua files<cr>', {})
		-- ctrl+f打开字符串查找
		vim.keymap.set('n', '<c-f>', '<cmd>FzfLua grep<cr>', {})
		require("fzf-lua").setup({
			fzf_bin = "sk",
			keymap = {
				fzf = {
					-- fzf '--bind=' options
					-- true,        -- uncomment to inherit all the below in your custom config
					["ctrl-e"] = "down",
					["ctrl-u"] = "up",
					-- Only valid with fzf previewers (bat/cat/git/etc)
					-- ["shift-down"] = "preview-page-down",
					-- ["shift-up"] = "preview-page-up",
				},
			},
		})
	end,
}
