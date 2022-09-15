local status_ok, nvimtree = pcall(require, 'nvim-tree')
if not status_ok then return end

nvimtree.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = true,
  hijack_cursor = true,
  open_on_setup = true,
  sort_by = "extension",
  root_dirs = {},
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    adaptive_size = true,
    centralize_selection = false,
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "right",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,
    signcolumn = "auto",
    -- @deprecated
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {".git"},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    expand_all = {
      max_folder_discovery = 50,
      exclude = {".git", "target", "build"},
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
}
