-- ===
-- === explorer tree 文件列表 
-- ===

return {
	"mikavilpas/yazi.nvim", -- 使用yazi替代joshuto和ranger,仍然使用fm-nvim来启动lazygit
	event = "VeryLazy",
	keys = {
		{ "tt", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
	},
	config = function()
	end
}
