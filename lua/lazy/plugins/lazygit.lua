-- ===
-- === 在neovim中启动lazygit
-- ===

return {
    "kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<c-g>", "<cmd>LazyGit<CR>", desc = "Toggle Lazygit" },
	},
	config = function()
	end
}
