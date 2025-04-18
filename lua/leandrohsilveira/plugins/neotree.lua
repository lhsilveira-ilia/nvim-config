return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local neotree = require("neo-tree")

    neotree.setup {
      window = {
        position = "float",
      },
    }

    local function open_explorer()
      local reveal_file = vim.fn.expand('%:p')
      if reveal_file == nil then
        reveal_file = vim.fn.getcwd()
      end

      require("neo-tree.command").execute({
        action = "focus",
        reveal_file = reveal_file
      })
    end

    -- vim.keymap.set("n", "<leader>fe", "<Cmd>:Neotree position=float<CR>", { desc = "Open NeoTree file explorer" })
    vim.keymap.set("n", "<leader>fe", open_explorer, { desc = "Open NeoTree file explorer" })
    vim.keymap.set("n", "<C-e>", open_explorer, { desc = "Open NeoTree file explorer" })
  end
}
