return {
	"alexpasmantier/tv.nvim",
	config = function()
		vim.keymap.set('n', '<c-t>', function()
			if vim.fs.root(0, '.git') then
				vim.cmd('Tv git-files')
			else
				vim.cmd('Tv files')
			end
		end, { desc = "Smart Tv: git-files or files" })
		local h = require('tv').handlers
		require("tv").setup {
			channels = {
				["git-files"] = {
					handlers = {
						["<CR>"] = h.open_as_files,
					},
				},
				files = {
					handlers = {
						["<CR>"] = h.open_as_files, -- default: open selected files
					},
				},
				-- `text`: ripgrep search through file contents
				text = {
					keybinding = '<C-f>',
					handlers = {
						['<CR>'] = h.open_at_line, -- Jump to line:col in file
					},
				},
			},
		}
	end,
}
