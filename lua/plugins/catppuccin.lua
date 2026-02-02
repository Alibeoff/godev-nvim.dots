return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = false,
    
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = {
        enabled = true,
        style = "nvchad", -- или "classic"
      },
      treesitter = true,
      which_key = true,
      mason = true,
      notify = true,
      neotree = true,
      neotest = true,
      dap = true,
      dap_ui = true,
    }
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
    
    -- Принудительная прозрачность после загрузки
    vim.schedule(function()
      -- Основные группы
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      
      -- Терминал и флоат-окна
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatFooter", { bg = "none" })
      
      -- Рамки окон
      vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#585b70" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#585b70" })
      
      -- Строка статуса (если не используете lualine)
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
      
      -- Номера строк
      vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#6c7086" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", fg = "#f5c2e7" })
      
      -- Символы в конце буфера
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", fg = "#1e1e2e" })
      
      -- Дополнительные группы для плагинов
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none", fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "#89b4fa" })
      
      -- Для LSP и диагностики
      vim.api.nvim_set_hl(0, "DiagnosticFloatingBorder", { bg = "none", fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "LspInfoBorder", { bg = "none", fg = "#89b4fa" })
      
      -- Для всплывающего меню
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#585b70" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#89b4fa" })
    end)
  end,
}
