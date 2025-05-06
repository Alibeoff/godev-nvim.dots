return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    ft = { "go", "gomod" },
    config = function()
      require("go").setup()

      local format_sync_grp = vim.api.nvim_create_augroup("GoFormatNormal", {})
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "i:n",
        callback = function()
          if vim.bo.filetype == "go" then
            require('go.format').gofmt()
          end
        end,
        group = format_sync_grp,
      })
    end,
  },
}
