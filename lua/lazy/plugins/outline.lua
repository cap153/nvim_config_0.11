-- ===
-- === outlines,大纲,函数变量结构
-- ===
return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>v", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			position = "left",
			width = 20,
		},
		keymaps = {
			show_help = "?",
			close = { "<Esc>", "q" },
			-- Jump to symbol under cursor.
			-- It can auto close the outline window when triggered, see
			-- 'auto_close' option above.
			goto_location = "<Cr>",
			-- Jump to symbol under cursor but keep focus on outline window.
			peek_location = "o",
			-- Visit location in code and close outline immediately
			goto_and_close = "<S-Cr>",
			-- Change cursor position of outline window to match current location in code.
			-- 'Opposite' of goto/peek_location.
			restore_location = "<C-g>",
			-- Open LSP/provider-dependent symbol hover information
			hover_symbol = "<C-space>",
			-- Preview location code of the symbol under cursor
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
			-- These fold actions are collapsing tree nodes, not code folding
			fold = "n",
			unfold = "i",
			fold_toggle = "<Tab>",
			-- Toggle folds for all nodes.
			-- If at least one node is folded, this action will fold all nodes.
			-- If all nodes are folded, this action will unfold all nodes.
			fold_toggle_all = "<S-Tab>",
			fold_all = "N",
			unfold_all = "I",
			fold_reset = "R",
			-- Move down/up by one line and peek_location immediately.
			-- You can also use outline_window.auto_jump=true to do this for any
			-- j/k/<down>/<up>.
			down_and_jump = "<C-e>",
			up_and_jump = "<C-u>",
		},
	},
}
