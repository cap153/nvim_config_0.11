-- ===
-- === treesitter,语法高亮
-- ===

return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- 要安装高亮的语言直接加入括号即可，把sync_install设置为true下次进入vim自动安装，
			-- 或者手动执行:TSInstall <想要安装的语言>
			-- 语言列表查看https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
			ensure_installed = {
				"json",
				"rust",
				"python",
				"lua",
				"markdown",
				"bash",
				"java",
				-- "dart",
				-- "go",
				-- "sql",
			},
			-- 设置为true后位于ensure_installed里面的语言会自动安装
			sync_install = true,
			-- 这里填写不想要自动安装的语言
			ignore_install = {
			},
			highlight = {
				-- 默认开启高亮
				enable = true,
				-- 想要禁用高亮的语言列表
				-- disable = {
				-- },
				-- 使用function以提高灵活性，禁用大型文件的高亮
				disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
								return true
						end
				end,
				-- 如果您依靠启用'语法'（例如，缩进），则将其设置为“ True”。
				-- 使用此选项可能会放慢编辑器，您可能会看到一些重复的高亮。
				-- 除了设置为true，它也可以设置成语言列表
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
