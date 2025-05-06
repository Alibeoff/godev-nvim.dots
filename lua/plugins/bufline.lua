return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer" }
        },
        mappings = {
          next_buffer = "",
          prev_buffer = "",
        },
      },
    })
    -- Опционально: свои маппинги для переключения буферов
    vim.keymap.set("n", "<Leader>bn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
  end,
}
