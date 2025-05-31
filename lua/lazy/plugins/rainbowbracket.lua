-- ===
-- === rainbow，彩虹括号，必须要保证安装了treesitter,我分开是为了方便通过文件查找配置
-- ===

return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				"RainbowDelimiterBlue",
				"RainbowDelimiterViolet",
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterGreen",
				"RainbowDelimiterOrange",
				"RainbowDelimiterCyan",
			},
		})
	end,
}
