-- Plugin to show vertical lines on each scope

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup()
	end,
}
