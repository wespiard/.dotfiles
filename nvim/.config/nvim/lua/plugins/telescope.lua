return {
  "nvim-telescope/telescope-file-browser.nvim",
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
          },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
          },
        },
      })

      require("telescope").load_extension "file_browser"
    end,

    keys = {
      { "<leader>ff", ":Telescope find_files<CR>",   desc = "Telescope find files" },
      { "<leader>ft", ":Telescope live_grep<CR>",    desc = "Telescope find text" },
      { "<leader>fp", ":Telescope projects<CR>",     desc = "Telescope find project" },
      { "<leader>fb", ":Telescope buffers<CR>",      desc = "Telescope find buffer" },
      { "<leader>fe", ":Telescope file_browser<CR>", desc = "Telescope file browser" },
    },

    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}
