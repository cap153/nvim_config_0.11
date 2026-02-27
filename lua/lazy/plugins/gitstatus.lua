-- ===
-- === git status/git状态
-- ===

return {
	'lewis6991/gitsigns.nvim',
	build = ':TSUpdate',
	config = function()
		require('gitsigns').setup {
			on_attach = function(bufnr)
				local gitsigns = require('gitsigns')

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Navigation
				map('n', 't=', function()
					gitsigns.nav_hunk('next')
				end)
				map('n', 't-', function()
					gitsigns.nav_hunk('prev')
				end)
				-- show diff
				map('n', '<leader>hd', gitsigns.diffthis)
			end
		}
	end
}
