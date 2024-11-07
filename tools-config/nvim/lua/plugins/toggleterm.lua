return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

		---@diagnostic disable-next-line: lowercase-global
		function _lazydocker_toggle()
			lazydocker:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>d",
			"<cmd>lua _lazydocker_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Lazydocker" }
		)
	end,
}
