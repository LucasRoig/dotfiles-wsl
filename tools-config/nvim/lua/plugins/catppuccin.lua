return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
      flavour = "mocha",
      integrations = {
          cmp = true,
          treesitter = true,
          mason = true,
          treesitter_context = true,
          which_key = true,
          neotree = true,
      }
  },
  config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
  end
}
