local lspservers = {
  "lua_ls",
  "tsserver",
  "eslint",
  "jsonls",
  "tailwindcss",
  "docker_compose_language_service"
}

return {
  {
      "williamboman/mason.nvim",
      config = function()
          require("mason").setup()
      end,
  },
  {
      "williamboman/mason-lspconfig.nvim",
      config = function()
          require("mason-lspconfig").setup({
              ensure_installed = lspservers,
          })
      end,
  },
  {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local lspconfig = require("lspconfig")

          lspconfig.lua_ls.setup({ capabilities = capabilities })
          lspconfig.tsserver.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                  client.server_capabilities.documentFormattingProvider = false
              end,
          })
          lspconfig.eslint.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                  client.server_capabilities.documentFormattingProvider = false
              end,
          })
          lspconfig.jsonls.setup({ capabilities = capabilities })
          lspconfig.tailwindcss.setup({ capabilities = capabilities })
          lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
          vim.keymap.set("n", "K", vim.lsp.buf.hover)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
          vim.keymap.set("n", "<leader>fo", function()
              vim.lsp.buf.format({
                  async = true,
              })
          end, { desc = "Format Buffer" })
      end,
  },
}
