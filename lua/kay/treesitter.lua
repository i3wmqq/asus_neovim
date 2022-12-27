local treesitter_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status_ok then
  return
end

treesitter.setup({
  indent = {
    enable = true,
  },
  ensure_installed = { "c", "cpp", "markdown", "bash", "yaml", "html" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
})
