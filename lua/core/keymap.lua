-- ===
-- === map function
-- ===

local function mapkey(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local function mapcmd(key, cmd)
	vim.keymap.set("n", key, ":" .. cmd .. "<cr>", { noremap = true })
end

local function maplua(key, txt)
	vim.api.nvim_set_keymap("n", key, ":lua " .. txt .. "<cr>", { noremap = true })
end

-- ===
-- === Basic Mappings
-- ===

-- leader键设置为空格,; as :
vim.g.mapleader = " "
mapkey("", ";", ":")

-- 上/下一个搜索结果以及取消搜索结果高亮
mapkey("", "=", "nzz")
mapkey("", "-", "Nzz")
mapcmd("<leader><cr>", "nohlsearch")

-- 保存和退出
mapkey("", "S", ":wall<cr>")
mapkey("", "Q", ":qall<cr>")

-- 撤销与反撤销
mapkey("", "l", "u")
mapkey("", "L", "<c-r>")

-- 插入
mapkey("", "k", "i")
mapkey("", "K", "I")

mapkey('n', '<C-n>', '<C-o>')

-- 折叠
mapkey("", "<leader>o", "za")
mapkey("x", "<leader>o", "zf")
-- 读取保存的折叠
-- mapkey("", "<leader>a", ":loadview<cr>")


-- 以下两个映射默认了
-- make Y to copy till the end of the line
-- mapkey('','Y','y$')

-- make D to delete till the end of the line
-- mapkey('','D','d$')

-- 打开lazygit,已用fm-nvim插件
-- mapcmd('<c-g>',':tabe<CR>:-tabmove<CR>:term lazygit')

-- ===
-- === Cursor Movement
-- ===
-- New cursor movement (the default arrow keys are used for resizing windows)

--     ^
--     u
-- < n   i >
--     e
--     v

mapkey("", "n", "h")
mapkey("", "u", "k")
mapkey("", "e", "j")
mapkey("", "i", "l")

-- 更快的导航
mapkey("", "U", "5k")
mapkey("", "E", "5j")
mapkey("", "N", "0")
mapkey("", "I", "$")
-- 向下滚动半页，<C-u>默认向上滚动半页
mapkey("", "<C-e>", "<C-d>")

-- 更快的行导航
mapkey("", "W", "5W")
mapkey("", "B", "5B")

-- ===
-- === Window management
-- ===

-- Disable the default s key
mapkey("", "s", "<nop>")

-- 使用<space> + 新方向键 在分屏之间移动
mapkey("", "<LEADER>w", "<C-w>w")
mapkey("", "<LEADER>u", "<C-w>k")
mapkey("", "<LEADER>e", "<C-w>j")
mapkey("", "<LEADER>n", "<C-w>h")
mapkey("", "<LEADER>i", "<C-w>l")

-- 使用s + 新方向键 进行分屏
mapcmd("su", "set nosplitbelow<CR>:split<CR>:set splitbelow")
mapcmd("se", "set splitbelow<CR>:split")
mapcmd("sn", "set nosplitright<CR>:vsplit<CR>:set splitright")
mapcmd("si", "set splitright<CR>:vsplit")

-- 使用方向键来调整窗口大小
mapcmd("<up>", "res +5")
mapcmd("<down>", "res -5")
mapcmd("<left>", "vertical resize-5")
mapcmd("<right>", "vertical resize+5")

-- 使分屏窗口上下分布
mapkey("", "sh", "<C-w>t<C-w>K")
-- 使分屏窗口左右分布
mapkey("", "sv", "<C-w>t<C-w>H")

-- 按 <SPACE> + q 关闭当前窗口下方的窗口
mapkey("", "<LEADER>q", "<C-w>j:q<CR>")

-- ===
-- === Tab management
-- ===

-- tu创建新标签,已用bufferline.nvim替代
-- mapcmd("tu", "tabe")
-- 在标签之间移动
-- mapcmd('tn','-tabnext')
-- mapcmd('ti','+tabnext')

-- 移动标签的位置
-- mapcmd('tmn','-tabmove')
-- mapcmd('tmi','+tabmove')

-- 关闭当前标签,已用close-buffers替代
-- mapcmd('tq','tabc')

-- ===
-- === 批量缩进方法
-- ===
-- 操作为，esc从编辑模式退到命令模式，将光标移到需要缩进的行的行首，然后按shift+v，可以看到该行已被选中，且左下角提示为“可视”
-- 按键盘上的上下方向键，如这里按向下的箭头，选中所有需要批量缩进的行
-- 按shift+>,是向前缩进一个tab值，按shift+<，则是缩回一个tab值

mapkey("x", "<", "<gv")
mapkey("x", ">", ">gv")
mapkey("x", "<s-tab>", "<gv")
mapkey("x", "<tab>", ">gv")

-- ===
-- === 批量替换
-- ===

-- 设置快捷键，替换所有文件内容
mapcmd("<leader>sa", "lua search_and_replace()")
-- 设置快捷键，替换当前文件内容
mapcmd("<leader>sr", "lua search_and_replace_current_file()")

-- 替换当前目录及子目录下所有文件内容
function search_and_replace()
	-- 获取用户输入的查找内容,使用 input() 函数动态输入替换内容
	local search_text = vim.fn.input("Search for: ")

	-- 获取用户输入的替换内容
	local replace_text = vim.fn.input("Replace with: ")

	-- 执行替换命令
	if search_text ~= "" and replace_text ~= "" then
		local cmd = 'execute "!grep -rl \\"'
				.. search_text
				.. '\\" ./ | xargs sed -i \\"s/'
				.. search_text
				.. "/"
				.. replace_text
				.. '/g\\""'
		vim.cmd(cmd)
		print("Replaced all occurrences of '" .. search_text .. "' with '" .. replace_text .. "'")
	else
		print("Search or replace text cannot be empty.")
	end
end

-- 替换当前文件内容
function search_and_replace_current_file()
	-- 获取用户输入的查找内容
	local search_text = vim.fn.input("Search for in current file: ")

	-- 获取用户输入的替换内容
	local replace_text = vim.fn.input("Replace with: ")

	-- 执行替换命令
	if search_text ~= "" and replace_text ~= "" then
		-- 使用 sed 替换当前文件中的匹配内容，并正确转义引号
		local cmd = string.format("!sed -i 's/%s/%s/g' %%", search_text, replace_text)
		vim.cmd(cmd)
		print("Replaced all occurrences of '" .. search_text .. "' with '" .. replace_text .. "' in current file.")
	else
		print("Search or replace text cannot be empty.")
	end
end

-- ===
-- === 临时“存档”文件当前的版本，并与后续的修改进行 diff 对比
-- ===

-- 创建 :DiffOrig 自定义命令，这个命令会打开一个垂直分屏，加载当前文件存盘时的版本，并启动 diff 模式
vim.api.nvim_create_user_command(
	'DiffOrig',
	function()
		-- 在创建新窗口前，先保存当前文件的 filetype
		local original_filetype = vim.bo.filetype
		-- 打开一个垂直分屏，并准备好临时缓冲区
		vim.cmd('vert new | set buftype=nofile')
		-- 在新的临时缓冲区里，设置我们刚才保存的 filetype，这是确保语法高亮的关键！
		vim.bo.filetype = original_filetype
		-- 读取原始文件的磁盘内容，并启动 diff
		vim.cmd('read ++edit # | 0d_ | diffthis | wincmd p | diffthis')
	end,
	{ force = true }
)
-- <leader>dd 将会执行 :DiffOrig 命令
mapcmd('<leader>dd', 'DiffOrig')

-- ===
-- === Other useful stuff
-- ===

-- 打开一个终端窗口
mapcmd("<LEADER>/", "set splitbelow<CR>:split<CR>:res +10<CR>:term")

-- 按两下空格跳转到占位符<++>,并进入插入模式
mapkey("", "<LEADER><LEADER>", "<Esc>/<++><CR>:nohlsearch<CR>c4l")

-- 拼写检查
mapcmd("<LEADER>sc", "set spell!")

-- ===
-- ===  运行代码(该功能已经迁移到plugins/coderunner.lua)
-- ===

-- vim.cmd([[
--  au filetype dart noremap r :wall<cr>:Telescope flutter commands<cr>
--  au filetype python noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term uv run %<cr>
--  au filetype go noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term go run %<cr>
--  au filetype markdown noremap r :PeekClose<cr>:PeekOpen<cr>
--  au filetype rust noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term cargo run<cr>
-- ]])


-- ===
-- === map function external environment
-- ===

-- 下面的函数给外部文件调用的
-- 使用示例如下
-- local map = require("core.keymap")
-- map:cmd('<space>p','PasteImg')
local map = {}
function map:key(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

function map:cmd(key, cmd)
	vim.api.nvim_set_keymap("n", key, ":" .. cmd .. "<cr>", { noremap = true })
end

function map:lua(key, txt)
	vim.api.nvim_set_keymap("n", key, ":lua " .. txt .. "<cr>", { noremap = true })
end

return map
