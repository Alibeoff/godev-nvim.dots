return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    ft = { "go", "gomod" },
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormatOnSave", {})
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.go", "go.mod", "go.sum" },
        callback = function()
          require('go.format').gofmt()
           vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
        end,
        group = format_sync_grp,
      })
    end,
  },
}
