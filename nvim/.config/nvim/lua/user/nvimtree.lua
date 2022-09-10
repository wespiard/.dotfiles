local status_ok, nvimtree = pcall(require, 'nvim-tree')
if not status_ok then return end

nvimtree.setup({
  disable_netrw = true,
  hijack_cursor = true,

  sort_by = "extension",
  diagnostics = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  view = {
    side = "right",
  }
})
