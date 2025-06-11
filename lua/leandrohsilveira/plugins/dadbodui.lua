return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1

    vim.keymap.set("n", "<leader>cd", vim.cmd.DBUIToggle, { desc = "Toggle DBUI" })
    vim.keymap.set("n", "<leader>ca", vim.cmd.DBUIAddConnection, { desc = "Open DBUI add connection" })
  end,
}
