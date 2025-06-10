-- ===
-- ===  运行代码
-- ===

-- 定义一个映射表，key 是文件类型(或包含多个类型的 table)，value 是要绑定的命令
-- 可以通过`echo &filetype`或者`lua= vim.bo.filetype`或者`lua print(vim.bo.filetype)`来获取当前打开文件的文件类型
local keymaps = {
	[{
		"rust",
		"python",
	}] = { cmd = ":wall<cr>:RunCode<cr>", desc = "Save and Run Code" },
	markdown = { cmd = ":PeekClose<cr>:PeekOpen<cr>", desc = "Reload Markdown Preview" },
	dart = { cmd = ":wall<cr>:Telescope flutter commands<cr>", desc = "Save and Open Flutter Commands" },
	go = { cmd = ":wall<cr>:set splitbelow<cr>:sp<cr>:term go run %<cr>", desc = "Save and Run Go file" },
}
-- 创建自动命令组
local ft_group = vim.api.nvim_create_augroup("FileTypeKeymaps", { clear = true })
-- 遍历上面的表，为每个条目创建自动命令
for filetype, mapping in pairs(keymaps) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		group = ft_group,
		callback = function(args)
			vim.keymap.set("n", "r", mapping.cmd, {
				noremap = true,
				silent = true,
				buffer = args.buf,
				desc = mapping.desc,
			})
		end,
	})
end

return {
	"CRAG666/code_runner.nvim",
	dependencies = {},
	config = function()
		require("code_runner").setup({
			-- project = {
			-- 	["~/sixsixsix"] = {
			-- 		name = "sixsixsix",
			-- 		description = "六爻网页排盘",
			-- 		command = "cargo run --release"
			-- 	},
			-- },
			filetype = {
				python = "uv run $fileName",
				rust = {
					"cargo run",
					-- "cd $dir &&",
					-- "rustc $fileName &&",
					-- "$dir/$fileNameWithoutExt",
				},
				-- typescript = "deno run",
				-- java = {
				-- 	"cd $dir &&",
				-- 	"javac $fileName &&",
				-- 	"java $fileNameWithoutExt",
				-- },
				-- c = function(...)
				-- 	c_base = {
				-- 		"cd $dir &&",
				-- 		"gcc $fileName -o",
				-- 		"/tmp/$fileNameWithoutExt",
				-- 	}
				-- 	local c_exec = {
				-- 		"&& /tmp/$fileNameWithoutExt &&",
				-- 		"rm /tmp/$fileNameWithoutExt",
				-- 	}
				-- 	vim.ui.input({ prompt = "Add more args:" }, function(input)
				-- 		c_base[4] = input
				-- 		vim.print(vim.tbl_extend("force", c_base, c_exec))
				-- 		require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
				-- 	end)
				-- end,
			},
		})
	end,
}
