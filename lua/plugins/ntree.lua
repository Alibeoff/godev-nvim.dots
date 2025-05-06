return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = true, -- скрывать файлы и папки с точкой в начале
      },
      actions = {
        open_file = {
          quit_on_open = true, -- закрывать после открытия файла
        },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "NvimTree",
      callback = function(args)
        local api = require("nvim-tree.api")

        -- l - открыть файл/папку (как <CR>)
        vim.keymap.set("n", "l", function()
          local node = api.tree.get_node_under_cursor()
          if node then
            api.node.open.edit()
          end
        end, { buffer = args.buf, noremap = true, silent = true })

        -- h - закрыть папку под курсором (если на папке)
        vim.keymap.set("n", "h", function()
          local node = api.tree.get_node_under_cursor()
          if node and node.nodes ~= nil then
            api.node.navigate.parent_close()
          end
        end, { buffer = args.buf, noremap = true, silent = true })

        -- hh - закрыть родительскую папку (вне зависимости от того, на файле или на папке)
        vim.keymap.set("n", "hh", function()
          api.node.navigate.parent_close()
        end, { buffer = args.buf, noremap = true, silent = true })

        -- <Leader>h - переключить показ скрытых файлов
        vim.keymap.set("n", "<Leader>h", function()
          api.tree.toggle_hidden_filter()
        end, { buffer = args.buf, noremap = true, silent = true })
      end,
    })
  end,
}
