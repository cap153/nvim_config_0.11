return {
  'stevearc/overseer.nvim',
  opts = {},
	dependencies = {
	},
	config = function()
		require('overseer').setup()
	end
}
