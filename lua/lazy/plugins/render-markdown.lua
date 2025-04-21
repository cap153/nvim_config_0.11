return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
  cond = function()
    return vim.bo.filetype ~= "kitty-scrollback"
  end,
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		sign = { enabled = false },
	},
}
