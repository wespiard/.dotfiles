local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
    'bash', 'bibtex', 'c', 'cmake', 'cpp', 'html', 'json',
    'julia', 'latex', 'lua', 'make', 'markdown', 'python',
    'rust', 'toml', 'verilog', 'vim', 'yaml'
  },
	highlight = { enable = true },
	indent = { enable = true },
	autopairs = { enable = true },
})
