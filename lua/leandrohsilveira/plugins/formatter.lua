return {
  "stevearc/conform.nvim",
  config = function()
    -- Utilities for creating configurations
    -- local util = require "formatter.util"

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    local conform = require("conform")

    vim.keymap.set({ "n", "x" }, "<leader>lf", function()
      conform.format({ async = true })
    end, { desc = "LSP: Format" })

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua", stop_after_first = true },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        markdown = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
    })

    -- local buffer_autoformat = function(bufnr)
    --     local group = 'lsp_autoformat'
    --     vim.api.nvim_create_augroup(group, { clear = false })
    --     vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
    --
    --     vim.api.nvim_create_autocmd('BufWritePre', {
    --         buffer = bufnr,
    --         group = group,
    --         desc = 'LSP format on save',
    --         callback = function(event)
    --             conform.format({ bufnr = event.buf })
    --         end,
    --     })
    -- end
    --
    -- vim.api.nvim_create_autocmd('LspAttach', {
    --     callback = function(event)
    --         local id = vim.tbl_get(event, 'data', 'client_id')
    --         local client = id and vim.lsp.get_client_by_id(id)
    --         if client == nil then
    --             return
    --         end
    --
    --         -- make sure there is at least one client with formatting capabilities
    --         if client.supports_method('textDocument/formatting') then
    --             buffer_autoformat(event.buf)
    --         end
    --     end
    -- })
  end,
}
