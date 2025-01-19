-- ===
-- === flutter-tools
-- ===
return {
	'nvim-flutter/flutter-tools.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim', -- optional for vim.ui.select
		'mfussenegger/nvim-dap',
	},
	config = function()
		require("telescope").load_extension("flutter")
		require("flutter-tools").setup {
			ui = {
				border = "rounded",
				notification_style = "native",
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true, -- 轮廓窗口的缩进参考线				
				debug = true,
			},
			closing_tags = {
				highlight = "Comment",
				prefix = "// ",
				enabled = true,
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					foreground = false,
					virtual_text = false,
					virtual_text_str = "■",
				},
				settings = {
					showTodos = true,
					enableSnippets = true,
					completeFunctionCalls = false,
				},
			},
			debugger = {
				enabled = true,
				run_via_dap = false,
			},
			dev_log = {
				enabled = true,
				open_cmd = "edit", -- 用于打开日志缓冲区的命令，可以设置为"tabedit"或"split"或者"vsplit"缓冲区将在不同位置打开
			},
		} -- use defaults
	end
}

