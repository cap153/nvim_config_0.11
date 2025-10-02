return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").clear_prefix("BufferLine")
		require("transparent").clear_prefix("lualine")
		-- require("transparent").clear_prefix("NeoTree")
		-- require("transparent").clear_prefix("Lsp")
		-- require("transparent").clear_prefix("Noice")
		-- require("transparent").clear_prefix("Saga")
		-- require("transparent").clear_prefix("Float")
		-- require("transparent").clear("HoverBorder")
		-- require("transparent").clear("Pmenu")
		-- require("transparent").clear("NotifyBackground")
	end,
}
