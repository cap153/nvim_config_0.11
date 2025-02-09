return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = { "BufWritePre" },
	-- Customize or remove this keymap to your liking
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "格式化代码",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
		},
	},
	config = function(_, opts)
		-- 初始化 mason.nvim
		require("mason").setup()

		-- 辅助函数：从 formatters_by_ft 中提取所有工具名称（去重）
		local function get_ensure_installed(ft_table)
			local tools = {}
			for _, cfg in pairs(ft_table) do
				if type(cfg) == "table" then
					for _, item in ipairs(cfg) do
						if type(item) == "string" then
							tools[item] = true
						end
					end
				elseif type(cfg) == "string" then
					tools[cfg] = true
				end
			end
			local list = {}
			for tool, _ in pairs(tools) do
				table.insert(list, tool)
			end
			return list
		end

		local ensure_installed = get_ensure_installed(opts.formatters_by_ft)

		-- 利用 mason 的注册中心自动安装缺失的工具
		local registry = require("mason-registry")
		for _, tool in ipairs(ensure_installed) do
			if not registry.is_installed(tool) then
				vim.notify("Installing formatter: " .. tool, vim.log.levels.INFO)
				registry.get_package(tool):install()
			end
		end

		-- 最后调用 conform.nvim 的 setup，使用传入的 opts
		require("conform").setup(opts)
	end,
}
