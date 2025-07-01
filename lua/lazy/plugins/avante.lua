return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	commit = "7dc5560",
	-- version = false, -- Never set this value to "*"! Never!
	opts = {
		behaviour = {
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		},
		provider = "openrouter",
		vendors = {
			openrouter = {
				__inherited_from = "openai",
				disable_tools = true,
				endpoint = "https://openrouter.ai/api/v1",
				api_key_name = "OPENROUTER_API_KEY",
				model = "deepseek/deepseek-chat-v3-0324:free",
			},
		},
		-- provider = "deepseek",
		-- vendors = {
		-- 	deepseek = {
		-- 		__inherited_from = "openai",
		-- 		api_key_name = "DEEPSEEK_API_KEY",
		-- 		endpoint = "https://api.deepseek.com",
		-- 		model = "deepseek-chat",
		-- 	},
		-- },
		-- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
		-- system_prompt = function()
		-- 	local hub = require("mcphub").get_hub_instance()
		-- 	return hub:get_active_servers_prompt()
		-- end,
		-- -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
		-- custom_tools = function()
		-- 	return {
		-- 		require("mcphub.extensions.avante").mcp_tool(),
		-- 	}
		-- end,
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		-- "ravitemer/mcphub.nvim",
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
}
