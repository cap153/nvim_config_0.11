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
	-- Neovim的任务运行器和作业管理插件
	require("lazy.plugins.overseer"),
	-- 运行代码
	require("lazy.plugins.coderunner"),
	-- 自动补全插件
	require("lazy.plugins.blinkcmp"),
	-- lsp配置，全局的错误和警告提示，修复建议，重命名变量，格式化代码等等
	require("lazy.plugins.lspconfig"),
	-- neovim中调试代码debug dap
	require("lazy.plugins.dap"),
	-- 格式化代码
	require("lazy.plugins.formatter"),
	-- command line浮动弹窗noice
	require("lazy.plugins.cmdline"),
	-- 代码函数名称浏览时固定
	require("lazy.plugins.stickyScroll"),
	-- fold折叠，根据treesitter来折叠，可以兼容我设置的<leader>o快捷键
	require("lazy.plugins.fold"),
	-- 缩进彩虹和高亮
	require("lazy.plugins.indentrainbow"),
	-- rainbow彩虹括号
	require("lazy.plugins.rainbowbracket"),
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
	-- treesitter语法高亮，nvim-treesitter-refactor高亮当前单词的定义和其他引用、高亮当前作用域
	require("lazy.plugins.treesitter"),
	-- illuminate高亮当前单词的定义和其他引用，g=和g-在它们之间跳转
	require("lazy.plugins.illuminate"),
	-- tabular，使用:Tab /=来格式化等号之类,特殊符号要转义如:Tabularize /\/
	require("lazy.plugins.tabular"),
	-- surround,各种对字符的包裹{} [] ''
	require("lazy.plugins.surround"),
	-- pairs对字符括号自动补全另一半
	require("lazy.plugins.pairs"),
	-- flutter
	require("lazy.plugins.flutter"),
	-- 透明
	require("lazy.plugins.transprent"),
	-- 主题 themes
	require("lazy.plugins.themes"),
	-- 顶部标签页，文件缓冲区
	require("lazy.plugins.topbar"),
	-- 底部状态栏
	require("lazy.plugins.bottombar"),
	-- 注释插件
	require("lazy.plugins.comment"),
	-- explorer tree 文件列表，现在已使用yazi
	require("lazy.plugins.filemanager"),
	-- crtl+g快捷键在neovim中启动lazygit
	require("lazy.plugins.lazygit"),
	-- fzf/skim/television模糊查找
	require("lazy.plugins.television"),
	-- telescope模糊查找
	require("lazy.plugins.telescope"),
	-- 代码雨插件
	require("lazy.plugins.fun"),
	-- 呈现颜色值颜色
	require("lazy.plugins.color"),
	-- sudo write
	require("lazy.plugins.suda"),
	-- 多光标
	require("lazy.plugins.multicursor"),
	-- which-key使用多个字母快捷键停留时会提示
	require("lazy.plugins.whichkey"),
	-- 顶部的winbar,可以鼠标点击,<scace>;选择，`[c`可以跳转到上下文开头,`]c`选择同级上下文
	require("lazy.plugins.winbar"),
	-- 用Neovim打开kitty滚动缓冲
	require("lazy.plugins.kittyscroll"),
	-- 在浏览器中查看markdown preview
	require("lazy.plugins.markdownpreview"),
	-- jump使用flash.nvim插件实现
	-- require("lazy.plugins.jump"),
	-- 免费大语言模型 (LLM) 支持
	-- require("lazy.plugins.llm"),
	-- ai编程助手Fitten Code
	-- require("lazy.plugins.fittencode"),
	-- 像cursor一样使用neovim
	-- require("lazy.plugins.avante"),
	-- mcp server插件
	-- require("lazy.plugins.mcphub"),
	-- 用于改进在 Neovim 中查看 Markdown 文件的插件
	-- require("lazy.plugins.markview"),
	-- require("lazy.plugins.render-markdown"),
})
