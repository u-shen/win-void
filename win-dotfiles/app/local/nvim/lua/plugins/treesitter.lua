-----------------------------------------------------------
-- Editor
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- nvim-treesitter
	-----------------------------------------------------------
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				-- 'base',
				"lua",
				"luadoc",
				"query",
				"c",
				"cpp",
				"markdown",
				"markdown_inline",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"gitattributes",
				"diff",
				"vim",
				"vimdoc",
				"regex",
				"bash",
				"powershell",
				"toml",
				"xml",
				"yaml",
				"ssh_config",
				"zathurarc",
				"jq",
				"json",
				"json5",
				"printf",
				"ini",
				"nu",
				-- 'fullstack'
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"prisma",
				"scss",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			context_commentstring = { enable = true, enable_autocmd = true },
			matchup = { enable = true, include_match_words = true, enable_quotes = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-----------------------------------------------------------
	-- treesj
	-----------------------------------------------------------
	{
		"Wansmer/treesj",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = { max_join_length = 150 },
		keys = {
			{
				"<leader>t",
				function()
					return require("treesj").toggle()
				end,
				desc = "Toggle node under cursor",
			},
			{
				"<leader>j",
				function()
					return require("treesj").join()
				end,
				desc = "Join node under cursor",
			},
			{
				"<leader>k",
				function()
					return require("treesj").split()
				end,
				desc = "Split node under cursor",
			},
		},
	},

	-----------------------------------------------------------
	-- nvim-ts-autotag
	-----------------------------------------------------------
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-----------------------------------------------------------
	-- rainbow-delimiters.nvim
	-----------------------------------------------------------
	{
		"hiphish/rainbow-delimiters.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
	}
}
