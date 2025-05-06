return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "go", "gomod", "gosum", "gowork", "lua", "markdown", "sql", "json", "yaml", "dockerfile"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
