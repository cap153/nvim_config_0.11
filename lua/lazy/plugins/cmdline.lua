return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- 启用一个预设以简化配置
			presets = {
				bottom_search = true,     -- use a classic bottom cmdline for search
				command_palette = true,   -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,       -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false,   -- add a border to hover docs and signature help
			},
			-- 在这里添加或修改 routes 配置
			routes = {
				{
					-- 过滤翻译插件的成功提示
					filter = {
						event = "msg_show",
						find = "Translate success",
					},
					opts = { skip = true },
				},
				{
					-- 过滤打开rust文件不影响使用的错误提示
					filter = {
						event = "msg_show",
						kind = "emsg",
						-- 使用这个错误信息中稳定且独特的片段作为过滤关键词
						find = "Error in decoration provider",
					},
					-- opts.skip = true 会告诉 Noice 完全忽略这条消息
					opts = { skip = true },
				},
				-- ... 这里可能还有你其他的 routes 规则，或者没有
			},
		})
	end,
}
