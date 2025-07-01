return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local builtin = require('telescope.builtin')
		-- ctrl+t打开文件查找
		-- vim.keymap.set('n', '<c-t>', builtin.find_files, {})
		-- ctrl+f打开字符串查找
		-- vim.keymap.set('n', '<c-f>', '<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > "), only_sort_text = true, })<cr>', { noremap = true })
		-- 下面的配置从cw的配置粘贴过来的，删除一部分看不懂的
		local ts = require('telescope')
		ts.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--fixed-strings",
					"--smart-case",
					"--trim",
				},
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
				mappings = {
					i = {
						["<C-h>"] = "which_key",
						["<C-u>"] = "move_selection_previous",
						["<C-e>"] = "move_selection_next",
						["<C-l>"] = "preview_scrolling_up",
						["<C-y>"] = "preview_scrolling_down",
						["<esc>"] = "close",
					}
				},
				color_devicons = true,
				prompt_prefix = "🔍 ",
				selection_caret = " ",
				path_display = { "truncate" },
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			},
		})
	end
}

