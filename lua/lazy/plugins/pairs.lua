return {
	'windwp/nvim-autopairs',
	config = function()
		require('nvim-autopairs').setup({
			-- 在写markdown时禁用括号补全
			disable_filetype = {"markdown"},
			--  can use treesitter to check for a pair.
			check_ts = true,
		})
	end
}
