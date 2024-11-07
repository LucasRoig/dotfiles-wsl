return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
          -- ensure_installed = {"lua", "html", "javascript", "typescript", "tsx", "css", "json", "graphql",
          --                     "dockerfile", "yaml"},
          auto_install = true,
          highlight = {
              enable = true
          },
          indent = {
              enable = true
          }
      })
  end
}
