return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "sa", function()
      vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } } })
    end, { desc = "Go: Organize Imports" })
  end,
}
