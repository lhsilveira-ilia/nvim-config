return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.keymap.set("n", "<leader>pm", vim.cmd.Mason, { desc = "Open Mason Package Manager" })

    -- NOTE: to make any of this work you need a language server.
    -- If you don't know what that is, watch this 5 min video:
    -- https://www.youtube.com/watch?v=LaS32vctfOY

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    -- local lspconfig = require("lspconfig")

    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
      require('lsp-file-operations').default_capabilities(),
      {
        workspace = {
          didChangeWatchedFiles = false,
        }
      }
    )

    vim.lsp.config('svelte', {
      capabilities = capabilities
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        }
      }
    })

    vim.lsp.config('emmet_ls', {
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "templ", "heex" },
    })

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local function opts(buffer, description)
          return { buffer = buffer, desc = description }
        end

        -- these keymaps are set using telescope
        -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts(event.buf, ""))
        -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts(event.buf, ""))
        -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts(event.buf, "LSP: Show references"))
        vim.keymap.set(
          "n",
          "K",
          "<cmd>lua vim.lsp.buf.hover()<cr>",
          opts(event.buf, "LSP: Hover symbol definition")
        )
        vim.keymap.set(
          "n",
          "gD",
          "<cmd>lua vim.lsp.buf.declaration()<cr>",
          opts(event.buf, "LSP: Go to declaration")
        )
        vim.keymap.set(
          "n",
          "go",
          "<cmd>lua vim.lsp.buf.type_definition()<cr>",
          opts(event.buf, "LSP: Go to type definition")
        )
        vim.keymap.set(
          "n",
          "gs",
          "<cmd>lua vim.lsp.buf.signature_help()<cr>",
          opts(event.buf, "LSP: Show signature help")
        )

        vim.keymap.set({ "n", "x" }, "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts(event.buf, "LSP: Rename"))
        vim.keymap.set(
          { "n", "x" },
          "<leader>lr",
          "<cmd>lua vim.lsp.buf.rename()<cr>",
          opts(event.buf, "LSP: Rename")
        )
        vim.keymap.set(
          { "n", "x" },
          "<leader>la",
          "<cmd>lua vim.lsp.buf.code_action()<cr>",
          opts(event.buf, "LSP: Code actions")
        )
        vim.keymap.set(
          { "n", "x" },
          "<leader>lA",
          '<cmd>lua vim.lsp.buf.code_action({ context = { only = { "source" } } })<cr>',
          opts(event.buf, "LSP: Code actions")
        )
      end,
    })

    local cmp = require("cmp")

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "codeium" }
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<Enter>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
      }),
    })
  end
}
