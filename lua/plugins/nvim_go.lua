return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    ft = { "go", "gomod" },
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormatOnSave", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.go", "go.mod" },
        callback = function()
          require('go.format').gofmt()
        end,
        group = format_sync_grp,
      })
    end,
  },
}
