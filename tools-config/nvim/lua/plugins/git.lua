return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function ()
            require("gitsigns").setup()
        end,
        keys = {
            {"<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Git preview hunk"}
        }
    }
}
