-- ===
-- === 文件缓冲标签栏
-- ===

local map = require("core.keymap")
-- 在标签之间移动
map:cmd('tn', 'BufferLineCyclePrev')
map:cmd('ti', 'BufferLineCycleNext')

-- 移动标签的位置
map:cmd('tmn', 'BufferLineMovePrev')
map:cmd('tmi', 'BufferLineMoveNext')

-- 关闭标签，貌似是neovim自带的，完整命令bdelete
map:cmd('tq', 'bd')
return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup {
			options = {
				modified_icon = "",
				buffer_close_icon = "×",
				-- show_buffer_close_icons = false,
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 10,
				indicator = {
					style = "none",
				},
			},
		}
	end,
}
-- return {
-- 	'akinsho/bufferline.nvim',
-- 	version = "*",-- 安装最新的稳定版
-- 	dependencies = 'kyazdani42/nvim-web-devicons',
-- 	config = function()
-- 		require("bufferline").setup {}
-- 	end
-- }
