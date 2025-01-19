return {
	"Kurama622/llm.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
	cmd = { "LLMSesionToggle", "LLMSelectedTextHandler" },
	config = function()
		require("llm").setup({
			prompt = "请用中文回答",
			prefix = {
				user = { text = "😃 ", hl = "Title" },
				assistant = { text = "⚡ ", hl = "Added" },
			},
			url = "http://localhost:11434/api/chat", -- your url
			model = "qwen2.5-coder:0.5b",

			streaming_handler = function(chunk, line, assistant_output, bufnr, winid, F)
				if not chunk then
					return assistant_output
				end
				local tail = chunk:sub(-1, -1)
				if tail:sub(1, 1) ~= "}" then
					line = line .. chunk
				else
					line = line .. chunk
					local status, data = pcall(vim.fn.json_decode, line)
					if not status or not data.message.content then
						return assistant_output
					end
					assistant_output = assistant_output .. data.message.content
					F.WriteContent(bufnr, winid, data.message.content)
					line = ""
				end
				return assistant_output
			end,
			keys = {
				-- The keyboard mapping for the input window.
				["Input:Submit"] = { mode = "n", key = "<s-cr>" },
			},
		})
	end,
	keys = {
		{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
		{ "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
		{ "<leader>t", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
	},
}
