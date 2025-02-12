return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			rust = { "rust-analyzer", lsp_format = "fallback" },
			toml = { "templ" },
		},
	},
	config = function(_, opts)
		-- 初始化 mason.nvim 和 conform.nvim
		require("mason").setup()
		require("conform").setup(opts)

		-- 辅助函数：从指定文件类型的配置中提取所有工具名称（去重）
		local function get_ensure_installed_for_ft(ft, ft_table)
			local tools = {}
			local cfg = ft_table[ft]
			if type(cfg) == "table" then
				for _, item in ipairs(cfg) do
					if type(item) == "string" then
						tools[item] = true
					end
				end
			elseif type(cfg) == "string" then
				tools[cfg] = true
			end
			local list = {}
			for tool, _ in pairs(tools) do
				table.insert(list, tool)
			end
			return list
		end

		-- 设置 <leader>f 键映射，在按下时自动检测并安装缺失的工具后格式化代码
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			local ft = vim.bo.filetype
			local tools = get_ensure_installed_for_ft(ft, opts.formatters_by_ft)
			local registry = require("mason-registry")
			for _, tool in ipairs(tools) do
				if not registry.is_installed(tool) then
					vim.notify("Installing formatter: " .. tool, vim.log.levels.INFO)
					registry.get_package(tool):install()
				end
			end
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "格式化代码（检测安装缺失工具）" })
	end,
}
