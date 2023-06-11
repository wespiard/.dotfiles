return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    -- "hrsh7th/cmp-path",
    -- "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
  },
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  config = function()
    local cmp = require("cmp")

    require("luasnip/loaders/from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            buffer = "[Buffer]",
            -- nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            -- nvim_lua = "[Lua]",
            -- latex_symbols = "[LaTeX]",
          })[entry.source.name]
          return vim_item
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'luasnip' },
        -- { name = 'nvim_lsp' },
      }, {
        { name = 'buffer', keyword_length = 5 },
      })
    })
  end,

}
