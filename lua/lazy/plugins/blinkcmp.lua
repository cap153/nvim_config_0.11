return {
	"saghen/blink.cmp",
	enabled = not vim.g.vscode, -- 在vscode-neovim禁用
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		cmdline = {
			keymap = {
				-- 选择并接受预选择的第一个
				["<CR>"] = { "select_and_accept", "fallback" },
			},
			completion = {
				-- 不预选第一个项目，选中后自动插入该项目文本
				list = { selection = { preselect = false, auto_insert = true } },
				-- 自动显示补全窗口，仅在输入命令时显示菜单，而搜索或使用其他输入菜单时则不显示
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
						-- enable for inputs as well, with:
						-- or vim.fn.getcmdtype() == '@'
					end,
				},
				-- 不在当前行上显示所选项目的预览
				ghost_text = { enabled = false },
			},
		},
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			-- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
			["<CR>"] = { "accept", "fallback" }, -- 更改成'select_and_accept'会选择第一项插入
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-e>"] = { "snippet_forward", "select_next", "fallback" }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
			["<C-u>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		completion = {
			-- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
			keyword = { range = "full" },
			-- 选择补全项目时显示文档(0秒延迟)
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
			-- 不预选第一个项目，选中后自动插入该项目文本
			list = { selection = { preselect = false, auto_insert = false } },
			-- 针对菜单的外观配置
			-- menu = {
			-- 	min_width = 15,
			-- 	max_height = 10,
			-- 	border = "single", -- Defaults to `vim.o.winborder` on nvim 0.11+
			-- },
		},
		-- 指定文件类型启用/禁用
		enabled = function()
			return not vim.tbl_contains({
				-- "lua",
				-- "markdown"
			}, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,

		appearance = {
			-- 将后备高亮组设置为 nvim-cmp 的高亮组
			-- 当您的主题不支持blink.cmp 时很有用
			-- 将在未来版本中删除
			use_nvim_cmp_as_default = true,
			-- 将“Nerd Font Mono”设置为“mono”，将“Nerd Font”设置为“normal”
			-- 调整间距以确保图标对齐
			nerd_font_variant = "mono",
		},

		-- 已定义启用的提供程序的默认列表，以便您可以扩展它
		sources = {
			default = {
				"buffer",
				"lsp",
				"path",
				"snippets",
				"avante",
			},
			providers = {
				-- score_offset设置优先级数字越大优先级越高
				buffer = { score_offset = 5 },
				path = { score_offset = 3 },
				lsp = { score_offset = 2 },
				snippets = { score_offset = 1 },
				cmdline = {
					min_keyword_length = function(ctx)
						-- when typing a command, only show when the keyword is 3 characters or longer
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
							return 3
						end
						return 0
					end,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {
						-- options for blink-cmp-avante
					},
				},
			},
		},
	},
	-- 由于“opts_extend”，您的配置中的其他位置无需重新定义它
	opts_extend = { "sources.default" },
}
