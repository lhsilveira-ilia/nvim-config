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
