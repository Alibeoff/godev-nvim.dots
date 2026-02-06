return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,

  -- Опции для настройки Catppuccin
  opts = {
    flavour = "mocha", -- Указываем вариант темы
    transparent_background = true,
    show_end_of_buffer = false,

    -- Интеграции с плагинами
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      treesitter = true,
      which_key = true,
      mason = true,
      notify = true,
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      neotest = true,
      dap = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    },

    -- Дополнительные стили
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },

    -- Кастомные хайлайты
    custom_highlights = function(colors)
      return {
        -- Кастомные бордеры
        FloatBorder = { fg = colors.blue },
        TelescopeBorder = { bg = "NONE", fg = colors.blue },
        TelescopePromptBorder = { bg = "NONE", fg = colors.blue },
        TelescopeResultsBorder = { bg = "NONE", fg = colors.blue},
        TelescopePreviewBorder = { bg = "NONE", fg = colors.blue},
        DiagnosticFloatingBorder = { fg = colors.blue },
        LspInfoBorder = { fg = colors.blue },

        -- Кастомные фоны для плавающих окон
        TelescopeNormal = { bg = "NONE" },
        TelescopePromptNormal = { bg = "NONE" },
        TelescopeResultsNormal = { bg = "NONE" },
        TelescopePreviewNormal = { bg = "NONE" },

        -- Лучшие настройки для прозрачности
        NormalFloat = { bg = "none" },
        FloatTitle = { bg = "none" },
        FloatFooter = { bg = "none" },

        -- Разделители окон
        WinSeparator = { fg = colors.surface2 },
        VertSplit = { fg = colors.surface2 },

        -- Строка статуса
        StatusLine = { bg = "none" },
        StatusLineNC = { bg = "none" },

        -- Номера строк
        LineNr = { fg = colors.overlay0 },
        CursorLineNr = { fg = colors.lavender },

        -- Символы в конце буфера
        EndOfBuffer = { fg = colors.base },
      }
    end,
  },

  -- Конфигурация
  config = function(_, opts)
    -- 1. Сначала настраиваем Catppuccin
    require("catppuccin").setup(opts)

    -- 2. Устанавливаем цветовую схему
    vim.cmd.colorscheme("catppuccin")

    -- 3. После загрузки темы применяем дополнительные настройки прозрачности
    vim.schedule(function()
      -- Основные группы для полной прозрачности
      local transparent_groups = {
        "Normal", "NormalNC", "NormalFloat", "FloatBorder",
        "FloatTitle", "FloatFooter", "StatusLine", "StatusLineNC",
        "WinSeparator", "VertSplit", "LineNr", "CursorLineNr",
        "EndOfBuffer", "Pmenu", "PmenuSbar", "PmenuThumb",
        "TelescopeNormal", "TelescopeBorder", "TelescopePromptBorder",
        "TelescopeResultsBorder", "TelescopePreviewBorder",
        "DiagnosticFloatingBorder", "LspInfoBorder",
        "NotifyINFOBorder", "NotifyWARNBorder", "NotifyDEBUGBorder",
        "NotifyERRORBorder", "NvimTreeNormal", "NvimTreeNormalNC",
        "NvimTreeEndOfBuffer", "MasonNormal", "WhichKeyFloat",
      }

      for _, group in ipairs(transparent_groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
        hl.bg = hl.bg and "none" or nil
        vim.api.nvim_set_hl(0, group, hl)
      end

      -- Специальные настройки для Pmenu
      vim.api.nvim_set_hl(0, "PmenuSel", {
        bg = opts.integrations.native_lsp.enabled and "#585b70" or "#313244",
        fg = "none",
      })

      -- Убедимся, что Treesitter использует наши цвета
      if opts.integrations.treesitter then
        vim.api.nvim_set_hl(0, "@variable", { fg = opts.flavour == "mocha" and "#cdd6f4" or "#4c4f69" })
        vim.api.nvim_set_hl(0, "@function", { fg = opts.flavour == "mocha" and "#89b4fa" or "#1e66f5" })
        vim.api.nvim_set_hl(0, "@keyword", { fg = opts.flavour == "mocha" and "#cba6f7" or "#8839ef" })
      end

      -- Для Go-разработки - дополнительные хайлайты
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.treesitter.start()
        end,
      })
    end)
  end,

  -- Инициализация перед загрузкой
  init = function()
    -- Устанавливаем глобальные переменные ДО загрузки плагина
    vim.g.catppuccin_flavour = "mocha"

    -- Предотвращаем мигание при загрузке
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
        vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
      end,
    })
  end,
}
