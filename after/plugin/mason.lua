require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "cssls",
        "eslint",
        "svelte",
        "ts_ls",
        'emmet_ls'
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
}

vim.keymap.set("n", "<leader>pm", vim.cmd.Mason, { desc = "Open Mason Package Manager" })
