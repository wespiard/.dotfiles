return {
  {
    "neovim/nvim-lspconfig",

    event = "BufReadPre",

    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        config = function()
          require("mason").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        event = "BufReadPre",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              "bashls",
              "jsonls",
              "tsserver",
              "julials",
              "lua_ls",
              "pyright",
              "rust_analyzer",
              "verible",
              "taplo"
            },
            automatic_installation = true,
          })
        end,
      },
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_installation = true,
      })

      -- This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        local lsp_map = require("config.keys").lsp_map

        lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
        lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
        lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
        lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")
        lsp_map("<leader>lf", vim.lsp.buf.format(), bufnr, "Format")

        lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
        lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
        lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
        lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
        lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")
      end

      -- Lua
      require("lspconfig")["lua_ls"].setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end
  }
}
