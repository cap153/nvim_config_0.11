-- ===
-- === 一个ai编程助手，号称是最快的copilot
-- ===
return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<S-CR>",
				clear_suggestion = "<C-n>",
				accept_word = "<C-i>",
			},
		})
	end
}
