return {
	"cap153/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup({
			port = 9000,
			-- app = { "firefox-esr", "-private-window" },
			app = { "google-chrome-stable", "--app=http://localhost:9000/?theme=dark", "--incognito" },
		})
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
