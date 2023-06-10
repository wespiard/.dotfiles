return {
  {
    "nvim-treesitter/nvim-treesitter",
    name = "Tree-sitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      auto_install = true,
      ensure_installed = { 
        "bash", 
        "c", 
        "cpp", 
        "html", 
        "javascript", 
        "json", 
        "julia",
        "lua", 
        "make",
        "python",
        "rust",
        "toml",
        "verilog"
      },
      highlight = { enable = true, },
      indent = { enable = true, },
    },
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
