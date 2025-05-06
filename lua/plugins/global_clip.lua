-- Для lazy.nvim
return {
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup()
      vim.keymap.set('v', 'gy', require('osc52').copy_visual)
      vim.keymap.set('n', 'gy', require('osc52').copy_operator, {expr = true})
    end,
  }
}
