return {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {"go", "gomod", "gosum", "gowork", "lua", "markdown", "sql", "json", "yaml", "dockerfile"},
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)
  end,
}
