return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"igorlfs/nvim-dap-view",
			opts = {
				switchbuf = "useopen,uselast,newtab",
				-- 开启控制栏按钮
				winbar = {
					controls = {
						enabled = true,
					},
				},
			},
		},
		{ "williamboman/mason.nvim" },
		{ "jay-babu/mason-nvim-dap.nvim" },
	},
	config = function()
		local dap, dv = require("dap"), require("dap-view")

		-- Keymappings for DAP
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
		vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate" })
		vim.keymap.set("n", "<leader>dl", function()
			require("dap").run_last()
		end, { desc = "DAP: Run Last" })
		vim.keymap.set("n", "<Leader>dp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)

		-- 自动切换和关闭
		dap.listeners.before.attach["dap-view-config"] = function()
			dv.open()
		end
		dap.listeners.before.launch["dap-view-config"] = function()
			dv.open()
		end
		dap.listeners.before.event_terminated["dap-view-config"] = function()
			dv.close()
		end
		dap.listeners.before.event_exited["dap-view-config"] = function()
			dv.close()
		end
		-- 在 nvim-dap-view 文件类型中将 q 映射为 quit
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "dap-view", "dap-view-term", "dap-repl" }, -- dap-repl is set by `nvim-dap`
			callback = function(evt)
				vim.keymap.set("n", "q", "<C-w>q", { buffer = evt.buf })
			end,
		})
		-- 如果没有窗口包含缓冲区，请创建一个新选项卡
		dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"
		dap.configurations.rust = {
			{
				name = "Launch Rust Program (GDB)",
				type = "cppdbg", -- Use the cpptools adapter
				request = "launch",
				program = function()
					-- Ask for the executable path when launching
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = false,
				MIMode = "gdb", -- Specify GDB
				miDebuggerPath = "gdb", -- Or full path to gdb if not in PATH
				-- setupCommands are executed at the beginning of the GDB session
				setupCommands = {
					{
						text = "-enable-pretty-printing",
						description = "Enable GDB pretty printing",
						ignoreFailures = false,
					},
					-- You might need to find the exact path to rust-gdb on your system
					-- It's usually in `~/.rustup/toolchains/<your-toolchain>/lib/rustlib/src/rust/etc/rust-gdb`
					-- Or system-wide if rustc was installed differently.
					-- Example: (ADJUST THIS PATH!)
					-- {
					--   text = "source ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/etc/rust-gdb",
					--   description = "Load Rust GDB extensions",
					--   ignoreFailures = true -- Set to true if the path might not always be valid
					-- }
				},
				-- If you want to pass arguments to your program:
				-- args = {"arg1", "arg2"},
			},
			-- You can add more configurations, e.g., for attaching to a running process
		}

		require("mason-nvim-dap").setup({
			ensure_installed = { "cpptools" },
			handlers = {}, -- sets up dap in the predefined manner
		})
	end,
}
