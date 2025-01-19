return {
	"kraftwerk28/gtranslate.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		vim.api.nvim_set_keymap('n', 'tr', "viw:'<,'>Translate<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap('v', 'tr', ":'<,'>Translate<CR>", { noremap = true, silent = true })
		require("gtranslate").setup {
			default_to_language = "Chinese_Simplified",
		}
	end
}

-- return{
-- 	"JuanZoran/Trans.nvim",
-- 	build = function () require'Trans'.install() end,
-- 	keys = {
-- 		-- 可以换成其他你想映射的键
-- 		{ 'tr', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = '󰊿 Translate' },
-- 		{ 'tk', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' Auto Play' },
-- 		-- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
-- 		{ 'ti', '<Cmd>TranslateInput<CR>', desc = '󰊿 Translate From Input' },
-- 	},
-- 	dependencies = { 'kkharji/sqlite.lua', },
-- 	opts = {
--     dir = os.getenv 'HOME' .. '/.vim/dict',
--     theme    = 'dracula', -- default | tokyonight | dracula
--     frontend = {
-- 			hover = {
-- 				keymaps = {
-- 					pageup       = '<C-u>',
-- 					pagedown     = '<C-e>',
-- 					pin          = '<leader>[',
-- 					close        = '<leader>]',
-- 					toggle_entry = '<leader>;',
-- 				}
-- 			}
--     }
-- 	}
-- }
