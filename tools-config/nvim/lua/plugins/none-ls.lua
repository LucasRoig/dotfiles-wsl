local formatters = { "stylua", "prettierd" }

return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = formatters,
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
            },
        })
    end,
}

