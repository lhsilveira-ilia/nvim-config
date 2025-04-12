local Terminal = require('toggleterm.terminal').Terminal

local floating_term = Terminal:new {
    display_name = 'Floating term',
    close_on_exit = true,
    direction = 'float',
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end
}

function OpenFloatingTerm()
    floating_term:toggle()
end

vim.keymap.set("n", "<leader>tr", '<Cmd>ToggleTerm<CR>', { desc = 'Open terminal' })
vim.keymap.set("n", "<leader>tf", '<Cmd>lua OpenFloatingTerm()<CR>', { desc = 'Open floating terminal' })
