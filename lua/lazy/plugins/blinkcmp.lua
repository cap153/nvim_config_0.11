return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = '*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = 'none',
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			-- ['<C-e>'] = { 'hide' },
			-- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
			['<CR>'] = { 'accept', 'fallback' }, -- 'select_and_accept'会选择第一项插入
			['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
			['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },

			['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
			['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

			['<C-e>'] = { 'snippet_forward', 'fallback' },
			['<C-u>'] = { 'snippet_backward', 'fallback' },

		},
		completion = {
			-- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
			keyword = { range = 'full' },
			-- 选择补全项目时显示文档(0.5秒延迟)
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			-- 不预选第一个项目，选中后自动插入该项目文本
			list = { selection = { preselect = false, auto_insert = true } },
		},
		-- 指定文件类型启用/禁用
		enabled = function()
			return not vim.tbl_contains({
						-- "lua",
						-- "markdown"
					}, vim.bo.filetype)
					and vim.bo.buftype ~= "prompt"
					and vim.b.completion ~= false
		end,

		appearance = {
			-- 将后备高亮组设置为 nvim-cmp 的高亮组
			-- 当您的主题不支持眨眼.cmp 时很有用
			-- 将在未来版本中删除
			use_nvim_cmp_as_default = true,
			-- 将“Nerd Font Mono”设置为“mono”，将“Nerd Font”设置为“normal”
			-- 调整间距以确保图标对齐
			nerd_font_variant = 'mono'
		},

		-- 已定义启用的提供程序的默认列表，以便您可以扩展它
		sources = {
			default = { 'buffer', 'lsp', 'path', 'snippets', },
			providers = {
				-- score_offset设置优先级数字越大优先级越高
				buffer = { score_offset = 3 },
				lsp = { score_offset = 2 },
				path = { score_offset = 1 },
				snippets = { score_offset = 4 },
			}
		},
	},
	-- 由于“opts_extend”，您的配置中的其他位置无需重新定义它
	opts_extend = { "sources.default" }
}
