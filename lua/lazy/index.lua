-- delete follows if lazy install faild
-- ~/.local/share/nvim
-- ~/.local/state/nvim
-- ~/.cache/nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- 启动Lazy插件管理快捷键
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true })
require("lazy").setup({
	-- 自动补全插件
	require("lazy.plugins.blinkcmp"),
	-- lsp配置，全局的错误和警告提示，修复建议，重命名变量，格式化代码等等
	require("lazy.plugins.lspconfig"),
	-- 格式化代码
	require("lazy.plugins.formatter"),
	-- ai编程助手Fitten Code
	require("lazy.plugins.fittencode"),
	-- 免费大语言模型 (LLM) 支持
	require("lazy.plugins.llm"),
	-- 顶部的winbar,可以鼠标点击
	require("lazy.plugins.winbar"),
	-- command line浮动弹窗
	require("lazy.plugins.cmdline"),
	-- 代码函数名称浏览时固定，`[c`可以跳转到上下文
	require("lazy.plugins.stickyScroll"),
	-- fold折叠，根据treesitter来折叠，可以兼容我设置的<leader>o快捷键
	require("lazy.plugins.fold"),
	-- 缩进彩虹和高亮
	require("lazy.plugins.indentrainbow"),
	-- 粘贴图片
	require("lazy.plugins.imgclip"),
	-- 图片预览
	require("lazy.plugins.snacks"),
	-- 翻译插件gtranslate
	require("lazy.plugins.translate"),
	-- git状态
	require("lazy.plugins.gitstatus"),
	-- outline大纲
	require("lazy.plugins.outline"),
	-- treesitter语法高亮
	require("lazy.plugins.treesitter"),
	-- rainbow彩虹括号
	require("lazy.plugins.rainbow"),
	-- tabular，使用:Tab /=来格式化等号之类,特使符号要转义如:Tabularize /\/
	require("lazy.plugins.tabular"),
	-- surround,各种对字符的包裹{} [] ''
	require("lazy.plugins.surround"),
	-- pairs对字符括号自动补全另一半
	require("lazy.plugins.pairs"),
	-- flutter
	require("lazy.plugins.flutter"),
	-- 用于改进在 Neovim 中查看 Markdown 文件的插件
	require("lazy.plugins.render-markdown"),
	-- 底部状态栏+主题 themes
	require("lazy.plugins.themes"),
	-- 注释插件
	require("lazy.plugins.comment"),
	-- 文件缓冲标签栏
	require("lazy.plugins.bufferline"),
	-- explorer tree 文件列表，现在已使用yazi
	require("lazy.plugins.filemanager"),
	-- crtl+g快捷键在neovim中启动lazygit
	require("lazy.plugins.lazygit"),
	-- telescope模糊查找
	require("lazy.plugins.telescope"),
	-- 代码雨插件
	require("lazy.plugins.fun"),
	-- 呈现颜色值颜色
	require("lazy.plugins.color"),
	-- sudo write
	require("lazy.plugins.suda"),
	-- jump使用flash.nvim插件实现，f单个字母时按f下一处，建议先esc退出再可视模式此时才可以继续使用f，斜杠粘贴整个单词查找的时候不好用
	require("lazy.plugins.jump"),
	-- 多光标
	require("lazy.plugins.multicursor"),
	-- which-key使用多个字母快捷键停留时会提示
	require("lazy.plugins.whichkey"),
	-- cw推荐的indent缩进线hlchunk，可以根据线条的款式来分辨缩进
	-- require("lazy.plugins.indent"),
	-- ai编程助手supermaven
	-- require("lazy.plugins.supermaven"),
	-- 自动补全插件nvim-cmp
	-- require("lazy.plugins.autocomplete").config,
})
