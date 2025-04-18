return {
  'famiu/bufdelete.nvim',
  config = function()
    local bufdelete = require("bufdelete")

    local function close_buffer()
      bufdelete.bufdelete(0)
    end

    local function force_close_buffer()
      bufdelete.bufdelete(0, true)
    end

    vim.keymap.set("n", "<leader>q", close_buffer, { desc = "Close buffer" })
    vim.keymap.set("n", "<leader>Qq", force_close_buffer, { desc = "Force close buffer (discard changes)" })
  end
}
