return {
  {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.6",
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
          {
              "<leader>ff",
              "<cmd>Telescope find_files<cr>",
              desc = "Find files",
          },
          {
              "<leader>fg",
              "<cmd>Telescope live_grep<cr>",
              desc = "Live grep",
          },
          {
              "<leader>fb",
              function()
                  require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
              end,
              desc = "List buffers",
          },
          {
              "<leader>fh",
              "<cmd>Telescope help_tags<cr>",
              desc = "Find help",
          },
      },
      config = true,
  },
  {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
          require("telescope").setup({
              extensions = {
                  ["ui-select"] = {
                      require("telescope.themes").get_dropdown({
                          -- even more opts
                      }),
                  },
                  fzf = {
                      fuzzy = true, -- false will only do exact matching
                      override_generic_sorter = true, -- override the generic sorter
                      override_file_sorter = true, -- override the file sorter
                      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                      -- the default case_mode is "smart_case"
                  },
              },
              defaults = {
                  mappings = {
                      n = {
                          ["<c-d>"] = require("telescope.actions").delete_buffer,
                      },
                      i = {
                          ["<C-h>"] = "which_key",
                          ["<c-d>"] = require("telescope.actions").delete_buffer,
                      },
                  },
              },
          })
          require("telescope").load_extension("ui-select")
          require("telescope").load_extension("fzf")
      end,
  },
}
