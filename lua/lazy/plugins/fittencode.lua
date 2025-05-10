-- ===
-- === 一个ai编程助手
-- ===

return {
  'luozhiya/fittencode.nvim',
  config = function()
	require('fittencode').setup({
		-- completion_mode ='source',
		keymaps = {
			inline = {
				['<S-CR>'] = 'accept_all_suggestions', -- 接受所有建议
				-- ['<C-i>'] = 'accept_line', -- 接受当前行
				['<C-i>'] = 'accept_word', -- 接受当前单词
				-- ['<C-n>'] = 'revoke_line', -- 撤销当前行
				['<C-n>'] = 'revoke_word', -- 撤销当前单词
				['<c-\\>'] = 'triggering_completion', -- 触发补全
			},
		},
	})
  end,
}

