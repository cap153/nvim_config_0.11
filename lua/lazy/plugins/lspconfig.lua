return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "saghen/blink.cmp" },
		{ "williamboman/mason.nvim" },
		{
			"MysticalDevil/inlay-hints.nvim",
			event = "LspAttach",
			config = function()
				require("inlay-hints").setup()
			end,
		},
	},
	config = function()
		-- 打算启用的语言服务列表
		local servers = {
			markdown = { "marksman" }, -- 任意标题<space>aw打开code action可以开头生成目录；超链接可以链接到同一个git项目的其他markdown文件#指定标题<space>h可以预览
			lua = { "lua_ls", "lua-language-server" }, -- Mason对应的安装名称是lua-language-server
			rust = { "rust_analyzer", "rust-analyzer" },
			python = { "pylsp", "python-lsp-server" },
			-- golang={'gopls'},
		}
		vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)         -- <space>h显示提示文档
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- gd跳转到定义的位置
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)      -- go跳转到变量类型定义的位置
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)           -- gr跳转到引用了对应变量或函数的位置
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- <space>rn变量重命名
		vim.keymap.set("n", "<leader>aw", vim.lsp.buf.code_action, opts)  -- <space>aw可以在出现警告或错误的地方打开建议的修复方法
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- <space>d浮动窗口显示所在行警告或错误信息
		vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts)  -- <space>-跳转到上一处警告或错误的地方
		vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts)  -- <space>+跳转到下一处警告或错误的地方
		-- vim.keymap.set({ 'n', 'x' }, '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts) -- <space>f进行代码格式化

		-- 通过mason来自动安装语言服务器，可以在对应的代码运行LspIstall来安装可用的语言服务器
		require("mason").setup({})
		local mr = require("mason-registry")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- cmp相关配置
		local lspconfig = require("lspconfig")
		for lang_group_name, server_names_arr in pairs(servers) do
			-- 使用Mason批量安装语言服务器
			local mason_name = server_names_arr[2] or server_names_arr[1] -- Second for Mason, or fallback to first
			local p = mr.get_package(mason_name)
			if p then -- Check if package actually exists in mason-registry
				if not p:is_installed() then
					vim.notify(
						"Installing Mason package: " .. mason_name .. " (for language: " .. lang_group_name .. ")",
						vim.log.levels.INFO
					)
					p:install() -- This is synchronous
					vim.notify(mason_name .. " installed successfully.", vim.log.levels.INFO)
				end
			else
				vim.notify("Mason package not found: " .. mason_name, vim.log.levels.WARN)
			end

			-- 批量激活语言服务
			local lsp = server_names_arr[1] -- First element is for lspconfig
			lspconfig[lsp].setup({
				capabilities = capabilities, -- Use the memoized capabilities
				settings = {
					["gopls"] = {
						hints = { -- gopls开启hints
							rangeVariableTypes = true,
							parameterNames = true,
							constantValues = true,
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							functionTypeParameters = true,
						},
					},
					["Lua"] = {
						hint = { -- Lua开启hints
							enable = true, -- necessary
						},
						diagnostics = {
							-- 忽略掉vim配置时一些全局变量语言服务器找不到的警告
							globals = {
								"vim",
								"require",
								"opts",
							},
						},
					},
				},
			})
		end
	end,
}
