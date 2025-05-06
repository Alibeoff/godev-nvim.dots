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
  end,
}
