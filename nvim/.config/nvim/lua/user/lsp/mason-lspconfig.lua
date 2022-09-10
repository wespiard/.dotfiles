local status_ok, masonconfig = pcall(require, 'mason-lspconfig')
if not status_ok then return end

local status_ok2, lspconfig = pcall(require, "lspconfig")
if not status_ok2 then return end

masonconfig.setup = {
  ensure_installed = { "sumneko_lua", "pyright" },
  automatic_installation = true
}

masonconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {}
  end,

  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup{
      settings = {
        Lua = {
          format = {
            enable = true,
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }
  end,

  ["pyright"] = function()
    lspconfig.pyright.setup{
      }
  end,
}
