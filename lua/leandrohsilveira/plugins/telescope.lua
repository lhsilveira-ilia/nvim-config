return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find words using live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find previously opened files" })
      vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Find colorschemes" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
      vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Find symbols" })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP telescope actions",
        callback = function()
          vim.keymap.set(
            "n",
            "grd",
            builtin.lsp_definitions,
            { desc = "LSP: Go to definitions" }
          )
          vim.keymap.set(
            "n",
            "gri",
            builtin.lsp_implementations,
            { desc = "LSP: Go to implementations" }
          )
          vim.keymap.set("n", "grr", builtin.lsp_references, { desc = "Show LSP references" })
          vim.keymap.set(
            "n",
            "grc",
            builtin.lsp_incoming_calls,
            { desc = "LSP: Go to incoming calls" }
          )
        end,
      })
    end,
  },
}
