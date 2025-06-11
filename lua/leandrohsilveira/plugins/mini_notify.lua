return {
  'echasnovski/mini.notify',
  version = false,
  config = function()
    require('mini.notify').setup {
      lsp_progress = {
        enable = false
      }
    }
  end
}
