-----------------------------------------------------------
-- Dashboard alpha-nvim
-----------------------------------------------------------
return {
	"goolord/alpha-nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[																											]],
			[[																											]],
			[[																											]],
			[[																											]],
			[[																											]],
			[[																											]],
			[[																											]],
			[[											 ▄ ▄														]],
			[[									 ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄							]],
			[[									 █ ▄ █▄█ ▄▄▄ █ █▄█ █ █							]],
			[[								▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █							]],
			[[							▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄						]],
			[[							█▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄					]],
			[[						▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █					]],
			[[						█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █					]],
			[[								█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█							]],
			[[																											]],
			[[																											]],
			[[																											]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("n", "   New Files", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰮗   Find Files", ":lua require('telescope.builtin').find_files({})<CR>"),
			dashboard.button("r", "   Recent Files", ":lua require('telescope.builtin').oldfiles({})<CR><CR>"),
			dashboard.button("e", "   File Explorer", ":Oil<CR>"),
			dashboard.button("R", "󱘞   Ripgrep", ":lua require('telescope.builtin').live_grep({})<CR><CR>"),
			dashboard.button("u", "   Update Plugins", ":Lazy update<CR>"),
			dashboard.button("m", "   Manage Extensions", ":Mason<CR>"),
			dashboard.button("l", "󰒲   Lazy Plugins", ":Lazy<CR>"),
			dashboard.button("c", "   Configuration", ":e ~/AppData/Local/nvim/init.lua<CR>"),
			dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
		}
		-- NOTE: Send the config to alpha
		alpha.setup(dashboard.opts)
	end,
}
