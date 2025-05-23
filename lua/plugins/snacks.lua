return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = {enabled = false},
    bigfile = { enabled = true },
    bufdelete = {enabled = false},
    dashboard = { enabled = true, sections = {
    { section = "header" },
    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    { section = "startup" },
    }
    },
    debug = {enabled = true},
    dim = {enabled = false},
    explorer = { enabled = false }, -- TODO: рассмотреть
    git = {enabled = false},
    gitbrowse = {enabled = false},
    image = {enabled = true},
    indent = { enabled = true },
    input = { enabled = true  },
    layout = {enabled = false},
    lazygit = {enabled = true},
    notifier = { enabled = false },
    notify = { enabled = false },
    picker = { enabled = true },
    profiler = {enabled = false},
    quickfile = { enabled = true },
    rename = {enabled = true},
    scope = { enabled = true },
    scratch = {enabled = false},
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    terminal = {enabled = true,win = {
      position = "float",
      border = "rounded",
    }},
    toggle = {enabled = false},
    util = {enabled = false},
    win = {enabled = false},
    words = { enabled = true },
    zen = {enabled = false},
    styles = {
      input = {
        relative = "cursor",
        row = -3,
        col = 0,
        title_pos = "left",
        width = 30,
      },
    },  
  },
  keys = {
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gd", function() Snacks.picker.lsp_definitions() end, nowait = true, desc = "Goto Definition" },
    {
     ";;",
      function() Snacks.terminal() end,
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>cr", function() Snacks.rename.rename_file() end, desc = "Rename File" },
  }
}
