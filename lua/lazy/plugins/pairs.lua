-- ===
-- === 智能退格，自动删除行首和行尾只有空格的整行
-- ===

-- 创建一个 autocmd 组，防止重复加载
-- local smartBackspaceGroup = vim.api.nvim_create_augroup("SmartBackspace", { clear = true })

-- 定义要应用此功能的文件类型
-- 你可以根据自己的需要随意添加或删除，例如 "python", "html", "css" 等
-- local filetypes = {
-- 	"lua",
-- 	"python",
-- 	"rust",
-- }

-- 核心函数 (这部分不变)
-- local function smart_backspace()
--   local line = vim.api.nvim_get_current_line()
-- 	-- 行首和行尾只有tab和空格的情况
-- 	if line:match('^%s+$') then
--     return '<Esc>ddkA'
--   else
--     return '<BS>'
--   end
-- end

-- 创建自动命令 (这里是修改重点)
-- vim.api.nvim_create_autocmd('FileType', {
--   group = smartBackspaceGroup,
--   pattern = filetypes,
--   callback = function()
--     -- 使用 vim.defer_fn 来延迟设置映射
--     vim.defer_fn(function()
--       vim.keymap.set('i', '<BS>', smart_backspace, {
--         expr = true,
--         buffer = true,
--         silent = true,
--         noremap = true,
--       })
--     end, 1000) -- 延迟 1000 毫秒，通常足够了
--   end,
-- })

return {
	'windwp/nvim-autopairs',
	config = function()
		require('nvim-autopairs').setup({
			-- 在写markdown时禁用括号补全
			disable_filetype = {"markdown"},
			-- can use treesitter to check for a pair.
			check_ts = true,
		})
	end
}
