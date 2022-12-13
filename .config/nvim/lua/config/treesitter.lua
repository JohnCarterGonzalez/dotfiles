require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "go" },
  highlight = {
    enable = true,
  },
})
